// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';

class EventModel {
  String? id;
  String userId;
  String title;
  String description;
  int catId;
  DateTime date;
  List<String>? wishlist;
  EventModel({
    this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.catId,
    required this.date,
    this.wishlist,
  });
  
  
  
  static EventModel fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      description: json['description'],
      catId: json['catId'],
      date: DateTime.fromMicrosecondsSinceEpoch(json['date']),
      wishlist: json["wishlist"] is List
          ? (json["wishlist"] as List).map((e) => e.toString()).toList()
          : null,
    );
  }

  
  bool get isFav =>
      (wishlist ?? []).contains(FirebaseAuth.instance.currentUser!.uid);

  Map<String, Object?> toJson() {
    return {
      'catId': catId,
      'date': date.microsecondsSinceEpoch,
      'description': description,
      'title': title,
      'userId': userId,
      'id': id,
      'wishlist': wishlist ?? [],
    };
  }
}
