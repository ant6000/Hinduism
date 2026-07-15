class LoginData {
  String? token;
  String? customerId;
  String? name;
  String? contactNum;
  String? address;
  String? email;
  int? vehiclesCount;
  String? baseUrl;

  LoginData({
    this.token,
    this.customerId,
    this.name,
    this.contactNum,
    this.address,
    this.email,
    this.vehiclesCount,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        token: json['token'],
        address: json['address'],
        contactNum: json['contact_num'],
        customerId: json['customer_id'],
        email: json['email'],
        name: json['name'],
        vehiclesCount: json['vehicles_count'],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "customer_id": customerId,
        "name": name,
        "contact_num": contactNum,
        "address": address,
        "email": email,
        "vehicles_count": vehiclesCount,
      };
}
