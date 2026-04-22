class CustomUserModel {
  String? name;
  String email;
  String? uid;
  CustomUserModel({ this.name, required this.email, this.uid});

   static CustomUserModel fromJson(Map json) {
    return CustomUserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  Map<String, Object?> toJson() {
    return {"name": name, "email": email, "uid": uid};
  }
}
