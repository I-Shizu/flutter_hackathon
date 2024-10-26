// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      userName: json['userName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      snackName: json['snackName'] as String,
      comments: json['comments'] as String,
      rating: (json['5star-rating'] as num).toInt(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'createdAt': instance.createdAt.toIso8601String(),
      'snackName': instance.snackName,
      'comments': instance.comments,
      '5star-rating': instance.rating,
    };
