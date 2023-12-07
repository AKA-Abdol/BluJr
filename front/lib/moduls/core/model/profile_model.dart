import 'package:khorsand87/moduls/core/model/card_info_model.dart';

class UserProfile {
  final String id;
  final CardInfo card;
  final String firstName;
  final String lastName;
  final int wallet;
  final String type;

  UserProfile({
    required this.id,
    required this.card,
    required this.firstName,
    required this.lastName,
    required this.wallet,
    required this.type,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? '',
      card: CardInfo.fromJson(json['card'] ?? {}),
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      wallet: json['wallet'] ?? 0,
      type: json['type'] ?? '',
    );
  }
}
