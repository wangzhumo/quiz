import 'package:freezed_annotation/freezed_annotation.dart';

enum IdentityType {
  @JsonValue(0)
  UNKnow,
  @JsonValue(1)
  Email,
  @JsonValue(2)
  Google,
  @JsonValue(3)
  Apple,
}

extension IdentityTypeIndex on IdentityType {
  int type() {
    return index + 1;
  }
}
