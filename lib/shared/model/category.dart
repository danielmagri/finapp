class Category {
  final String? id;
  final String title;

  Category({
    this.id,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json, String id) => Category(
        id: id,
        title: json['title'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}
