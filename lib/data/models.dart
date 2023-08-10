import 'dart:convert';

import 'package:http/http.dart' as http;

class Data {
  final String fullName;
  final String portraitUrl;
  final String country;
  final String address;
  final String city;
  final String state;
  final String email;
  final String cellPhone;

  Data({
    required this.fullName,
    required this.portraitUrl,
    required this.country,
    required this.address,
    required this.city,
    required this.state,
    required this.email,
    required this.cellPhone,
  });
}

class DataService {
  Future<List<Data>> fetchData() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=100'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Data> details = [];

      data['results'].forEach((friendData) {
        details.add(Data(
          fullName: friendData['name']['first'] + ' ' + friendData['name']['last'],
          portraitUrl: friendData['picture']['large'],
          country: friendData['location']['country'],
          address: friendData['location']['street']['name'],
          city: friendData['location']['city'],
          state: friendData['location']['state'],
          email: friendData['email'],
          cellPhone: friendData['cell'],
        ));
      });

      return details;
    } else {
      throw Exception('Failed to load details');
    }
  }
}
