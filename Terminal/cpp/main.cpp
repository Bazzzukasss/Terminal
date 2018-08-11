#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include "Linguist.h"
#include "UILogic.h"
#include "UIBackendTerminal.h"
#include "UIBackendEmulator.h"
#include "UIAssistant.h"

#define EMULATION

void InitializeLinguist(QTranslator* translator)
{
    Linguist::getInstance()->setTranslator(translator);
    Linguist::getInstance()->addLanguage(LanguageData({ "English",      ":/terminal_en_US.qm", "en_US", ":/img/flags/United-States.png" }));
    Linguist::getInstance()->addLanguage(LanguageData({ "Ukrainian",    ":/terminal_uk_UA.qm", "uk_UA", ":/img/flags/Ukrain.png" }));
    Linguist::getInstance()->addLanguage(LanguageData({ "Russian",      ":/terminal_ru_RU.qm", "ru_RU", ":/img/flags/Russian.png" }));
    Linguist::getInstance()->setCurrentLanguage();
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QFontDatabase fontDB;
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Bold.ttf");
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Black.ttf");
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Regular.ttf");
    fontDB.addApplicationFont("qrc:/fonts/Roboto-Thin.ttf");

    QTranslator translator;
    //InitializeLinguist(&translator);

#ifdef EMULATION
    auto uiBackend = new UIBackendEmulator(&app);
#else
    auto uiBackend = new UIBackendTerminal(&app);
#endif
    auto uiAssistant = new UIAssistant(&app);
    UILogic uiLogic(&engine,uiAssistant,uiBackend);

    qmlRegisterSingletonType(QUrl(QLatin1String("qrc:/qml/TStyle.qml")), "CustomControls", 1, 0, "MyStyle");
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
