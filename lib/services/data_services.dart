import 'dart:convert';

import 'package:friends/models/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  //calling data from API
  Future<List<Data>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Data> details = [];

      data['results'].forEach((friendData) {
        details.add(Data(
          fullName:
              friendData['name']['first'] + ' ' + friendData['name']['last'],
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
