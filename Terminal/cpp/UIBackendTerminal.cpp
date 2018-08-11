#include "UIBackendTerminal.h"
#include "UILogic.h"

UIBackendTerminal::UIBackendTerminal(QObject *parent)
    : UIBackend(parent)
{
}

bool UIBackendTerminal::checkPinCode(const QString&)
{
    return false;
}

bool UIBackendTerminal::detectCreditCard()
{
    return false;
}

bool UIBackendTerminal::requestProductPrice()
{
    return false;
}

bool UIBackendTerminal::requestProductName()
{
    return false;
}

bool UIBackendTerminal::requestData()
{
    if( !requestProductPrice() ) return false;
    if( !requestProductName() ) return false;
    return true;
}

bool UIBackendTerminal::doPayment()
{
    return false;
}

int UIBackendTerminal::getCardMode() const
{
    return mCardMode;
}

QString UIBackendTerminal::getCardState() const
{
    return mCardState;
}

double UIBackendTerminal::getProductPrice() const
{
    return mProductPrice;
}

bool UIBackendTerminal::getCardPresent() const
{
    return mIsCardPresent;
}

QString UIBackendTerminal::getProductName() const
{
    return mProductName;
}

void UIBackendTerminal::setCardMode(int aCardMode)
{
    mCardMode = aCardMode;
    emit signalCardModeChanged(mCardMode);
}

void UIBackendTerminal::setCardState(QString aCardState)
{
    mCardState = aCardState;
    emit signalCardStateChanged(mCardState);
}

void UIBackendTerminal::setProductPrice(double aPrice)
{
    mProductPrice = aPrice;
    emit signalProductPriceChanged(mProductPrice);
}

void UIBackendTerminal::setCardPresent(bool aIsCardPresent)
{
    mIsCardPresent = aIsCardPresent;
    emit signalCardPresentChanged(mIsCardPresent);
}

void UIBackendTerminal::setProductName(QString aProductName)
{
    mProductName = aProductName;
    emit signalProductNameChanged(mProductName);
}
