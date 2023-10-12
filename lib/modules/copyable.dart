abstract class Copy<T> {
  T copy();
}

abstract class CopyWith<T> {
  T copyWith();
}

abstract class Copyable<T> implements Copy<T>, CopyWith<T> {}
