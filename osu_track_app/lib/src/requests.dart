import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'authentication.dart' as auth;
import 'user.dart' as user;
import 'scores.dart' as scores;
import 'news.dart' as news;
/*  Before you go, you need to create your own <authentication.dart> file in /src folder
and put there your personal Osu! API oAuth2 as listed below:  | (you can get oath2 data here https://osu.ppy.sh/home/account/edit)
const clientSecret = 'your oAuth2 pass';
const client_id = 'your id'; */

// Token Request
Future<Map<String, dynamic>> getToken() async{

  final String tokenRequestBody = convert.jsonEncode({
    "grant_type": "client_credentials",
    "client_id": auth.client_id,
    "client_secret": auth.clientSecret,
    "scope": "public"
  });
  final Map<String, String> tokenRequestHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  final http.Response tokenRequestResponse = await http.post(
      Uri.https('osu.ppy.sh', '/oauth/token'),
      headers: tokenRequestHeaders,
      body: tokenRequestBody
  );
  if (tokenRequestResponse.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    final token = convert.jsonDecode(tokenRequestResponse.body) as Map<String, dynamic>;
    return token;
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get TOKEN response.');
  }
}

// User request
Future <user.User> getUser(String token, String username) async{

  final params = {
    'key': 'username'
  };
  final Uri userUrl = Uri.https('osu.ppy.sh', 'api/v2/users/$username', params);
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  };
  final http.Response userGetResponse = await http.get(userUrl, headers: headers);

  if (userGetResponse.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    return user.User.fromJson(convert.jsonDecode(userGetResponse.body));
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get USER response.');
  }
}


// User Score list Request
Future <List<dynamic>> getUserScore(String token, String username, String scoreNumber) async{
  const scoresType = 'best';
  if (int.parse(scoreNumber) > 100 || int.parse(scoreNumber) <= 0){ throw Exception('wrong ScoreNumber'); }
  user.User player = await getUser(token, username);
  final userID = player.id;
  final params = {
    'include_fails': '1',
    'mode': 'osu',
    'limit': '$scoreNumber',
    'offset': '1'
  };

  final Uri userScoresUrl = Uri.https('osu.ppy.sh', 'api/v2/users/$userID/scores/$scoresType', params);
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  };
  final http.Response userScoresUrlResponse = await http.get(userScoresUrl, headers: headers);

  if (userScoresUrlResponse.statusCode == 200) {
      var ScoreList = [];
      var Json = convert.jsonDecode(userScoresUrlResponse.body);
      Json[1] = scores.Scores.fromJson(Json[1]);
      for (int i = 0; i < int.parse(scoreNumber); i++){
        /*print(i);
        print(Json[i]);
        Json[i] = scores.Scores.fromJson(Json[i]);
        print(Json[i].scoreId);*/
    }
      return Json;
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get USER SCORES response.');
  }
}

Future <news.News> getNews(String token) async{
  final Uri newsUrl = Uri.https('osu.ppy.sh', 'api/v2/news');
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  };
  final http.Response newsUrlResponse = await http.get(newsUrl, headers: headers);

  if (newsUrlResponse.statusCode == 200) {
    return news.News.fromJson(convert.jsonDecode(newsUrlResponse.body));
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get NEWS response.');
  }
}



