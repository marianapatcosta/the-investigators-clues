class CustomInfoToken {
  const CustomInfoToken({
    required this.text,
    this.tokenSlotsNumber,
  });

  final String text;
  final int? tokenSlotsNumber;

  CustomInfoToken.fromJson(Map<String, dynamic> json)
      : text = json['text'] as String,
        tokenSlotsNumber = json['tokenSlotsNumber'] as int?;

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'tokenSlotsNumber': tokenSlotsNumber,
    };
  }
}
