enum Flavor {
  development,
  staging,
  production,
}

class AppConfig {
  final Flavor flavor;
  final String appName;
  final String apiBaseUrl;

  const AppConfig({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
  });

  static late AppConfig instance;

  static void initialize({
    required Flavor flavor,
    required String appName,
    required String apiBaseUrl,
  }) {
    instance = AppConfig(
      flavor: flavor,
      appName: appName,
      apiBaseUrl: apiBaseUrl,
    );
  }
}