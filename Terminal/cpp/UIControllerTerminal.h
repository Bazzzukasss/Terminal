#ifndef UICONTROLLERTERMINAL_H
#define UICONTROLLERTERMINAL_H

#include "UIController.h"

class UIControllerTerminal : public UIController
{
    Q_OBJECT

public:
    UIControllerTerminal(QObject* parent = nullptr);
    Q_INVOKABLE bool isPinGood(const QString& aPin);
    Q_INVOKABLE void actionPayment(const QString& aAction);

    Q_PROPERTY(int cardMode READ getCardMode WRITE setCardMode NOTIFY signalCardModeChanged)
    Q_PROPERTY(QString cardState READ getCardState WRITE setCardState NOTIFY signalCardStateChanged)
    Q_PROPERTY(double price READ getPrice WRITE setPrice NOTIFY signalPriceChanged)
    Q_PROPERTY(bool isCardPresent READ getCardPresent WRITE setCardPresent NOTIFY signalCardPresentChanged)
    Q_PROPERTY(QString productName READ getProductName WRITE setProductName NOTIFY signalProductNameChanged)

    int getCardMode() const;
    QString getCardState() const;
    double getPrice() const;
    bool getCardPresent() const;    
    QString getProductName() const;

public slots:
    void setCardMode(int cardMode);
    void setCardState(QString cardState);
    void setPrice(double price);
    void setCardPresent(bool isCardPresent);    
    void setProductName(QString productName);

signals:
    void signalCardModeChanged(int);
    void signalCardStateChanged(const QString&);
    void signalPriceChanged(double);
    void signalCardPresentChanged(bool);    
    void signalProductNameChanged(const QString& productName);

private:
    int mCardMode{0};
    QString mCardState{tr("Payment method")};
    double mPrice{12.5f};
    bool mIsCardPresent{false};
    QString mProductName{"Product Name"};
};

#endif // UICONTROLLERTERMINAL_H
