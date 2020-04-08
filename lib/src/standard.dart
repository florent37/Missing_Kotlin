class Nullable {
  const Nullable();
}

/// variable?.let((v){
///
/// })
///
/// variable?.also((v){
///
/// })
///
/// variable?.run((){
///
/// })
///
///
extension Standard<T> on T {
  @Nullable()
  V let<V>(V Function(T) block) {
    if (this == null) {
      return null;
    } else {
      return block(this);
    }
  }

  @Nullable()
  T also(void Function(T) block) {
    if (this == null) {
      return null;
    } else {
      block(this);
      return this;
    }
  }

  ///
  /// variable?.takeIf((v){
  /// 	return v != null
  /// })
  ///
  @Nullable()
  T takeIf(bool Function(T) predicate) {
    if (this == null) {
      return null;
    } else {
      return predicate(this) ? this : null;
    }
  }

  ///
  /// variable?.takeUnless((v){
  /// 	return v == null
  /// })
  ///
  @Nullable()
  T takeUnless(bool Function(T) predicate) {
    if (this == null) {
      return null;
    } else {
      return !predicate(this) ? this : null;
    }
  }
}

void repeat(int times, void Function(int) predicate) {
  for (var i = 0; i < times; ++i) {
    predicate(i);
  }
}

R run<R>(R Function() block) {
  block();
}
