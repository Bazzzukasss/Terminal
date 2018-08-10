#include "UIAssistant.h"
#include <QFileInfo>
#include <QDebug>

UIAssistant::UIAssistant(QObject *parent)
    : QObject(parent)
{}

bool UIAssistant::isFileExists(const QString &aFilename)
{
    return QFileInfo(aFilename).exists();
}

bool UIAssistant::isReleaseVersion()
{
    return false;
}
