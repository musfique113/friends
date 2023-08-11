import 'package:flutter/material.dart';
import 'package:friends/controllers/controller.dart';
import 'package:friends/view/components/card_view_widget.dart';
import 'package:get/get.dart';

class GridViewWidget extends StatelessWidget {
  final DataController dataController = Get.find();
  final Orientation orientation;

  GridViewWidget({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: dataController.friends.length,
        itemBuilder: (context, index) {
          return DetailsCardWidget(friend: dataController.friends[index]);
        },
      );
    });
  }
}
