class User{
  String?avatarURL;
  int?id;
  bool?isOnline;
  String?userName;
  String?coverURL;
  String?joinDate;
  String?country;
  List<dynamic>?monthlyPlayCounts;
  int?scoresFirstCount;
  int?globalRank;
  double?totalPP;
  double?hitAccuracy;
  int?playCount;
  int?playTime;
  int?maximumCombo;
  int?replaysWatched;
  int?amountOfSSH;
  int?amountOfSS;
  int?amountOfS;
  int?amountOfSh;
  int?amountOfA;
  int?countryRank;
  List<dynamic>?rankHistory;

  User({
    required this.avatarURL,
    required this.id,
    required this.isOnline,
    required this.userName,
    required this.coverURL,
    required this.joinDate,
    required this.country,
    required this.monthlyPlayCounts,
    required this.scoresFirstCount,
    required this.globalRank,
    required this.totalPP,
    required this.hitAccuracy,
    required this.playCount,
    required this.playTime,
    required this.maximumCombo,
    required this.replaysWatched,
    required this.amountOfSSH,
    required this.amountOfSS,
    required this.amountOfSh,
    required this.amountOfS,
    required this.amountOfA,
    required this.countryRank,
    required this.rankHistory
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatarURL: json['avatar_url'],
      id: json['id'],
      isOnline: json['is_online'],
      userName: json['username'],
      coverURL: json['cover']['custom_url'],
      joinDate: json['join_date'],
      country: json['country']['name'],
      monthlyPlayCounts: json['monthly_playcounts'],
      scoresFirstCount: json['scores_first_count'],
      globalRank: json['statistics']['global_rank'],
      totalPP: json['statistics']['pp'],
      hitAccuracy: json['statistics']['hit_accuracy'],
      playCount: json['statistics']['play_count'],
      playTime: json['statistics']['play_time'],
      maximumCombo: json['statistics']['maximum_combo'],
      replaysWatched: json['statistics']['replays_watched_by_others'],
      amountOfSSH: json['statistics']['grade_counts']['ssh'],
      amountOfSS: json['statistics']['grade_counts']['ss'],
      amountOfSh: json['statistics']['grade_counts']['sh'],
      amountOfS: json['statistics']['grade_counts']['s'],
      amountOfA: json['statistics']['grade_counts']['a'],
      countryRank: json['statistics']['country_rank'],
      rankHistory: json['rankHistory']['data'],
    );
  }
}