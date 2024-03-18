import 'dart:convert';

class NewsDTO {
    late int id;
    late String by;
    late int descendants;
    late List<dynamic>? kids;
    late int score;
    late int time;
    late String title;
    late String type;
    late String url;

  NewsDTO({
    required this.id,
    required this.by,
    required this.descendants,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  NewsDTO copyWith({
    int? id,
    String? by,
    int? descendants,
    List<int>? kids,
    int? score,
    int? time,
    String? title,
    String? type,
    String? url,
  }) {
    return NewsDTO(
      id: id ?? this.id,
      by: by ?? this.by,
      descendants: descendants ?? this.descendants,
      kids: kids ?? this.kids,
      score: score ?? this.score,
      time: time ?? this.time,
      title: title ?? this.title,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'by': by,
      'descendants': descendants,
      'kids': kids,
      'score': score,
      'time': time,
      'title': title,
      'type': type,
      'url': url,
    };
  }

  factory NewsDTO.fromMap(Map<String, dynamic> map) {
    return NewsDTO(
      id: map['id'],
      by: map['by'],
      descendants: map['descendants'],
      kids: map['kids'],
      score: map['score'],
      time: map['time'],
      title: map['title'],
      type: map['type'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsDTO.fromJson(String source) => NewsDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NewsDTO(id: $id, by: $by, descendants: $descendants, kids: $kids, score: $score, time: $time, title: $title, type: $type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NewsDTO &&
      other.id == id &&
      other.by == by &&
      other.descendants == descendants &&
      other.kids == kids &&
      other.score == score &&
      other.time == time &&
      other.title == title &&
      other.type == type &&
      other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      by.hashCode ^
      descendants.hashCode ^
      kids.hashCode ^
      score.hashCode ^
      time.hashCode ^
      title.hashCode ^
      type.hashCode ^
      url.hashCode;
  }
}
