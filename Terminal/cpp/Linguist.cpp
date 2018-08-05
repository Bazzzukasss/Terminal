#include "Linguist.h"
#include <QDebug>

Linguist* Linguist::mInstance = 0;

Linguist* Linguist::getInstance()
{
	if (!mInstance)
		mInstance = new Linguist();
	return mInstance;
}

void Linguist::addLanguage(const LanguageData& langData)
{
	mLanguages.push_back(langData);
}

void Linguist::setCurrentLanguage(const QString& langName)
{
	int index(0);
	for (auto& language : mLanguages)
	{
		if (language.mLanguageName == langName)
            applyCurrentLanguage(language.mLanguageName,language.mFileName,index);
		index++;
	}
}

void Linguist::setCurrentLanguage()
{
	int index(0);
	for (auto& language : mLanguages)
	{
		if (language.mLocaleName == QLocale::system().name())
            applyCurrentLanguage(language.mLanguageName,language.mFileName,index);
		index++;
	}
}

void Linguist::setCurrentLanguage(int langIndex)
{
	if (langIndex < mLanguages.size())
        applyCurrentLanguage(mLanguages[langIndex].mLanguageName,mLanguages[langIndex].mFileName,langIndex);
}

void Linguist::setTranslator(QTranslator* translator)
{
	mTranslator = translator;
}

void Linguist::setApplication(QApplication* application)
{
	mApplication = application;
}

QString Linguist::currentLanguageName()
{
	return mCurrentLanguageName;
}

int Linguist::currentLanguageIndex()
{
	return mCurrentLanguageIndex;
}

QList< QPair<QString, QString>> Linguist::getLanguagesList()
{
	QList< QPair<QString, QString>> list;
	for (auto& language : mLanguages)
		list << qMakePair<QString, QString> (language.mLanguageName, language.mIcon);
	return list;
}

QString Linguist::getEmptyString()
{
    return "";
}


Linguist::Linguist()
{
}

bool Linguist::applyCurrentLanguage(const QString &langName, const QString &fileName, int langIndex)
{
    if(mTranslator->load(fileName))
    {
        if(!mApplication->removeTranslator(mTranslator))
            qDebug()<<"[LINGUIST] Can not remove translator for file: " << fileName;

        if(!mApplication->installTranslator(mTranslator))
            qDebug()<<"[LINGUIST] Can not install translator for file: " << fileName;
        else
        {
            mCurrentLanguageName = langName;
            mCurrentLanguageIndex = langIndex;
            emit signalLanguageChanged();
            qDebug()<<"[LINGUIST] Localization seted: " << langName << fileName;
            return true;
        }
    }
    else
        qDebug()<<"[LINGUIST] Can not load file: " << fileName;
    return false;
}

