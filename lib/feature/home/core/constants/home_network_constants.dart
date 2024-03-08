class HomeNetworkConstants {
  static const String homeUrl = 'https://newsapi.org/v2/everything';
  static const headers = {
    'Authorization-Type': String.fromEnvironment('API-KEY'),
  };
}
