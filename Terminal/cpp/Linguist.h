#ifndef LINGUIST_H
#define LINGUIST_H
#pragma once

#include <QtWidgets/QApplication>
#include <QTranslator>
#include <QString>
#include <QMap>
#include <QVector>
#include <QObject>

struct LanguageData
{
	QString mLanguageName;
	QString mFileName;
	QString mLocaleName;
	QString mIcon;
};

class Linguist: public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY signalLanguageChanged)//This is a trick to get the whole expression to be reevaluated whenever the property emptyString changes. When not using this trick, QDeclarativeEngine will not know that it should reevaluate the text and do the translation.

	static Linguist* getInstance();

	void addLanguage(const LanguageData& langData);
	
    Q_INVOKABLE void setCurrentLanguage();

    Q_INVOKABLE void setCurrentLanguage(const QString& langName);

    Q_INVOKABLE void setCurrentLanguage(int langIndex);

	void setTranslator(QTranslator* translator);

	void setApplication(QApplication* application);

	QString currentLanguageName();

	int currentLanguageIndex();

	QList< QPair<QString,QString>> getLanguagesList();

    QString getEmptyString();

signals:
    void signalLanguageChanged();

private:
	QTranslator* mTranslator{nullptr};
	QApplication* mApplication{qApp};
	QVector < LanguageData > mLanguages;
	Linguist();
	Linguist( const Linguist& );
	Linguist& operator=( Linguist& );
	static Linguist* mInstance;
	QString mCurrentLanguageName;
	int mCurrentLanguageIndex;

    bool applyCurrentLanguage(const QString& langName, const QString& fileName,int langIndex);
};

#endif
