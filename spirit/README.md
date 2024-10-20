# spirit

Mobile application for Spirit project. 

## Getting Started

Usability commands:

    Очистка проекта: flutter clean
    Получение пакетов: flutter pub get
    Обновление зависимостей: flutter packages upgrade
    Обновление до последних версий пакетов: flutter pub upgrade --major-versions

    Запуск кодогенерации: flutter packages pub run build_runner build
                          flutter pub run build_runner build --delete-conflicting-outputs

    Перегенерация файлов локализации: flutter gen-l10n
    Команда для запуска интеграционного теста: flutter drive --target=test_driver/app.dart

    Получение информации о версии Gradle (subDir: android): ./gradlew --version
    Получение ключей SHA1 и SHA256 из Gradle (subDir: android): ./gradlew signingReport
    Активизация Flutterfire CLI: dart pub global activate flutterfire_cli
    Конфигурирование проекта для firebase: flutterfire configure --project=<specific Proj Name>

Dependencies of packages in the Project:

        ------------------- Analyzer ----------------------
        |                   analyzer_sm                   |
        |                       |                         |
        V                       V                         V
    UI Layer        <---    Business layer    <---    Data Layer
    state_management        business_sm               data_sm
        ^                   /controllers                  ^  
        |                   /di/locator                   |
        |                       ^                         |
        |                       |                         |
        -----------------   Model Data  -------------------
                            model_sm

Dependencies:

    Анализатор кода сведен в отдельный пакет "packages/analyzer_sm" и подключен к остальным пакетам.
    fluro: ^2.0.5                   -   Organization of routing with Fluro
    flutter_bloc: ^8.1.2            -   For BLOC state management
    freezed: ^2.3.2                 -   Code generation
    build_runner: ^2.3.3            -   Code generation
    font_awesome_flutter: ^10.4.0   -   Icon Google on AuthPage, may be anywere else :)
    fluttertoast: ^8.2.1            -   For show some message when you shold Exit  
    hive: ^2.2.3                    -   For save configuration information
    hive_flutter: ^1.1.0            -   For save configuration information

    Localizations:
    flutter_localizations
    intl: any
 
ADDED TO PROJECT:

    1. Fluro Navigation routing
    2. Clear Architecture
    3. BLoC state management
    4. Code Analyze in single package
    5. Localizations
    6. Dependency Injection

TODO:

    Z. Tests
