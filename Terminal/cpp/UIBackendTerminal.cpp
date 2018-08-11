#include "UIBackendTerminal.h"
#include "UILogic.h"

UIBackendTerminal::UIBackendTerminal(QObject *parent)
    : UIBackend(parent)
{
}

bool UIBackendTerminal::isPinGood(const QString&)
{
    return false;
}

void UIBackendTerminal::actionPayment(const QString&)
{
}

int UIBackendTerminal::getCardMode() const
{
    return mCardMode;
}

QString UIBackendTerminal::getCardState() const
{
    return mCardState;
}

double UIBackendTerminal::getPrice() const
{
    return mPrice;
}

bool UIBackendTerminal::getCardPresent() const
{
    return mIsCardPresent;
}

QString UIBackendTerminal::getProductName() const
{
    return mProductName;
}

void UIBackendTerminal::setCardMode(int cardMode)
{
    mCardMode = cardMode;
    emit signalCardModeChanged(mCardMode);
}

void UIBackendTerminal::setCardState(QString cardState)
{
    mCardState = cardState;
    emit signalCardStateChanged(mCardState);
}

void UIBackendTerminal::setPrice(double price)
{
    mPrice = price;
    emit signalPriceChanged(mPrice);
}

void UIBackendTerminal::setCardPresent(bool isCardPresent)
{
    mIsCardPresent = isCardPresent;
    emit signalCardPresentChanged(mIsCardPresent);
}

void UIBackendTerminal::setProductName(QString productName)
{
    mProductName = productName;
    emit signalProductNameChanged(mProductName);
}
