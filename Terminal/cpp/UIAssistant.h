#ifndef UIASSISTANT_H
#define UIASSISTANT_H

#include <QObject>

class UIAssistant: public QObject
{
	Q_OBJECT

public:
    UIAssistant(QObject* parent = nullptr);

    Q_INVOKABLE bool isFileExists(const QString& aFilename);
    Q_INVOKABLE bool isDebugVersion() const;
    Q_INVOKABLE QString getPathToVideo() const;
    Q_INVOKABLE QString getPathToRewindPicture() const;


private:
    bool mIsDebugVersion{false};
    QString mPathToVideo{"video.gif"};
    QString mPathToRewindPicture;
    void initialize();
};

#endif//UIASSISTANT_H
