import 'package:flutter/material.dart';
import 'src/requests.dart';
import 'src/user.dart' as user;

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
    //print(token['access_token']);
    final player = await getUser(token['access_token'], 'Repentance');
    print(player.avatarURL);
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
    print(player.rankHistory);
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
