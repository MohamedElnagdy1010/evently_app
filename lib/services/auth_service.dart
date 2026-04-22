import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/custom_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future<String?> login(CustomUserModel user, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == "invalid-credential") {
        return "wrong email or password";
      }
      if (kDebugMode) {
        print('CODE:->${e.code}');
      }

      return "${e.code.replaceAll("-", " ")}";
    } catch (e) {
      if (kDebugMode) {
        print("ERROR:->$e");
      }
      return "something went wring";
    }
    return null;
  }

  static register(CustomUserModel user, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          );
      user.uid = credential.user!.uid;
      await creatuser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
      if (kDebugMode) {
        print("code ---> ${e.code}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<String?> creatuser(CustomUserModel user) async {
    // CollectionReference collection = FirebaseFirestore.instance.collection(
    //   "users",
    // );

    try {
      CollectionReference<CustomUserModel> collection = _getUsersCollection();
      DocumentReference doc = collection.doc(user.uid);
      await doc.set(user);
    } catch (e) {
      // TODO
      if (kDebugMode) {
        print("Error :- $e");
      }
      return e.toString();
    }
    return null;
  }

  static CollectionReference<CustomUserModel> _getUsersCollection() {
    CollectionReference<CustomUserModel> collection = FirebaseFirestore.instance
        .collection("users")
        .withConverter<CustomUserModel>(
          fromFirestore: (snapshot, options) =>
              CustomUserModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, options) => value.toJson(),
        );
    return collection;
  }

  static getuser() async {
    CollectionReference<CustomUserModel> collection = _getUsersCollection();
    DocumentReference<CustomUserModel> doc = collection.doc(
      FirebaseAuth.instance.currentUser?.uid,
    );
    DocumentSnapshot<CustomUserModel> docSnapchot = await doc.get();
    if (kDebugMode) {
      print(docSnapchot.data());
    }
    return docSnapchot.data();
  }

  static forgetPassword() {}
}
