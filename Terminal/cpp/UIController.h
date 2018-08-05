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
    Q_INVOKABLE bool isPinGood(const QString& aPin);

    Q_PROPERTY(int cardMode READ getCardMode WRITE setCardMode NOTIFY signalCardModeChanged)
    Q_PROPERTY(QString cardState READ getCardState WRITE setCardState NOTIFY signalCardStateChanged)
    Q_PROPERTY(double price READ getPrice WRITE setPrice NOTIFY signalPriceChanged)
    Q_PROPERTY(bool isCardPresent READ getCardPresent WRITE setCardPresent NOTIFY signalCardPresentChanged)

    int getCardMode() const;
    QString getCardState() const;
    double getPrice() const;
    bool getCardPresent() const;

public slots:
    void setCardMode(int cardMode);
    void setCardState(QString cardState);
    void setPrice(double price);
    void setCardPresent(bool isCardPresent);

signals:
    void signalCardModeChanged(int);
    void signalCardStateChanged(const QString&);
    void signalPriceChanged(double);
    void signalCardPresentChanged(bool);

private:
    int mCardMode{1};
    QString mCardState{tr("Card is present")};
    double mPrice{12.5f};
    bool mIsCardPresent{true};
};

#endif//UICONTROLLER_H
