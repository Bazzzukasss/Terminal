#ifndef UIBACKEND_H
#define UIBACKEND_H

#include <QObject>
class UILogic;

class UIBackend: public QObject
{
    Q_OBJECT

public:
    UIBackend(QObject* parent = nullptr);

    void setUILogic(UILogic* apUILogic);

protected:
    UILogic* mpUILogic;
};

#endif // UIBACKEND_H
