enum Flavor { dev, stage, prod }

class FlavorConfig {
  final Flavor? flavor;
  final String baseUrl;
  final String name;

  static FlavorConfig? _instance;

  FlavorConfig._internal(this.flavor, this.baseUrl, this.name);

  factory FlavorConfig(
      {required Flavor flavor, required String baseUrl, required String name}) {
    _instance ??= FlavorConfig._internal(flavor, baseUrl, name);
    return _instance!;
  }

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception('Not initialized');
    }
    return _instance!;
  }

  static bool isProd() => _instance!.flavor == Flavor.prod;
  static bool isStage() => _instance!.flavor == Flavor.stage;
  static bool isDev() => _instance!.flavor == Flavor.dev;
}
