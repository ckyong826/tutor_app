class Session {
  final String id;
  final DateTime dateTime;
  final int maxParticipants;
  final List participants;
  final String title;
  final DateTime timeStart;
  final DateTime timeEnd;
  final String tutorName;
  final String subject;
  Session({
    required this.id,
    required this.dateTime,
    required this.maxParticipants,
    required this.participants,
    required this.title,
    required this.timeStart,
    required this.timeEnd,
    required this.tutorName,
    required this.subject,
  });
}
