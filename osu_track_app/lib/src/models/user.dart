class User{
  var avatarURL;
  var defaultGroup;
  var id;
  var isOnline;
  var isActive;
  var isBot;
  var isDeleted;
  var isSupporter;
  var username;
  var customCoverURL;
  var defaultCoverURL;
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
  var kudosu;
  var lastVisit;
  var isRestricted;
  var discord;
  var twitter;
  var hasSupported;
  var interests;
  var location;
  var mainPlaymode;
  var playstyle;
  var postCount;
  var title;
  var badges;
  var favouriteBeatmapsCount;
  var followersCount;
  var graveyardBeatmapsCount;
  var lovedBeatmapsCount;
  var pendingBeatmapsCount;
  var userGroup;
  var userPage;
  var previousUsernames;
  var levelStatistics;
  var supportLevel;
  var userAchievments;
  var pmFriendsOnly;


  User({
    this.avatarURL,
    this.defaultGroup,
    this.id,
    this.isOnline,
    this.username,
    this.customCoverURL,
    this.defaultCoverURL,
    this.joinDate,
    this.countryCode,
    this.monthlyPlayCounts,
    this.scoresFirstCount,
    this.globalRank,
    this.rankedScore,
    this.totalPP,
    this.totalHits,
    this.hitAccuracy,
    this.playCount,
    this.playTime,
    this.maximumCombo,
    this.replaysWatched,
    this.amountOfSSH,
    this.amountOfSS,
    this.amountOfSh,
    this.amountOfS,
    this.amountOfA,
    this.countryRank,
    this.hasSupported,
    this.rankHistory,
    this.kudosu,
    this.lastVisit,
    this.postCount,
    this.isRestricted,
    this.isSupporter,
    this.badges,
    this.favouriteBeatmapsCount,
    this.followersCount,
    this.graveyardBeatmapsCount,
    this.lovedBeatmapsCount,
    this.pendingBeatmapsCount,
    this.userGroup,
    this.userPage,
    this.previousUsernames,
    this.levelStatistics,
    this.supportLevel,
    this.userAchievments,
    this.pmFriendsOnly,
    this.discord,
    this.twitter,
    this.interests,
    this.location,
    this.mainPlaymode,
    this.playstyle,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        avatarURL: json['avatar_url'],
        id: json['id'],
        isOnline: json['is_online'],
        username: json['username'],
        defaultCoverURL: json['cover']["url"],
        customCoverURL: json['cover']['custom_url'],
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
        kudosu: json['kudosu']['total'],
        lastVisit: json['last_visit'],
        postCount: json['post_count'],
        isRestricted: json['is_restricted'],
        badges: json['badges'],
        favouriteBeatmapsCount: json['favourite_beatmapset_count'],
        followersCount: json['followers_count'],
        graveyardBeatmapsCount: json['graveyard_beatmapset_count'],
        lovedBeatmapsCount: json['loved_beatmapset_count'],
        pendingBeatmapsCount: json['pending_beatmapset_count'],
        defaultGroup: json['default_group'],
        userGroup: json['group'],
        userPage: json['page'],
        previousUsernames: json['previous_usernames'],
        levelStatistics: json['statistics']['level'],
        supportLevel: json['support_level'],
        userAchievments: json['user_achievments'],
        isSupporter: json['is_supporter'],
        hasSupported: json['has_supported'],
        pmFriendsOnly: json['pm_friends_only'],
        discord: json['discord'],
        twitter: json['twitter'],
        interests: json['interests'],
        location: json['location'],
        mainPlaymode: json['playmode'],
        playstyle: json['playstyle']
    );
  }
  factory User.fromMapperFromJson(Map<String, dynamic> json) {
    return User(
      avatarURL: json['avatar_url'],
      id: json['id'],
      username: json['username'],
    );
  }
}