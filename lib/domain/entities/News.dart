import 'dart:convert';

class News {
  late int id;
  late String by;
  late String title;
  late String url;

  News({
    required this.id,
    required this.by,
    required this.title,
    required this.url,
  });

  News copyWith({
    int? id,
    String? by,
    String? title,
    String? url,
  }) {
    return News(
      id: id ?? this.id,
      by: by ?? this.by,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'by': by,
      'title': title,
      'url': url,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      by: map['by'],
      title: map['title'],
      url: map['url']
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, by: $by, title: $title, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is News &&
      other.id == id &&
      other.by == by &&
      other.title == title &&
      other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      by.hashCode ^
      title.hashCode ^
      url.hashCode;
  }
}
