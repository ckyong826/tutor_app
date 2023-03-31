// question model object
class Question {
  String id;
  final String title;
  final String description;
  final String questionLevel;
  final String questionSubject;
  final String solvingPreference;

  Question({
    this.id = '',
    required this.title,
    required this.description,
    required this.questionLevel,
    required this.questionSubject,
    required this.solvingPreference,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'questionLevel': questionLevel,
        'questionSubject': questionSubject,
        'solvingPreference': solvingPreference,
      };

  static Question fromJson(Map<String, dynamic> json) =>
      Question(
        title: json['title'], 
        description: json['description'],
        questionLevel: json['questionLevel'], 
        questionSubject: json['questionSubject'], 
        solvingPreference: json['solvingPreference']);
}