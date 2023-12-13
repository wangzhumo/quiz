class RouterMeta {
  bool auth = false;
  Object? parameter;

  RouterMeta({this.auth = false, this.parameter});
  int asInt({int defaultValue = -1}) {
    if (parameter != null) {
      return parameter as int;
    }
    return defaultValue;
  }

  String asString({String defaultValue = ''}) {
    if (parameter != null) {
      return parameter as String;
    }
    return defaultValue;
  }
}

// Object
extension ObjectExtension on Object? {
  RouterMeta asMeta() {
    if (this is RouterMeta) {
      return this as RouterMeta;
    }
    return RouterMeta();
  }
}
