class Post {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String userId;
  final String authorName;
  final DateTime createdAt;
  final int likes;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    required this.authorName,
    required this.createdAt,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      userId: json['userId'],
      authorName: json['authorName'],
      createdAt: DateTime.parse(json['createdAt']),
      likes: json['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'userId': userId,
      'authorName': authorName,
      'createdAt': createdAt.toUtc().toLocal().toString(),
      'likes': likes,
    };
  }
}
