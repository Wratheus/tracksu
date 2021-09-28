import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../authentication.dart' as auth;
import '../objects/user.dart' as user;
import '../objects/scores.dart' as scores;
import '../objects/news.dart' as news;
import '../objects/beatmap.dart' as beatmap;
import '../objects/scoresbeatmap.dart' as beatmapScores;
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
Future <List<dynamic>> getUserScore(String token, String username, String numberOfRequesedScores) async{
  const scoresType = 'best';
  if (int.parse(numberOfRequesedScores) > 100 || int.parse(numberOfRequesedScores) <= 0){ throw Exception('wrong ScoreNumber'); }
  user.User player = await getUser(token, username);
  final userID = player.id;
  final params = {
    'include_fails': '1',
    'mode': 'osu',
    'limit': numberOfRequesedScores,
    'offset': '1'
  };

  final Uri userScoresUrl = Uri.https('osu.ppy.sh', 'api/v2/users/$userID/scores/$scoresType', params);
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  };
  final http.Response userScoresUrlResponse = await http.get(userScoresUrl, headers: headers);
  int scoreNumber = int.parse(numberOfRequesedScores);
  if (userScoresUrlResponse.statusCode == 200) {
      List<dynamic> myList = List.filled(100, 0, growable: false);
      var json = convert.jsonDecode(userScoresUrlResponse.body);
      if (json.length < 100) {scoreNumber = json.length;};
      for (int i = 0; i < scoreNumber; i++){
      myList[i] = scores.Scores.fromJson(json[i]);
    }
      return myList;
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get USER SCORES response.');
  }
}

// News request
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

// Beatmap request
Future <beatmap.Beatmap> getBeatmap(String token, String beatmapID) async{
  final Uri beatmapUrl = Uri.https('osu.ppy.sh', 'api/v2/beatmaps/$beatmapID');
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  };
  final http.Response beatmapUrlResponse = await http.get(beatmapUrl, headers: headers);

  if (beatmapUrlResponse.statusCode == 200) {
    return beatmap.Beatmap.fromJson(convert.jsonDecode(beatmapUrlResponse.body));
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get BEATMAP response.');
  }
}

// Beatmap top-50 request

Future <List<dynamic>> getBeatmapScores(String token, String beatmapID) async{
  final Uri beatmapUrl = Uri.https('osu.ppy.sh', 'api/v2/beatmaps/$beatmapID/scores');
  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $token"
  };
  final http.Response beatmapScoresUrlResponse = await http.get(beatmapUrl, headers: headers);

  if (beatmapScoresUrlResponse.statusCode == 200) {
    List<dynamic> myList = List.filled(100, 0, growable: false);
    var json = convert.jsonDecode(beatmapScoresUrlResponse.body);
    for (int i = 0; i < json['scores'].length; i++){
      myList[i] = beatmapScores.BeatmapScores.fromJson(json['scores'][i]);
    }
    return myList;
  }
  else {
    // If the server did not return a 200 CREATED response,
    throw Exception('Failed to get BEATMAP TOP - 50 SCORES response.');
  }
}

