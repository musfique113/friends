import 'package:flutter/material.dart';
import 'package:friends/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPageScreen extends StatelessWidget {
  final Data friend;

  const DetailPageScreen({super.key, required this.friend});

  _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: friend.email,
    );
    //String url = emailLaunchUri as String;
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout()
              : _buildLandscapeLayout();
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(friend.portraitUrl),
              radius: 100,
            ),
            const SizedBox(height: 16),
            _buildTextInfo(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchEmail,
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildTextInfo(),
                const SizedBox(height: 5),
                // Add some spacing between text and button
                ElevatedButton(
                  onPressed: _launchEmail,
                  child: const Text('Send Email'),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: CircleAvatar(
            backgroundImage: NetworkImage(friend.portraitUrl),
            radius: 100,
          ),
        ),
      ],
    );
  }

  Widget _buildTextInfo() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              friend.fullName,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Address: ${friend.address}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            'City: ${friend.city}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            'State: ${friend.state}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            'Country: ${friend.country}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            'Email: ${friend.email}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            'Cell Phone: ${friend.cellPhone}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
