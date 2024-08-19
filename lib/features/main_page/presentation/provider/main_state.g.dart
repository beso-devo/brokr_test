// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainStateImpl _$$MainStateImplFromJson(Map<String, dynamic> json) =>
    _$MainStateImpl(
      isLoadingBoats: json['isLoadingBoats'] as bool? ?? false,
      errorLoadingBoats: json['errorLoadingBoats'] as bool? ?? false,
      boatsLoaded: json['boatsLoaded'] as bool? ?? false,
      boats: (json['boats'] as List<dynamic>?)
              ?.map((e) => BoatEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MainStateImplToJson(_$MainStateImpl instance) =>
    <String, dynamic>{
      'isLoadingBoats': instance.isLoadingBoats,
      'errorLoadingBoats': instance.errorLoadingBoats,
      'boatsLoaded': instance.boatsLoaded,
      'boats': instance.boats,
    };
