class ApiConst {
  static String host = '192.168.31.33:4000';

  static String _generateUrl(String path, {String scheme = 'http'}) {
    return '$scheme://$host/$path';
  }

  static String get BaseURL => _generateUrl("");

  // UCenter path
  static String get UCenter => _generateUrl("ucenter");
}
