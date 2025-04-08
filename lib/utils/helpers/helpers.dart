import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';

import '../../views/models/user_model.dart';
import '../app_colors.dart';
import '../sessions/session_management.dart';
import '../sessions/session_token_keys.dart';

class Helpers {

  static String getYouTubeVideoId(String url) {
    Uri uri = Uri.parse(url);
    if (uri.host == "youtu.be") {
      return uri.pathSegments.first;
    } else if (uri.host.contains("youtube.c")) {
      return uri.queryParameters["v"] ?? "";
    }
    return "";
  }
  static String getYouTubeThumbnail(String url) {
    String videoId = getYouTubeVideoId(url);
    return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
  }

  static String formatTime(String? createdAt) {
    if (createdAt == null || createdAt.isEmpty) return "";
    try {
      DateTime dateTime = DateTime.parse(createdAt);
      return DateFormat.jm().format(dateTime);
    } catch (e) {
      return "";
    }
  }



}




