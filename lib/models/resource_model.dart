// Resource model object
class Resource {
  String id;
  final String title;
  final String description;
  final String resourceCategory;
  final String resourceSubject;
  final String resourceLevel;
  final String tutor;
  final int likes;
  final int downloads;


  Resource({
    this.id = '',
    required this.title,
    required this.description,
    required this.resourceCategory,
    required this.resourceSubject,
    required this.resourceLevel, 
    required this.tutor, 
    required this.likes, 
    required this.downloads, 

  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'resourceCategory': resourceCategory,
        'resourceSubject': resourceSubject,
        'resourceLevel': resourceLevel,
        'tutor': tutor,
        'likes': likes,
        'downloads': downloads,

      };

  static Resource fromJson(Map<String, dynamic> json) =>
      Resource(
        title: json['title'], 
        description: json['description'],
        resourceCategory: json['resourceCategory'], 
        resourceSubject: json['resourceSubject'], 
        resourceLevel: json['resourceLevel'],
        tutor: json['tutor'],
        likes: json['likes'],
        downloads: json['downloads'],);
}