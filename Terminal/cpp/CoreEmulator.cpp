#include "CoreEmulator.h"
#include <QTimer>
#include <QEventLoop>
#include <QDebug>
#include <QSettings>

CoreEmulator::CoreEmulator(QObject *parent)
    : Core(parent)
    , mCorrectPinCode("1111")
    , mIsProccessing{false}
{
     auto settings = new QSettings("config.ini",QSettings::IniFormat,this);

     mCorrectPinCode = settings->value("CorrectPinCode","1111").toString();
}

bool CoreEmulator::checkPinCode(const QString &aPinCode)
{
    bool result = proccessEmulation();
    qDebug()<<"UserPinCode: " << aPinCode << " CorrectPinCode: " << mCorrectPinCode;
    return (aPinCode == mCorrectPinCode) && result;
}

bool CoreEmulator::doPayment()
{
    bool result = proccessEmulation();
    qDebug()<<"doPayment";
    //emit signalError("Core payment error!");
    return result;
}

bool CoreEmulator::refreshData()
{
    double productPrice = (rand()*1000 / RAND_MAX) / 10.0;
    QString productName = "Product Name" + QString::number(rand()*1000 / RAND_MAX);
    QString cardState("Payment method");
    int cardMode = rand()*2 / RAND_MAX + 1;

    switch(cardMode)
    {
        case 1: cardState = tr("Using chip"); break;
        case 2: cardState = tr("Using stripe"); break;
        case 3: cardState = tr("Using NFC"); break;
        default: cardState = tr("Unknown payment method"); break;
    }

    emit signalCardModeChanged(cardMode);
    emit signalCardStateChanged(cardState);
    emit signalProductNameChanged(productName);
    emit signalProductPriceChanged(productPrice);
    return true;
}

bool CoreEmulator::proccessEmulation(int aTime)
{
    QEventLoop loop;
    QTimer timer;
    bool result(true);

    timer.setSingleShot(true);
    connect(&timer, &QTimer::timeout, [&](){ loop.quit(); });
    connect(this,&CoreEmulator::signalAbortProcess, [&](){ if(mIsProccessing) {result = false; loop.quit();} });
    timer.start(aTime);
    mIsProccessing = true;
    loop.exec();
    mIsProccessing = false;

    return result;
}
