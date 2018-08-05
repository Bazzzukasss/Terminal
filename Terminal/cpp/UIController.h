#ifndef UICONTROLLER_H
#define UICONTROLLER_H

#include <QObject>

class UIController: public QObject
{
	Q_OBJECT

public:
    UIController(QObject* parent = nullptr);

    Q_INVOKABLE bool isFileExists(const QString& aFilename);
    Q_INVOKABLE bool isReleaseVersion();

    Q_PROPERTY(int cardMode READ getCardMode WRITE setCardMode NOTIFY signalCardModeChanged)
    Q_PROPERTY(QString cardState READ getCardState WRITE setCardState NOTIFY signalCardStateChanged)
    Q_PROPERTY(double price READ getPrice WRITE setPrice NOTIFY signalPriceChanged)

    int getCardMode() const;
    QString getCardState() const;
    double getPrice() const;

public slots:
    void setCardMode(int cardMode);
    void setCardState(QString cardState);
    void setPrice(double price);

signals:
    void signalCardModeChanged(int);
    void signalCardStateChanged(const QString&);
    void signalPriceChanged(double);

private:
    int mCardMode{1};
    QString mCardState{tr("Card is absent")};
    double mPrice{0.0f};
};

#endif//UICONTROLLER_H
