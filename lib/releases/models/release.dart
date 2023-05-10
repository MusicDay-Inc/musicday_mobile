abstract class Release {
  final String id;
  final String name;
  final String author;
  final String? avatarUrl;
  final int year;

  Release({
    required this.id,
    required this.name,
    required this.author,
    required this.avatarUrl,
    required this.year,
  });
}
