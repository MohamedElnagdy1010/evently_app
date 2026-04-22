import 'package:flutter/material.dart';

class ProfilTab extends StatelessWidget {
  const ProfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile Tab",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
