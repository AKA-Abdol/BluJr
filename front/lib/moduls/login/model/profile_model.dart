import 'package:khorsand87/moduls/login/model/card_info_model.dart';

class ProfileModel {
  final String id;
  final CardInfo card;
  final String firstName;
  final String lastName;
  final int wallet;
  final String type;

  ProfileModel({
    required this.id,
    required this.card,
    required this.firstName,
    required this.lastName,
    required this.wallet,
    required this.type,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      card: CardInfo.fromJson(json['card'] ?? {}),
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      wallet: json['wallet'] ?? 0,
      type: json['type'] ?? '',
    );
  }
}
