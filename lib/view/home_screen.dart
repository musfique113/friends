import 'package:flutter/material.dart';
import 'package:friends/controllers/controller.dart';
import 'package:friends/models/models.dart';
import 'package:friends/services/data_services.dart';
import 'package:friends/view/components/grid_view_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

        final DataService _friendService = DataService();

    HomeScreen({super.key, required Orientation orientation});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Friends HomeScreen'),
        ),
      body: FutureBuilder<List<Data>>(
        future: _friendService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading friends'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No friends to display'));
          } else {
            final friendsController = Get.put(DataController());
            friendsController.friends.value = snapshot.data!;
            return OrientationBuilder(
              // Wrap the FriendsGrid in an OrientationBuilder
              builder: (context, orientation) {
                return GridViewWidget(orientation: orientation);
              },
            );
          }
        },
      ),
    );
  }
}
