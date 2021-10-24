class User{
  var avatarURL;
  var id;
  var isOnline;
  var username;
  var coverURL;
  var joinDate;
  var countryCode;
  List<dynamic>?monthlyPlayCounts;
  var scoresFirstCount;
  var globalRank;
  var rankedScore;
  var totalPP;
  var totalHits;
  var hitAccuracy;
  var playCount;
  var playTime;
  var maximumCombo;
  var replaysWatched;
  var amountOfSSH;
  var amountOfSS;
  var amountOfS;
  var amountOfSh;
  var amountOfA;
  var countryRank;
  List<dynamic>?rankHistory;

  User({
    required this.avatarURL,
    required this.id,
    required this.isOnline,
    required this.username,
    required this.coverURL,
    required this.joinDate,
    required this.countryCode,
    required this.monthlyPlayCounts,
    required this.scoresFirstCount,
    required this.globalRank,
    required this.rankedScore,
    required this.totalPP,
    required this.totalHits,
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
      username: json['username'],
      coverURL: json['cover']['custom_url'],
      joinDate: json['join_date'],
      countryCode: json['country_code'],
      monthlyPlayCounts: json['monthly_playcounts'],
      scoresFirstCount: json['scores_first_count'],
      globalRank: json['statistics']['global_rank'],
      rankedScore: json['statistics']['ranked_score'],
      totalPP: json['statistics']['pp'],
      hitAccuracy: json['statistics']['hit_accuracy'],
      totalHits: json['statistics']['total_hits'],
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