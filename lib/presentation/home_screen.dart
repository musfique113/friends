import 'package:flutter/material.dart';
import 'package:friends/data/models.dart';
import 'package:friends/presentation/components/grid_view_widget.dart';

class HomeScreen extends StatelessWidget {
  final DataService _friendService = DataService();

  HomeScreen({super.key, required Orientation orientation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Details'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _friendService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading friends'));
          } else {
            List<Data> friends = snapshot.data as List<Data>;
            return GridViewWidget(friends: friends);
          }
        },
      ),
    );
  }
}
