// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryInitial value) initial,
    required TResult Function(CountryLoading value) loading,
    required TResult Function(CountryLoaded value) loaded,
    required TResult Function(CountryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryInitial value)? initial,
    TResult? Function(CountryLoading value)? loading,
    TResult? Function(CountryLoaded value)? loaded,
    TResult? Function(CountryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryInitial value)? initial,
    TResult Function(CountryLoading value)? loading,
    TResult Function(CountryLoaded value)? loaded,
    TResult Function(CountryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryStateCopyWith<$Res> {
  factory $CountryStateCopyWith(
          CountryState value, $Res Function(CountryState) then) =
      _$CountryStateCopyWithImpl<$Res, CountryState>;
}

/// @nodoc
class _$CountryStateCopyWithImpl<$Res, $Val extends CountryState>
    implements $CountryStateCopyWith<$Res> {
  _$CountryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CountryInitialImplCopyWith<$Res> {
  factory _$$CountryInitialImplCopyWith(_$CountryInitialImpl value,
          $Res Function(_$CountryInitialImpl) then) =
      __$$CountryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CountryInitialImplCopyWithImpl<$Res>
    extends _$CountryStateCopyWithImpl<$Res, _$CountryInitialImpl>
    implements _$$CountryInitialImplCopyWith<$Res> {
  __$$CountryInitialImplCopyWithImpl(
      _$CountryInitialImpl _value, $Res Function(_$CountryInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CountryInitialImpl implements CountryInitial {
  const _$CountryInitialImpl();

  @override
  String toString() {
    return 'CountryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CountryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryInitial value) initial,
    required TResult Function(CountryLoading value) loading,
    required TResult Function(CountryLoaded value) loaded,
    required TResult Function(CountryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryInitial value)? initial,
    TResult? Function(CountryLoading value)? loading,
    TResult? Function(CountryLoaded value)? loaded,
    TResult? Function(CountryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryInitial value)? initial,
    TResult Function(CountryLoading value)? loading,
    TResult Function(CountryLoaded value)? loaded,
    TResult Function(CountryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CountryInitial implements CountryState {
  const factory CountryInitial() = _$CountryInitialImpl;
}

/// @nodoc
abstract class _$$CountryLoadingImplCopyWith<$Res> {
  factory _$$CountryLoadingImplCopyWith(_$CountryLoadingImpl value,
          $Res Function(_$CountryLoadingImpl) then) =
      __$$CountryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CountryLoadingImplCopyWithImpl<$Res>
    extends _$CountryStateCopyWithImpl<$Res, _$CountryLoadingImpl>
    implements _$$CountryLoadingImplCopyWith<$Res> {
  __$$CountryLoadingImplCopyWithImpl(
      _$CountryLoadingImpl _value, $Res Function(_$CountryLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CountryLoadingImpl implements CountryLoading {
  const _$CountryLoadingImpl();

  @override
  String toString() {
    return 'CountryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CountryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryInitial value) initial,
    required TResult Function(CountryLoading value) loading,
    required TResult Function(CountryLoaded value) loaded,
    required TResult Function(CountryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryInitial value)? initial,
    TResult? Function(CountryLoading value)? loading,
    TResult? Function(CountryLoaded value)? loaded,
    TResult? Function(CountryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryInitial value)? initial,
    TResult Function(CountryLoading value)? loading,
    TResult Function(CountryLoaded value)? loaded,
    TResult Function(CountryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CountryLoading implements CountryState {
  const factory CountryLoading() = _$CountryLoadingImpl;
}

/// @nodoc
abstract class _$$CountryLoadedImplCopyWith<$Res> {
  factory _$$CountryLoadedImplCopyWith(
          _$CountryLoadedImpl value, $Res Function(_$CountryLoadedImpl) then) =
      __$$CountryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Country> countries});
}

/// @nodoc
class __$$CountryLoadedImplCopyWithImpl<$Res>
    extends _$CountryStateCopyWithImpl<$Res, _$CountryLoadedImpl>
    implements _$$CountryLoadedImplCopyWith<$Res> {
  __$$CountryLoadedImplCopyWithImpl(
      _$CountryLoadedImpl _value, $Res Function(_$CountryLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countries = null,
  }) {
    return _then(_$CountryLoadedImpl(
      null == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<Country>,
    ));
  }
}

/// @nodoc

class _$CountryLoadedImpl implements CountryLoaded {
  const _$CountryLoadedImpl(final List<Country> countries)
      : _countries = countries;

  final List<Country> _countries;
  @override
  List<Country> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  @override
  String toString() {
    return 'CountryState.loaded(countries: $countries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_countries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryLoadedImplCopyWith<_$CountryLoadedImpl> get copyWith =>
      __$$CountryLoadedImplCopyWithImpl<_$CountryLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(countries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(countries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(countries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryInitial value) initial,
    required TResult Function(CountryLoading value) loading,
    required TResult Function(CountryLoaded value) loaded,
    required TResult Function(CountryError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryInitial value)? initial,
    TResult? Function(CountryLoading value)? loading,
    TResult? Function(CountryLoaded value)? loaded,
    TResult? Function(CountryError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryInitial value)? initial,
    TResult Function(CountryLoading value)? loading,
    TResult Function(CountryLoaded value)? loaded,
    TResult Function(CountryError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CountryLoaded implements CountryState {
  const factory CountryLoaded(final List<Country> countries) =
      _$CountryLoadedImpl;

  List<Country> get countries;
  @JsonKey(ignore: true)
  _$$CountryLoadedImplCopyWith<_$CountryLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CountryErrorImplCopyWith<$Res> {
  factory _$$CountryErrorImplCopyWith(
          _$CountryErrorImpl value, $Res Function(_$CountryErrorImpl) then) =
      __$$CountryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CountryErrorImplCopyWithImpl<$Res>
    extends _$CountryStateCopyWithImpl<$Res, _$CountryErrorImpl>
    implements _$$CountryErrorImplCopyWith<$Res> {
  __$$CountryErrorImplCopyWithImpl(
      _$CountryErrorImpl _value, $Res Function(_$CountryErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CountryErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CountryErrorImpl implements CountryError {
  const _$CountryErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CountryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryErrorImplCopyWith<_$CountryErrorImpl> get copyWith =>
      __$$CountryErrorImplCopyWithImpl<_$CountryErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Country> countries) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Country> countries)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Country> countries)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CountryInitial value) initial,
    required TResult Function(CountryLoading value) loading,
    required TResult Function(CountryLoaded value) loaded,
    required TResult Function(CountryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CountryInitial value)? initial,
    TResult? Function(CountryLoading value)? loading,
    TResult? Function(CountryLoaded value)? loaded,
    TResult? Function(CountryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CountryInitial value)? initial,
    TResult Function(CountryLoading value)? loading,
    TResult Function(CountryLoaded value)? loaded,
    TResult Function(CountryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CountryError implements CountryState {
  const factory CountryError(final String message) = _$CountryErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$CountryErrorImplCopyWith<_$CountryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
