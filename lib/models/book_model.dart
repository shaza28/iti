class BookModel {
  final String image;
  final String title;
  final String author;
  final String price;
  final String rate;

  const BookModel({
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.rate,
  });

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "title": title,
      "author": author,
      "price": price,
      "rate": rate,
    };
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      image: json["image"],
      title: json["title"],
      author: json["author"],
      price: json["price"],
      rate: json["rate"],
    );
  }
}