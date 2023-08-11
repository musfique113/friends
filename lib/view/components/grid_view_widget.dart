import 'package:flutter/material.dart';
import 'package:friends/controllers/controller.dart';
import 'package:friends/view/components/card_view_widget.dart';
import 'package:get/get.dart';

class GridViewWidget extends StatelessWidget {
  final DataController friendsController = Get.find();

  GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: friendsController.friends.length,
          itemBuilder: (context, index) {
            return DetailsCardWidget(friend: friendsController.friends[index]);
          },
        ));
  }
}
