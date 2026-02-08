class SuraData {
  final String suraNumber;
  final String suraNameAR;
  final String suraNameEN;
  final String suraVersesCount;

  SuraData({
    required this.suraNumber,
    required this.suraNameAR,
    required this.suraNameEN,
    required this.suraVersesCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'suraNumber': suraNumber,
      'suraNameAR': suraNameAR,
      'suraNameEN': suraNameEN,
      'suraVersesCount': suraVersesCount,
    };
  }

  factory SuraData.fromJson(Map<String, dynamic> json) {
    return SuraData(
      suraNumber: json['suraNumber'],
      suraNameAR: json['suraNameAR'],
      suraNameEN: json['suraNameEN'],
      suraVersesCount: json['suraVersesCount'],
    );
  }
}
