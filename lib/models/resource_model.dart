// Resource model object
class Resource {
  String id;
  final String title;
  final String description;
  final String resourceCategory;
  final String resourceSubject;
  final String resourceLevel;

  Resource({
    this.id = '',
    required this.title,
    required this.description,
    required this.resourceCategory,
    required this.resourceSubject,
    required this.resourceLevel,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'resourceCategory': resourceCategory,
        'resourceSubject': resourceSubject,
        'resourceLevel': resourceLevel,
      };

  static Resource fromJson(Map<String, dynamic> json) =>
      Resource(
        title: json['title'], 
        description: json['description'],
        resourceCategory: json['resourceCategory'], 
        resourceSubject: json['resourceSubject'], 
        resourceLevel: json['resourceLevel']);
}