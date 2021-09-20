import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'authentication.dart' as auth;
//Before you go, you need to create your own <authentication.dart> file in /src folder
// and put there your personal Osu! API oAuth2 as listed below:  | (you can get oath2 data here https://osu.ppy.sh/home/account/edit)
//  String clientSecret = 'your oAuth2 pass';
//  var client_id = 'your id';


Future<Map<String, dynamic>> getToken() async{

  String tokenRequestBody = convert.jsonEncode({
    "grant_type": "client_credentials",
    "client_id": auth.client_id,
    "client_secret": auth.clientSecret,
    "scope": "public"
  });
  //print(tokenRequestBody);

  Map<String, String> tokenRequestHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  //print(tokenRequestHeaders);

  http.Response tokenRequestResponse = await http.post(
      Uri.https('osu.ppy.sh', '/oauth/token'),
      headers: tokenRequestHeaders,
      body: tokenRequestBody
  );

  if (tokenRequestResponse.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    //print(tokenRequestResponse);
    var token = convert.jsonDecode(tokenRequestResponse.body) as Map<String, dynamic>;
    return token;
  }
  else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}




