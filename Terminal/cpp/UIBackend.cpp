#include "UIBackend.h"

UIBackend::UIBackend(QObject* parent)
    : QObject(parent)
    , mpUILogic(nullptr)
{
}

void UIBackend::setUILogic(UILogic *apUILogic)
{
    mpUILogic = apUILogic;
}
