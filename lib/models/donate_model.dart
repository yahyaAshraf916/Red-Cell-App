class DonateModel {
  static String collectionName = "donatePost1";
  String? id;
  String? userName;
  String patientName;
  String requiredType;
  String phoneNumber;
  String numberUnit;
  DateTime validTime;
  String hospitalName;
  String addrees;
  String requestType;
  String imgRequest;
  String uid;
  String? profileImg;

  DonateModel({

    required this.userName,
    required this.id,
    required this.patientName,
    required this.requiredType,
    required this.phoneNumber,
    required this.numberUnit,
    required this.validTime,
    required this.hospitalName,
    required this.addrees,
    required this.requestType,
    required this.imgRequest,
    required this.uid,
    required this.profileImg,
  });
}
