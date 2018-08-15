#include "UIBackend.h"
#include "Core.h"
#include "UIMessenger.h"
#include "UILogic.h"
#include <QDebug>

UIBackend::UIBackend(Core *apCore, QObject* parent)
    : QObject(parent)
    , mpUILogic(nullptr)
    , mpCore(apCore)
{
    initialize();
}

void UIBackend::setUILogic(UILogic *apUILogic)
{
    mpUILogic = apUILogic;
}

void UIBackend::initialize()
{
    connect(mpCore, &Core::signalCardModeChanged,       this, &UIBackend::setCardMode);
    connect(mpCore, &Core::signalCardStateChanged,      this, &UIBackend::setCardState);
    connect(mpCore, &Core::signalProductPriceChanged,   this, &UIBackend::setProductPrice);
    connect(mpCore, &Core::signalError,                 this, &UIBackend::error);
}

bool UIBackend::doPayment(const QString& aPinCode)
{
    mpUILogic->showMessage(UIMessenger::MT_WAITING, tr("Please wait.\nTransaction in progress."), -1, false);

    bool result = mpCore->checkPinCode(aPinCode);
    if( result )
        result = mpCore->doPayment();

    mpUILogic->hideMessage();

    return result;
}

bool UIBackend::refreshData()
{
    if( !mpCore->refreshData() ) return false;
    return true;
}

void UIBackend::error(const QString &aInformation)
{
    mpUILogic->showMessage(UIMessenger::MT_ERROR, aInformation);
}

int UIBackend::getCardMode() const
{
    return mCardMode;
}

QString UIBackend::getCardState() const
{
    return mCardState;
}

double UIBackend::getProductPrice() const
{
    return mProductPrice;
}

bool UIBackend::getCardPresent() const
{
    return mIsCardPresent;
}

void UIBackend::setCardMode(int aCardMode)
{
    mCardMode = aCardMode;
    emit signalCardModeChanged(mCardMode);
}

void UIBackend::setCardState(QString aCardState)
{
    mCardState = aCardState;
    emit signalCardStateChanged(mCardState);
}

void UIBackend::setProductPrice(double aPrice)
{
    mProductPrice = aPrice;
    emit signalProductPriceChanged(mProductPrice);
}

void UIBackend::setCardPresent(bool aIsCardPresent)
{
    qDebug()<<"CARD:"<<aIsCardPresent;
    mIsCardPresent = aIsCardPresent;
    emit signalCardPresentChanged(mIsCardPresent);
}
