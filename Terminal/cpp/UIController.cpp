#include "UIController.h"
#include <QFileInfo>
#include <QDebug>

UIController::UIController(QObject *parent)
    : QObject(parent)
    , mpUILogic(nullptr)
{}

void UIController::setUILogic(UILogic *apUILogic)
{
    mpUILogic = apUILogic;
}

bool UIController::isFileExists(const QString &aFilename)
{
    return QFileInfo(aFilename).exists();
}

bool UIController::isReleaseVersion()
{
    return false;
}
