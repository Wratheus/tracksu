class News{
  int?id;
  String?author;
  String?editURL;
  String?firstImage;
  String?publishedAt;
  String?updatedAt;
  String?slug;
  String?title;
  String?preview;

  News({
    required this.id,
    required this.author,
    required this.editURL,
    required this.firstImage,
    required this.publishedAt,
    required this.updatedAt,
    required this.slug,
    required this.title,
    required this.preview,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['news_posts'][0]['id'],
      author: json['news_posts'][0]['author'],
      editURL: json['news_posts'][0]['edit_url'],
      firstImage: json['news_posts'][0]['first_image'],
      publishedAt: json['news_posts'][0]['published_at'],
      updatedAt: json['news_posts'][0]['updated_at'],
      slug: json['news_posts'][0]['slug'],
      title: json['news_posts'][0]['title'],
      preview: json['news_posts'][0]['preview'],
    );
  }
}