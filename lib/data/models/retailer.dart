import 'package:json_annotation/json_annotation.dart';

part 'retailer.g.dart';

@JsonSerializable()
class RetailerModel {
  RetailerModel({
    this.id,
    this.uid,
    this.code,
    this.name,
    this.icons,
    this.radius,
    this.rating,
    this.contact,
    this.section,
    this.dccScope,
    this.lastSale,
    this.latitude,
    this.schedule,
    this.longitude,
    this.ownerName,
    this.hasDigonto,
    this.isSaleEdit,
    this.cashLoanDue,
    this.clusterName,
    this.creditLoanDue,
    this.isOutletVisited,
    this.todaysSaleAmount,
    this.isUnnotiAvailable,
    this.isUnnotiAvailedForToday,
    this.isCashInstallmentAvailable,
    this.isCreditInstallmentAvailable,
    this.routeId,
    this.routeName,
    this.routeSectionName,
  });

  final int? id;
  final String? uid;
  final String? code;
  final String? name;
  final List<String>? icons;
  final int? radius;
  final int? rating;
  final String? contact;
  final String? section;
  final bool? dccScope;
  final int? lastSale;
  final String? latitude;
  final List<String>? schedule;
  final String? longitude;
  final String? ownerName;
  final bool? hasDigonto;
  final bool? isSaleEdit;
  final int? cashLoanDue;
  final String? clusterName;
  final int? creditLoanDue;
  final bool? isOutletVisited;
  final int? todaysSaleAmount;
  final bool? isUnnotiAvailable;
  final bool? isUnnotiAvailedForToday;
  final bool? isCashInstallmentAvailable;
  final bool? isCreditInstallmentAvailable;
  final int? routeId;
  final String? routeName;
  final String? routeSectionName;

  factory RetailerModel.fromJson(Map<String, dynamic> json) =>
      _$RetailerModelFromJson(json);
  Map<String, dynamic> toJson() => _$RetailerModelToJson(this);
}
