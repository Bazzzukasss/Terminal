#include "UIControllerTerminal.h"
#include <QDebug>

UIControllerTerminal::UIControllerTerminal(QObject *parent)
    : UIController(parent)
{
}

bool UIControllerTerminal::isPinGood(const QString &aPin)
{
    mpUILogic->showMessage(Messenger::MT_WAITING,"Data in proccess...",3000);
    return aPin == "123";
}

void UIControllerTerminal::actionPayment(const QString &aAction)
{
    qDebug() << aAction;
}

int UIControllerTerminal::getCardMode() const
{
    return mCardMode;
}

QString UIControllerTerminal::getCardState() const
{
    return mCardState;
}

double UIControllerTerminal::getPrice() const
{
    return mPrice;
}

bool UIControllerTerminal::getCardPresent() const
{
    return mIsCardPresent;
}

QString UIControllerTerminal::getProductName() const
{
    return mProductName;
}

void UIControllerTerminal::setCardMode(int cardMode)
{
    mCardMode = cardMode;
    emit signalCardModeChanged(mCardMode);
}

void UIControllerTerminal::setCardState(QString cardState)
{
    mCardState = cardState;
    emit signalCardStateChanged(mCardState);
}

void UIControllerTerminal::setPrice(double price)
{
    mPrice = price;
    emit signalPriceChanged(mPrice);
}

void UIControllerTerminal::setCardPresent(bool isCardPresent)
{
    mIsCardPresent = isCardPresent;
    emit signalCardPresentChanged(mIsCardPresent);
}

void UIControllerTerminal::setProductName(QString productName)
{
    mProductName = productName;
    emit signalProductNameChanged(mProductName);
}
