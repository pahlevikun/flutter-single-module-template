abstract class Repository {
  void saveAccessToken(String accessToken);

  String getAccessToken();

  void deleteAccessToken();
}
