#include "VideoPlayer.h"

#define USE_PLAYLIST

VideoPlayer::VideoPlayer(QWidget *parent)
    : QVideoWidget(parent)
    , mediaPlayer(0, QMediaPlayer::VideoSurface)
{
    mediaPlayer.setVideoOutput(this);

#ifdef USE_PLAYLIST
    mediaPlayer.setPlaylist(&playList);
#else
    connect(&mediaPlayer,&QMediaPlayer::mediaStatusChanged,this,[&](QMediaPlayer::MediaStatus status){
                                                                                                        if(status == QMediaPlayer::EndOfMedia)
                                                                                                        {
                                                                                                            mediaPlayer.setPosition(0);
                                                                                                            //mediaPlayer.play();
                                                                                                        }
                                                                                                    });

    connect(&mediaPlayer,&QMediaPlayer::positionChanged,this,[&](qint64 pos){ if(pos == 0) mediaPlayer.play(); });
#endif
}

VideoPlayer::~VideoPlayer()
{
}

void VideoPlayer::loadFile(const QString &aFilename)
{
    #ifdef USE_PLAYLIST
        playList.addMedia(QUrl::fromLocalFile(aFilename));
        playList.setCurrentIndex(0);
        playList.setPlaybackMode(QMediaPlaylist::Loop);
    #else
        mediaPlayer.setMedia(QUrl(aFilename) );
    #endif
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
