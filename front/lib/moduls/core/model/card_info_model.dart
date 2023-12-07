class CardInfo {
  final String cardNo;
  final int cvv2;
  final DateTime expiresAt;

  CardInfo({
    required this.cardNo,
    required this.cvv2,
    required this.expiresAt,
  });

  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      cardNo: json['cardNo'] ?? '',
      cvv2: json['cvv2'] ?? 0,
      expiresAt: DateTime.parse(json['expiresAt'] ?? ''),
    );
  }
}
