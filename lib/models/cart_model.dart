import 'book_model.dart';

class CartModel {
  final BookModel book;
  int quantity;

  CartModel({
    required this.book,
    this.quantity = 1,
  });
}