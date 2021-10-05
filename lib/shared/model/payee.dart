class Payee {
  final String? id;
  final String title;

  Payee({
    this.id,
    required this.title,
  });

  factory Payee.fromJson(Map<String, dynamic> json, String id) => Payee(
        id: id,
        title: json['title'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
