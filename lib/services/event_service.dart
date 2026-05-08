// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/screens/events/provider/evnent_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EventService {
  static CollectionReference<EventModel> _getEvenntCollection() {
    CollectionReference<EventModel> collection = FirebaseFirestore.instance
        .collection("events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, options) =>
              EventModel.fromJson(snapshot.data() ?? {}),

          toFirestore: (value, options) => value.toJson(),
        );

    return collection;
  }

  static createNewEvent(EventModel event) async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    DocumentReference<EventModel> doc = collection.doc();
    event.id = doc.id;
    await doc.set(event);
  }

static Future<void> editEvent(EventModel event) async {
  CollectionReference<EventModel> collection = _getEvenntCollection();
  await collection.doc(event.id).update(event.toJson());
}

  static Future<void> deleteEvent(String eventId) async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    await collection.doc(eventId).delete();
  }

  static Future<List<EventModel>> getAllEvents() async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    QuerySnapshot<EventModel> snapshots = await collection.get();
    List<QueryDocumentSnapshot<EventModel>> docs = snapshots.docs;
    List<EventModel> events = docs.map((e) => e.data()).toList();
    return events;
  }

  static Future<List<EventModel>> getFilteredEvents(int id) async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    QuerySnapshot<EventModel> snapshots = await collection
        .where("catId", isEqualTo: id)
        .get();
    List<QueryDocumentSnapshot<EventModel>> docs = snapshots.docs;
    List<EventModel> events = docs.map((e) => e.data()).toList();
    return events;
  }

  static Future<List<EventModel>> getWishlistEvents() async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    QuerySnapshot<EventModel> snapshots = await collection
        .where(
          "wishlist",
          arrayContains: FirebaseAuth.instance.currentUser!.uid,
        )
        .get();
    List<QueryDocumentSnapshot<EventModel>> docs = snapshots.docs;
    List<EventModel> events = docs.map((e) => e.data()).toList();
    return events;
  }

  static Future<void> addToWishlist(EventModel event) async {
    CollectionReference<EventModel> collection = _getEvenntCollection();

    List<String> wishlist = event.wishlist ?? [];
    if (wishlist.contains(FirebaseAuth.instance.currentUser!.uid)) {
      await removeFromWishlist(event);
      return;
    }
    wishlist.add(FirebaseAuth.instance.currentUser!.uid);
    DocumentReference<EventModel> doc = collection.doc(event.id);
    await doc.update({'wishlist': wishlist});
  }

  static Future<void> removeFromWishlist(EventModel event) async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    List<String> wishlist = event.wishlist ?? [];
    wishlist.remove(FirebaseAuth.instance.currentUser!.uid);
    DocumentReference<EventModel> doc = collection.doc(event.id);
    await doc.update({'wishlist': wishlist});
  }
}
