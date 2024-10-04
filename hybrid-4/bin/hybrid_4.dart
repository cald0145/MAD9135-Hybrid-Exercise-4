import 'package:hybrid_4/hybrid_4.dart' as hybrid_4;
import 'dart:convert';
import 'package:http/http.dart' as http;
//importing packages for json parsing and http requests

void main() async {
  //async await
  const int numberOfUsers = 10;
  const String apiUrl = 'https://random-data-api.com/api/v2/users?size=$numberOfUsers';

  try {
    //using try catch to handle errors for the http requests
    //using get and await to make the http request
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      //checking status code if OK then parse the json and 
      // use json decode to parse the data into a list of objects!
      final List<dynamic> users = json.decode(response.body);

      for (var user in users) {
        //looping through the list of users and printing each uid and name
        print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      //if status code is not 200 then print the status code and error message! :^)
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    //catch error in block
    print('An error occurred: $e');
  }
}