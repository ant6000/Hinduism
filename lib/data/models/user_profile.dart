import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  int? id;
  int? accountId;
  String? customerId;
  String? name;
  String? email;
  String? contactNumber;
  String? dateOfBirth;
  int? vehicleCount;
  String? address;
  String? accountCreationDate;
  String? passwordUpdatedAt;
  String? serviceExpiryDate;
  String? profilePhotoUrl;

  UserProfile({
    this.id,
    this.accountId,
    this.customerId,
    this.name,
    this.email,
    this.contactNumber,
    this.dateOfBirth,
    this.vehicleCount,
    this.address,
    this.accountCreationDate,
    this.passwordUpdatedAt,
    this.serviceExpiryDate,
    this.profilePhotoUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        accountId: json["account_id"],
        customerId: json["customer_id"],
        name: json["name"],
        email: json["email"],
        contactNumber: json["contact_number"],
        dateOfBirth: json["date_of_birth"],
        vehicleCount: json["vehicle_count"],
        address: json["address"],
        accountCreationDate: json["account_creation_date"],
        passwordUpdatedAt: json["password_updated_at"],
        serviceExpiryDate: json["service_expiry_date"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "customer_id": customerId,
        "name": name,
        "email": email,
        "contact_number": contactNumber,
        "date_of_birth": dateOfBirth,
        "vehicle_count": vehicleCount,
        "address": address,
        "account_creation_date": accountCreationDate,
        "password_updated_at": passwordUpdatedAt,
        "service_expiry_date": serviceExpiryDate,
        "profile_photo_url": profilePhotoUrl,
      };
}
