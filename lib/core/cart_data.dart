import '../models/book_model.dart';
import '../models/cart_model.dart';

List<CartModel> cartItems = [];

void addToCart(BookModel book) {
  bool found = false;

  for (var item in cartItems) {
    if (item.book.title == book.title) {
      item.quantity++;
      found = true;
      break;
    }
  }

  if (!found) {
    cartItems.add(
      CartModel(
        book: book,
        quantity: 1,
      ),
    );
  }
}