import 'package:flutter/material.dart';

class FavTab extends StatelessWidget {
  const FavTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favorite Tab",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
