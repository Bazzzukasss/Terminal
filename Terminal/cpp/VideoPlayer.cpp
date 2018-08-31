#include "VideoPlayer.h"

VideoPlayer::VideoPlayer(QWidget *parent)
    : QVideoWidget(parent)
    , mediaPlayer(0, QMediaPlayer::VideoSurface)
{
    mediaPlayer.setVideoOutput(this);
}

VideoPlayer::~VideoPlayer()
{
}

void VideoPlayer::loadFile(const QString &aFilename)
{
    mediaPlayer.setMedia(QUrl(aFilename) );
    mediaPlayer.play();
}

void VideoPlayer::mousePressEvent(QMouseEvent *event)
{
    hide();
    emit signalClicked("MENU_CARD");
    QVideoWidget::mousePressEvent(event);
}

void VideoPlayer::showEvent(QShowEvent *event)
{
    raise();
    mediaPlayer.play();
    QVideoWidget::showEvent(event);
}

void VideoPlayer::hideEvent(QHideEvent *event)
{
    mediaPlayer.stop();
    QVideoWidget::hideEvent(event);
}
