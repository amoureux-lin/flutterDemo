/// base_url_config.dart
enum Environment { dev, test, prod }

class BaseUrlConfig {
  static Environment env = Environment.dev;

  static String get baseUrl {
    switch (env) {
      case Environment.dev:
        return 'https://dev.example.com/api/';
      case Environment.test:
        return 'https://test.example.com/api/';
      case Environment.prod:
        return 'https://prod.example.com/api/';
    }
  }
}
