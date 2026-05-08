import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/screens/home/event/event_card.dart';
import 'package:evently_app/services/event_service.dart';
import 'package:flutter/material.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: FutureBuilder(
          future: EventService.getWishlistEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Icon(Icons.error, size: 80, color: Colors.red),
              );
            } else {
              List<EventModel> events = snapshot.data ?? [];
              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) =>
                    EventCard(eventModel: events[index]),
              );
            }
          },
        ),
      ),
    );
  }
}
