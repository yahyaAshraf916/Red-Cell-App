class UserData {
  String? userName;
  String? email;
  String? password;
  //String bloodType;
  String? dateOfBirthday;
  //String country;
  String? phone;
  String? gender;
  String? profileImg;
  String? uid;

  UserData({
    required this.userName,
    //required this.bloodType,
    required this.email,
    required this.password,
    required this.dateOfBirthday,
    //required this.country,
    required this.gender,
    required this.phone,
    required this.profileImg,
    required this.uid,
  });
  UserData.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    email = json["email"];
    password = json["password"];
    dateOfBirthday = json["dateOfBirthday"];
    gender = json["gender"];
    phone = json["phone"];
    profileImg = json["profileImg"];
    uid = json["uid"];
  }

  // function to convert map
  Map<String, dynamic> convertToMap() {
    return {
      "userName": userName,
      //"bloodType": bloodType,
      "email": email,
      "password": password,
      "profileImg": profileImg,
      "dateOfBirthday": dateOfBirthday,
      //"country":country,
      "phone": phone,
      "gender": gender,
      "uid": uid,
    };
  }
}
