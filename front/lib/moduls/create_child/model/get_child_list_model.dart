import 'package:khorsand87/moduls/login/model/card_info_model.dart';

class GetChildListModel {
  late String id;
  late CardInfo card;
  late String firstName;
  late String lastName;
  late int wallet;
  late String type;

  GetChildListModel({
    required this.id,
    required this.card,
    required this.firstName,
    required this.lastName,
    required this.wallet,
    required this.type,
  });

  // Factory method to create a UserProfile object from a JSON map
  factory GetChildListModel.fromJson(Map<String, dynamic> json) {
    return GetChildListModel(
      id: json['id'] ?? '',
      card: CardInfo.fromJson(json['card'] ?? {}),
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      wallet: json['wallet'] ?? 0,
      type: json['type'] ?? '',
    );
  }
}
