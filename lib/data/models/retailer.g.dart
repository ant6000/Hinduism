// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retailer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetailerModel _$RetailerModelFromJson(Map<String, dynamic> json) =>
    RetailerModel(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      icons:
          (json['icons'] as List<dynamic>?)?.map((e) => e as String).toList(),
      radius: (json['radius'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      contact: json['contact'] as String?,
      section: json['section'] as String?,
      dccScope: json['dccScope'] as bool?,
      lastSale: (json['lastSale'] as num?)?.toInt(),
      latitude: json['latitude'] as String?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      longitude: json['longitude'] as String?,
      ownerName: json['ownerName'] as String?,
      hasDigonto: json['hasDigonto'] as bool?,
      isSaleEdit: json['isSaleEdit'] as bool?,
      cashLoanDue: (json['cashLoanDue'] as num?)?.toInt(),
      clusterName: json['clusterName'] as String?,
      creditLoanDue: (json['creditLoanDue'] as num?)?.toInt(),
      isOutletVisited: json['isOutletVisited'] as bool?,
      todaysSaleAmount: (json['todaysSaleAmount'] as num?)?.toInt(),
      isUnnotiAvailable: json['isUnnotiAvailable'] as bool?,
      isUnnotiAvailedForToday: json['isUnnotiAvailedForToday'] as bool?,
      isCashInstallmentAvailable: json['isCashInstallmentAvailable'] as bool?,
      isCreditInstallmentAvailable:
          json['isCreditInstallmentAvailable'] as bool?,
      routeId: (json['routeId'] as num?)?.toInt(),
      routeName: json['routeName'] as String?,
      routeSectionName: json['routeSectionName'] as String?,
    );

Map<String, dynamic> _$RetailerModelToJson(RetailerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'code': instance.code,
      'name': instance.name,
      'icons': instance.icons,
      'radius': instance.radius,
      'rating': instance.rating,
      'contact': instance.contact,
      'section': instance.section,
      'dccScope': instance.dccScope,
      'lastSale': instance.lastSale,
      'latitude': instance.latitude,
      'schedule': instance.schedule,
      'longitude': instance.longitude,
      'ownerName': instance.ownerName,
      'hasDigonto': instance.hasDigonto,
      'isSaleEdit': instance.isSaleEdit,
      'cashLoanDue': instance.cashLoanDue,
      'clusterName': instance.clusterName,
      'creditLoanDue': instance.creditLoanDue,
      'isOutletVisited': instance.isOutletVisited,
      'todaysSaleAmount': instance.todaysSaleAmount,
      'isUnnotiAvailable': instance.isUnnotiAvailable,
      'isUnnotiAvailedForToday': instance.isUnnotiAvailedForToday,
      'isCashInstallmentAvailable': instance.isCashInstallmentAvailable,
      'isCreditInstallmentAvailable': instance.isCreditInstallmentAvailable,
      'routeId': instance.routeId,
      'routeName': instance.routeName,
      'routeSectionName': instance.routeSectionName,
    };
