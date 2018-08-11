#include "UIBackend.h"
#include "Core.h"

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
    connect(mpCore, &Core::signalProductNameChanged,    this, &UIBackend::setProductName);
    connect(mpCore, &Core::signalProductPriceChanged,   this, &UIBackend::setProductPrice);
}

bool UIBackend::checkPinCode(const QString& aPinCode)
{
    return mpCore->checkPinCode(aPinCode);
}

bool UIBackend::doPayment()
{
    return mpCore->doPayment();
}

bool UIBackend::refreshData()
{
    return mpCore->refreshData();
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

QString UIBackend::getProductName() const
{
    return mProductName;
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
    mIsCardPresent = aIsCardPresent;
    emit signalCardPresentChanged(mIsCardPresent);
}

void UIBackend::setProductName(QString aProductName)
{
    mProductName = aProductName;
    emit signalProductNameChanged(mProductName);
}
