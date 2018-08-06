#ifndef UICONTROLLER_H
#define UICONTROLLER_H

#include <QObject>
#include "UILogic.h"

class UIController: public QObject
{
	Q_OBJECT

public:
    UIController(QObject* parent = nullptr);

    void setUILogic(UILogic *apUILogic);

    Q_INVOKABLE bool isFileExists(const QString& aFilename);
    Q_INVOKABLE bool isReleaseVersion();

protected:
    UILogic* mpUILogic;

};

#endif//UICONTROLLER_H
