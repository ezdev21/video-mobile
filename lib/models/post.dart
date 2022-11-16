class Post{
  int id;
  String title;
  String? description;
  String? url;
  Post({
    required this.id,
    required this.title,
    this.description,
    this.url
  });
}