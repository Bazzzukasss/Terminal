#include "VideoPlayer.h"
#include <QPixmap>

#define USE_PLAYLIST

VideoPlayer::VideoPlayer(QWidget *parent)
    : QVideoWidget(parent)
    , mediaPlayer(0, QMediaPlayer::VideoSurface)
{
    mRewindWidget.setWindowFlags(Qt::FramelessWindowHint);
    mediaPlayer.setVideoOutput(this);

#ifdef USE_PLAYLIST
    mediaPlayer.setPlaylist(&playList);
    connect(&mediaPlayer,&QMediaPlayer::mediaStatusChanged,this,[&](QMediaPlayer::MediaStatus status){
                                                                                                        if(status == QMediaPlayer::EndOfMedia)
                                                                                                        {
                                                                                                           mRewindWidget.show();
                                                                                                           mRewindWidget.raise();

                                                                                                        }
                                                                                                    });

    connect(&mediaPlayer,&QMediaPlayer::positionChanged,this,[&](qint64 pos){
                                                                                if(mRewindWidget.isVisible() && pos >= 0)
                                                                                    mRewindWidget.hide();
                                                                            });
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

void VideoPlayer::loadFile(const QString &aMediaFilename, const QString &aRewindFilename)
{
    #ifdef USE_PLAYLIST
        playList.addMedia(QUrl::fromLocalFile(aMediaFilename));
        playList.setCurrentIndex(0);
        playList.setPlaybackMode(QMediaPlaylist::Loop);
    #else
        mediaPlayer.setMedia(QUrl(aMediaFilename) );
    #endif
        qDebug()<<aRewindFilename;
    if(!aRewindFilename.isEmpty())
        mRewindWidget.setPixmap(QPixmap(aRewindFilename));

    mRewindWidget.show();
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


void VideoPlayer::resizeEvent(QResizeEvent *event)
{
    mRewindWidget.setGeometry(this->geometry());
}
