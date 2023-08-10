import 'package:flutter/material.dart';
import 'package:friends/data/models.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPageScreen extends StatelessWidget {

  final Data friend;

  const DetailPageScreen({super.key, required this.friend});

  launchEmail() async {
    var emailPath = friend.email;
    var head = "mailto:";
    var url = "$head$emailPath";
    print(url);
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend Details'),
      ),
      body: Column(
        children: [
          Image.network(friend.portraitUrl),
          Text(friend.fullName),
          Text('Address: ${friend.address}'),
          Text('City, State, Country: ${friend.city}, ${friend.state}, ${friend.country}'),
          Text('Email: ${friend.email}'),
          Text('Cell Phone: ${friend.cellPhone}'),
          ElevatedButton(
            onPressed: launchEmail,
            child: const Text('Send Email'),
          ),
        ],
      ),
    );
  }
}
