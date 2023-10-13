class ApiConst {
  static String host = '127.0.0.1:4000';

  static String _generateUrl(String path, {String scheme = 'https'}) {
    return '$scheme://$path';
  }

  // UCenter path
  static String get UCenter => _generateUrl("/ucenter");
}
