class HouseModel {
  final String housename;
  final String founder;
  final String emoji;

  HouseModel({
    required this.housename,
    required this.founder,
    required this.emoji,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      housename: json['house'] ?? '',
      founder: json['founder'] ?? '',
      emoji: json['emoji'] ?? '',
    );
  }
}
