#include "UIController.h"
#include <QFileInfo>

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

