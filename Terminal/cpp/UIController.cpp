#include "UIController.h"
#include <QFileInfo>
#include <QDebug>

UIController::UIController(QObject *parent)
    :QObject(parent)
{}

bool UIController::isFileExists(const QString &aFilename)
{
    return QFileInfo(aFilename).exists();
}

bool UIController::isReleaseVersion()
{
    return false;
}

bool UIController::isPinGood(const QString &aPin)
{
    qDebug()<<"PIN:"<<aPin;
    return aPin == "123";
}

int UIController::getCardMode() const
{
    return mCardMode;
}

QString UIController::getCardState() const
{
    return mCardState;
}

double UIController::getPrice() const
{
    return mPrice;
}

bool UIController::getCardPresent() const
{
    return mIsCardPresent;
}

void UIController::setCardMode(int cardMode)
{
    mCardMode = cardMode;
    emit signalCardModeChanged(mCardMode);
}

void UIController::setCardState(QString cardState)
{
    mCardState = cardState;
    emit signalCardStateChanged(mCardState);
}

void UIController::setPrice(double price)
{
    mPrice = price;
    emit signalPriceChanged(mPrice);
}

void UIController::setCardPresent(bool isCardPresent)
{
    mIsCardPresent = isCardPresent;
    emit signalCardPresentChanged(mIsCardPresent);
}

