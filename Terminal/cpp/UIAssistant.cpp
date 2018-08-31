#include "UIAssistant.h"
#include <QFileInfo>
#include <QDebug>
#include <QSettings>

UIAssistant::UIAssistant(QObject *parent)
    : QObject(parent)
{
    initialize();
}

void UIAssistant::initialize()
{
    auto settings = new QSettings("config.ini",QSettings::IniFormat,this);

    mIsDebugVersion = settings->value("isDebugVersion",false).toBool();
    mPathToVideo = settings->value("pathToVideo","").toString();
}

bool UIAssistant::isFileExists(const QString &aFilename)
{
    return QFileInfo(aFilename).exists();
}

bool UIAssistant::isDebugVersion() const
{
    return mIsDebugVersion;
}

QString UIAssistant::getPathToVideo() const
{
    return mPathToVideo;
}
