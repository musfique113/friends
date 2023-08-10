import 'package:flutter/material.dart';
import 'package:friends/data/models.dart';
import 'package:friends/presentation/components/card_view_widget.dart';


class GridViewWidget extends StatelessWidget {
  final List<Data> friends;

  const GridViewWidget({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return DetailsCardWidget(friend: friends[index]);
      },
    );
  }
}