// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherUserModelImpl _$$OtherUserModelImplFromJson(Map<String, dynamic> json) =>
    _$OtherUserModelImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      teamName: json['teamName'] as String,
      icon: (json['icon'] as num).toInt(),
      profileExperience: json['profileExperience'] as String,
      profileJob: json['profileJob'] as String,
      profileIsStudent: json['profileIsStudent'] as bool,
      profileFavPackage: json['profileFavPackage'] as String,
      profileHobbies: (json['profileHobbies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      profilePersonFeat: json['profilePersonFeat'] as String,
      askExperience: json['askExperience'] as String,
      askJob: json['askJob'] as String,
      askIsStudent: json['askIsStudent'] as bool,
      totalpoint: (json['totalpoint'] as num).toDouble(),
    );

Map<String, dynamic> _$$OtherUserModelImplToJson(
        _$OtherUserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'teamName': instance.teamName,
      'icon': instance.icon,
      'profileExperience': instance.profileExperience,
      'profileJob': instance.profileJob,
      'profileIsStudent': instance.profileIsStudent,
      'profileFavPackage': instance.profileFavPackage,
      'profileHobbies': instance.profileHobbies,
      'profilePersonFeat': instance.profilePersonFeat,
      'askExperience': instance.askExperience,
      'askJob': instance.askJob,
      'askIsStudent': instance.askIsStudent,
      'totalpoint': instance.totalpoint,
    };
