import 'package:flutter/material.dart';
import 'package:friends/models/models.dart';
import 'package:friends/view/details_screen.dart';
import 'package:get/get.dart';

class DetailsCardWidget extends StatelessWidget {
  final Data friend;

  const DetailsCardWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPageScreen(friend: friend));
      },
      child: Card(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(friend.portraitUrl),
                  radius: 50,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  friend.fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  friend.country,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
