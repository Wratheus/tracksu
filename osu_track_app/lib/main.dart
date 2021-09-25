import 'package:flutter/material.dart';
import 'src/requests.dart';
import 'src/user.dart' as user;
import 'src/scores.dart' as scores;
import 'src/news.dart' as news;

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Osu!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() async{
    final token = await getToken();
    print(token['access_token']);
    final player = await getUser(token['access_token'], 'Repentance');
    /*print(player.avatarURL);
    print(player.id);
    print(player.isOnline);
    print(player.userName);
    print(player.coverURL);
    print(player.joinDate);
    print(player.country);
    print(player.monthlyPlayCounts);
    print(player.scoresFirstCount);
    print(player.globalRank);
    print(player.totalPP);
    print(player.hitAccuracy);
    print(player.playCount);
    print(player.playTime);
    print(player.maximumCombo);
    print(player.replaysWatched);
    print(player.amountOfSSH);
    print(player.amountOfSS);
    print(player.amountOfSh);
    print(player.amountOfS);
    print(player.amountOfA);
    print(player.countryRank);
    print(player.rankHistory);*/
    List<dynamic> userScore = await getUserScore(token['access_token'], 'Repentance', '12');
    for (int i = 0; i < 100; i++) {
      scores.Scores score = userScore[1];
    }
    print(score.scoreId);
    print(score.mapperName);
    /*print(userScore.mapperId);
    print(userScore.mapperName);
    print(userScore.coversJPG);
    print(userScore.artistName);
    print(userScore.beatmapURL);
    print(userScore.beatmapLength);
    print(userScore.beatmapLength);
    print(userScore.beatmapSetMapId);
    print(userScore.beatmapSetId);
    print(userScore.coversJPG);
    print(userScore.difficultyName);
    print(userScore.difficultyRating);
    print(userScore.gainedPP);
    print(userScore.bestScoreOnMapId);
    print(userScore.dateOfScore);
    print(userScore.mapRank);
    print(userScore.mapStatistics);
    print(userScore.maxCombo);
    print(userScore.scorePoints);
    print(userScore.scoreId);
    print(userScore.AR);
    print(userScore.CS);
    print(userScore.HP);
    print(userScore.OD);
    print(userScore.BPM);
    print(userScore.mapTitle);
    news.News News = await getNews(token['access_token']);
    print(News.id);
    print(News.author);
    print(News.editURL);
    print(News.firstImage);
    print(News.publishedAt);
    print(News.updatedAt);
    print(News.slug);
    print(News.title);
    print(News.preview);*/
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '1',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add)
      )
    );
  }
}
