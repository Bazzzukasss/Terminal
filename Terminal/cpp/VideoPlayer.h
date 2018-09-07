#ifndef VIDEOPLAYER_H
#define VIDEOPLAYER_H

#include <qmediaplayer.h>

#include <QtGui/QMovie>
#include <QVideoWidget>
#include <QMediaPlaylist>
#include <QLabel>

class VideoPlayer : public QVideoWidget
{
    Q_OBJECT
public:
    VideoPlayer(QWidget *parent = 0);
    ~VideoPlayer();

    void loadFile(const QString& aMediaFilename,const QString& aRewindFilename="");

signals:
    void signalClicked(QVariant);

protected:
    void mousePressEvent(QMouseEvent *event) override;
    void showEvent(QShowEvent *event) override;
    void hideEvent(QHideEvent *event) override;
    void resizeEvent(QResizeEvent *event) override;

private:
    QLabel mRewindWidget;
    QMediaPlayer mediaPlayer;
    QMediaPlaylist playList;

};

#endif
