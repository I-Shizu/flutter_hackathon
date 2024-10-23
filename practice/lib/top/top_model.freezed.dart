// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopModelNotifier _$TopModelNotifierFromJson(Map<String, dynamic> json) {
  return _TopModelNotifier.fromJson(json);
}

/// @nodoc
mixin _$TopModelNotifier {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this TopModelNotifier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopModelNotifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopModelNotifierCopyWith<TopModelNotifier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopModelNotifierCopyWith<$Res> {
  factory $TopModelNotifierCopyWith(
          TopModelNotifier value, $Res Function(TopModelNotifier) then) =
      _$TopModelNotifierCopyWithImpl<$Res, TopModelNotifier>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$TopModelNotifierCopyWithImpl<$Res, $Val extends TopModelNotifier>
    implements $TopModelNotifierCopyWith<$Res> {
  _$TopModelNotifierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopModelNotifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopModelNotifierImplCopyWith<$Res>
    implements $TopModelNotifierCopyWith<$Res> {
  factory _$$TopModelNotifierImplCopyWith(_$TopModelNotifierImpl value,
          $Res Function(_$TopModelNotifierImpl) then) =
      __$$TopModelNotifierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$TopModelNotifierImplCopyWithImpl<$Res>
    extends _$TopModelNotifierCopyWithImpl<$Res, _$TopModelNotifierImpl>
    implements _$$TopModelNotifierImplCopyWith<$Res> {
  __$$TopModelNotifierImplCopyWithImpl(_$TopModelNotifierImpl _value,
      $Res Function(_$TopModelNotifierImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopModelNotifier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$TopModelNotifierImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopModelNotifierImpl implements _TopModelNotifier {
  const _$TopModelNotifierImpl(
      {required this.title, required this.description});

  factory _$TopModelNotifierImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopModelNotifierImplFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'TopModelNotifier(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopModelNotifierImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  /// Create a copy of TopModelNotifier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopModelNotifierImplCopyWith<_$TopModelNotifierImpl> get copyWith =>
      __$$TopModelNotifierImplCopyWithImpl<_$TopModelNotifierImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopModelNotifierImplToJson(
      this,
    );
  }
}

abstract class _TopModelNotifier implements TopModelNotifier {
  const factory _TopModelNotifier(
      {required final String title,
      required final String description}) = _$TopModelNotifierImpl;

  factory _TopModelNotifier.fromJson(Map<String, dynamic> json) =
      _$TopModelNotifierImpl.fromJson;

  @override
  String get title;
  @override
  String get description;

  /// Create a copy of TopModelNotifier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopModelNotifierImplCopyWith<_$TopModelNotifierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
