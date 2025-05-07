class AppConfig {
  static AppConfig get instance {
    if (_instance == null) {
      const apiKey =
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxN2JlNmVmOGI3M2JlYmRhMjE4NThkN2I5OTQ2NDhhOSIsIm5iZiI6MTc0NDY2OTY3MC4wODQsInN1YiI6IjY3ZmQ4YmU2YzFlMGE3MDhjYmFkNDgzOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CAcd13telTy2YS58O5IXU9Ria01rkFlgt2tnAxQwvUc";
      const baseUrl = "https://api.themoviedb.org/3";
      //const apiKey = String.fromEnvironment('API_KEY');
      //const baseUrl = String.fromEnvironment('BASE_URL');
      _instance = AppConfig._internal(apiKey, baseUrl);
      return _instance!;
    }
    return _instance!;
  }

  static AppConfig? _instance;
  AppConfig._internal(this.apiKey, this.baseUrl);

  final String apiKey;
  final String baseUrl;
}
