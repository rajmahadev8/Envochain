import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:envochain/models/feedmodel.dart';
import 'package:http/http.dart' as http;
import 'package:envochain/util/utility.dart';
import './authprovider.dart';

class FeedProvider with ChangeNotifier {
  List<FeedModel> posts = [];

  Future<String?> fetchFeeds() async {
    final resp =
        await http.post(Uri.parse("${Utility.URL}/feed/posts"), headers: {
      "Authorization": "Bearer ${AuthProvider.authUser.gettoken}",
    });
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body);
      if (data["message"] == "Posts fetched successfully") {
        posts = data["data"]
            .map<FeedModel>((feed) => FeedModel(
                username: feed["author"]["username"],
                postImage: feed["image"],
                postDescription: feed["description"],
                profileImage: feed["author"]["profile_pic"],
                userId: feed["author"]["_id"]))
            .toList();
        notifyListeners();
      } else {
        return "fail";
      }
    } else {
      return "fail";
    }
  }

  List<FeedModel> get getFeedList => posts;
}
