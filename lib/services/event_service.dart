import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/screens/events/provider/evnent_provider.dart';

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

  static editEvent(EventModel event) {}
  static deleteEvent(String eventId) {}

  
  static Future<List<EventModel>> getAllEvents() async {
    CollectionReference<EventModel> collection = _getEvenntCollection();
    QuerySnapshot<EventModel> snapshots = await collection.get();
    List<QueryDocumentSnapshot<EventModel>> docs = snapshots.docs;
    List<EventModel> events = docs.map((e) => e.data()).toList();
    return events; 
  }
}
