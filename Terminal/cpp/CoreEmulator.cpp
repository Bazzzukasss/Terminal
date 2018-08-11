#include "CoreEmulator.h"

CoreEmulator::CoreEmulator(QObject *parent)
    : Core(parent)
{
}

bool CoreEmulator::checkPinCode(const QString &aPinCode)
{
    return aPinCode == "1111";
}

bool CoreEmulator::doPayment()
{
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
}
