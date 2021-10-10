import 'package:flutter/material.dart';

class TabModel {
  final String name;
  final IconData icon;

  const TabModel({required this.name, required this.icon});
}

enum TabItem { News, OsuTrack, LeaderBoard }