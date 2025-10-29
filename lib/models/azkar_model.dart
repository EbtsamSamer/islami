import 'dart:convert';

import 'package:flutter/services.dart';

class AzkarModel {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String content;

  AzkarModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return AzkarModel(
      category: json['category'] as String,
      count: json['count'] as String,
      description: json['description'] as String,
      reference: json['reference'] as String,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'count': count,
      'description': description,
      'reference': reference,
      'content': content,
    };
  }

 static Future <List<AzkarModel>> loadAzkarContent(String type) async {
    var jsonContent = jsonDecode(
        await rootBundle.loadString("assets/files/Azkar/azkar.json")
    );
    List<AzkarModel>azkar = (jsonContent[type] as List).map((azkarModel) =>
        AzkarModel.fromJson(azkarModel)).toList();
    return azkar;
  }
}