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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(friend.portraitUrl),
                radius: 100,
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  friend.fullName,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Address: ${friend.address}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'City: ${friend.city}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'State: ${friend.state}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Country: ${friend.country}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Email: ${friend.email}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'Cell Phone: ${friend.cellPhone}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: launchEmail,
                child: const Text('Send Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
