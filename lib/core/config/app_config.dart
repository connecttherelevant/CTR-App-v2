class AppConfig {
  final String appName;
  final bool isProduction;

  AppConfig({required this.appName, required this.isProduction});
}

const bool isProduction = bool.fromEnvironment('dart.vm.product');

final AppConfig appConfig = isProduction
    ? AppConfig(appName: 'Prod', isProduction: true)
    : AppConfig(appName: 'Dev', isProduction: false);
