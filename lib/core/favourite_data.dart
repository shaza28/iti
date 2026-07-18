import '../models/book_model.dart';

List<BookModel> favouriteBooks = [];

void toggleFavourite(BookModel book) {
  if (favouriteBooks.any((e) => e.title == book.title)) {
    favouriteBooks.removeWhere((e) => e.title == book.title);
  } else {
    favouriteBooks.add(book);
  }
}

bool isFavourite(BookModel book) {
  return favouriteBooks.any((e) => e.title == book.title);
}