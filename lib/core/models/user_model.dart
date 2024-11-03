import 'package:risha_app/config/json_constants.dart';
import 'package:risha_app/core/enums/user_type_enum.dart';
import 'package:risha_app/core/models/chronic_disease_model.dart';
import 'package:risha_app/core/models/degree_of_insurance_model.dart';
import 'package:risha_app/core/models/policy_holder_model.dart';
import 'package:risha_app/core/models/subscription_status_model.dart';

enum Status { active, inactive }

class UserModel {
  final int? id;
  final String? arabicName;
  final String? englishName;
  final String? email;
  final String? imageUrl;
  final String? password;
  final String? birthday;
  final UserTypeEnum type;
  final String? phoneNumber;
  final String? token;
  final String? city;
  final String? subscriptionDate;
  final String? exceptions;
  final String? address;
  final String? verificationNumber;
  final String? nationalId;
  final ChronicDiseaseModel? chronicDiseases;
  final PolicyHolderModel? policyHolder;
  final DegreeOfInsuranceModel? degreeOfInsurance;
  final SubscriptionStatusModel? subscriptionStatus;
  final Status status;

  UserModel({
    this.id,
    this.arabicName,
    this.englishName,
    this.email,
    this.imageUrl,
    this.password,
    this.birthday,
    required this.type,
    this.phoneNumber,
    this.token,
    this.city,
    this.subscriptionDate,
    this.exceptions,
    this.address,
    this.verificationNumber,
    this.nationalId,
    this.chronicDiseases,
    this.policyHolder,
    this.degreeOfInsurance,
    this.subscriptionStatus,
    this.status = Status.active,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserModelConstants.id],
      arabicName: json[UserModelConstants.arabicName] ?? "",
      englishName: json[UserModelConstants.englishName] ?? "",
      email: json[UserModelConstants.email] ?? "",
      imageUrl: json[UserModelConstants.imageUrl],
      password: json[UserModelConstants.password] ?? "",
      birthday: json[UserModelConstants.birthday],
      type: json[UserModelConstants.type] ?? UserTypeEnum.tech,
      phoneNumber: json[UserModelConstants.phoneNumber],
      token: json[UserModelConstants.token],
      city: json[UserModelConstants.city],
      subscriptionDate: json[UserModelConstants.subscriptionDate],
      exceptions: json[UserModelConstants.exceptions],
      address: json[UserModelConstants.address],
      verificationNumber: json[UserModelConstants.verificationNumber],
      nationalId: json[UserModelConstants.nationalId],
      chronicDiseases: json[UserModelConstants.chronicDiseases] != null
          ? ChronicDiseaseModel.fromJson(json[UserModelConstants.chronicDiseases])
          : null,
      policyHolder: json[UserModelConstants.policyHolder] != null
          ? PolicyHolderModel.fromJson(json[UserModelConstants.policyHolder])
          : null,
      degreeOfInsurance: json[UserModelConstants.degreeOfInsurance] != null
          ? DegreeOfInsuranceModel.fromJson(json[UserModelConstants.degreeOfInsurance])
          : null,
      subscriptionStatus: json[UserModelConstants.subscriptionStatus] != null
          ? SubscriptionStatusModel.fromJson(json[UserModelConstants.subscriptionStatus])
          : null,
      status: json[UserModelConstants.status] == "active"
          ? Status.active
          : Status.inactive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserModelConstants.id: id,
      UserModelConstants.arabicName: arabicName,
      UserModelConstants.englishName: englishName,
      UserModelConstants.email: email,
      UserModelConstants.imageUrl: imageUrl,
      UserModelConstants.password: password,
      UserModelConstants.birthday: birthday,
      UserModelConstants.type: type,
      UserModelConstants.phoneNumber: phoneNumber,
      UserModelConstants.token: token,
      UserModelConstants.city: city,
      UserModelConstants.subscriptionDate: subscriptionDate,
      UserModelConstants.exceptions: exceptions,
      UserModelConstants.address: address,
      UserModelConstants.verificationNumber: verificationNumber,
      UserModelConstants.nationalId: nationalId,
      UserModelConstants.chronicDiseases: chronicDiseases?.toJson(),
      UserModelConstants.policyHolder: policyHolder?.toJson(),
      UserModelConstants.degreeOfInsurance: degreeOfInsurance?.toJson(),
      UserModelConstants.subscriptionStatus: subscriptionStatus?.toJson(),
      UserModelConstants.status: status == Status.active ? "active" : "inactive",
    };
  }

  UserModel copyWith({
    int? id,
    String? arabicName,
    String? englishName,
    String? email,
    String? imageUrl,
    String? password,
    String? birthday,
    UserTypeEnum? type,
    String? phoneNumber,
    String? token,
    String? city,
    String? subscriptionDate,
    String? exceptions,
    String? address,
    String? verificationNumber,
    String? nationalId,
    ChronicDiseaseModel? chronicDiseases,
    PolicyHolderModel? policyHolder,
    DegreeOfInsuranceModel? degreeOfInsurance,
    SubscriptionStatusModel? subscriptionStatus,
    Status? status,
  }) {
    return UserModel(
      id: id ?? this.id,
      arabicName: arabicName ?? this.arabicName,
      englishName: englishName ?? this.englishName,
      email: email ?? this.email,
      imageUrl: imageUrl?? this.imageUrl,
      password: password ?? this.password,
      birthday: birthday ?? this.birthday,
      type: type ?? this.type,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      token: token ?? this.token,
      city: city ?? this.city,
      subscriptionDate: subscriptionDate ?? this.subscriptionDate,
      exceptions: exceptions ?? this.exceptions,
      address: address ?? this.address,
      verificationNumber: verificationNumber ?? this.verificationNumber,
      nationalId: nationalId ?? this.nationalId,
      chronicDiseases: chronicDiseases ?? this.chronicDiseases,
      policyHolder: policyHolder ?? this.policyHolder,
      degreeOfInsurance: degreeOfInsurance ?? this.degreeOfInsurance,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      status: status ?? this.status,
    );
  }
}
