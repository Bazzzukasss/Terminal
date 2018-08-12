#include "CoreEmulator.h"
#include <QTimer>
#include <QEventLoop>

CoreEmulator::CoreEmulator(QObject *parent)
    : Core(parent)
{
}

bool CoreEmulator::checkPinCode(const QString &aPinCode)
{
    proccessEmulation();
    return aPinCode == "1111";
}

bool CoreEmulator::doPayment()
{
    proccessEmulation();
    return true;
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

void CoreEmulator::proccessEmulation(int aTime)
{
    QEventLoop loop;
    QTimer timer;
    timer.setSingleShot(true);
    QObject::connect(&timer, &QTimer::timeout, [&](){ loop.quit(); });
    timer.start(aTime);
    loop.exec();
}
