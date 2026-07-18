import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_application/models/user_models.dart';

import '../core/book_data.dart';
import '../models/book_model.dart';

class FirebaseServices {
  static Future<UserCredential> register(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  static Future<UserCredential> login(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  static Future<void> addUserToFireStore(UserModel user) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> usersCollection =
    db.collection("Users");

    DocumentReference<Map<String, dynamic>> usersDocument =
    usersCollection.doc(user.id);

    return usersDocument.set({
      "id": user.id,
      "email": user.email,
      "name": user.name,
    });
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserData() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .snapshots();
    } else {
      return const Stream.empty();
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getBooks() {
    return FirebaseFirestore.instance
        .collection("Books")
        .snapshots();
  }
  static Future<void> uploadBooks() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    CollectionReference<Map<String, dynamic>> booksCollection =
    db.collection("Books");

    for (BookModel book in books) {
      await booksCollection.add(book.toJson());
    }
  }
  static void test() {}
}