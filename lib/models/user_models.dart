class UserModel {
  final int? id;
  final String name;

  final String customerNumber;
  final String email;
  final String? profilePicture;
  final String? password;
  
  final String? address;
  final bool? emailVerified;

  final String? otp;

  UserModel({
    this.id,
    
    required this.customerNumber,
    required this.name,
    required this.email,
    this.password,
    this.address,
this.emailVerified,
    this.otp,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      customerNumber: json['customer_number']??"",
      name: json['full_name'] ?? '',
      email: json['email'] ?? '',
      
      emailVerified: json['email_verified'] ?? '',
      profilePicture: json['profile_picture'] ?? "",

      // otp: json['otp'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      
      "customer_number":customerNumber,
      "full_name": name,
      "address":address,
      "email": email,
      "password": password,
      
    "role": "BUSINESS_OWNER"
      
      
    };
  }
}
