import 'package:flutter/material.dart';
import 'package:friends/data/models.dart';
import 'package:friends/presentation/details_screen.dart';


class DetailsCardWidget extends StatelessWidget {
  final Data friend;

  const DetailsCardWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPageScreen(friend: friend),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.network(friend.portraitUrl),
            Text(friend.fullName),
            Text(friend.country),
          ],
        ),
      ),
    );
  }
}