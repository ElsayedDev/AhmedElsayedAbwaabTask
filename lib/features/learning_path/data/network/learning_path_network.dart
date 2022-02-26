import 'package:flutter/material.dart';
import 'package:forinterview/core/constants/network/network_constants.dart';
import 'package:forinterview/features/learning_path/data/models/models.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LearningPathNetwork {
  static Future<String?> getUsersData() async {
    try {
      var _url =
          Uri.parse(NetworkConstants.domain + NetworkConstants.getUserEndPoint);

      Response _response = await get(_url);

      return _response.body;
    } catch (e) {
      return null;
    }
  }
}
