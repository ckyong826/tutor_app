// question model object
class Comment {
  String id;
  final String comment;

  Comment({
    this.id = '',
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
      };

  static Comment fromJson(Map<String, dynamic> json) => Comment(
        comment: json['comment'],
      );
}
