#include "UIBackendEmulator.h"
#include "UILogic.h"
#include <QDebug>

UIBackendEmulator::UIBackendEmulator(QObject *parent)
    :UIBackendTerminal(parent)
{
}

bool UIBackendEmulator::checkPinCode(const QString &aPin)
{
    mpUILogic->showMessage(Messenger::MT_WAITING, tr("Please, waiting.\nTransaction is in process."), 3000);
    return aPin == "1111";
}

bool UIBackendEmulator::doPayment()
{
    return true;
}

bool UIBackendEmulator::detectCreditCard()
{
    setCardState( tr("Payment method") );
    setCardMode( rand()*2 / RAND_MAX + 1);

    switch(getCardMode())
    {
        case 1:setCardState( tr("Using chip") ); break;
        case 2:setCardState( tr("Using stripe") ); break;
        case 3:setCardState( tr("Using NFC") ); break;
        default: setCardState( tr("Unknown payment method")); break;
    }
    return true;
}

bool UIBackendEmulator::requestProductPrice()
{
    setProductPrice( (rand()*1000 / RAND_MAX) / 10.0);
    return true;
}

bool UIBackendEmulator::requestProductName()
{
    setProductName( "Product Name" + QString::number(rand()*1000 / RAND_MAX) );
    return true;
}

