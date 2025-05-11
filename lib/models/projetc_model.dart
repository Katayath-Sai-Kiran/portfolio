// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProjetcModel {
  final String name;
  final String description;
  final List<String> points;
  final List<String> techStack;
  final String banner;
  ProjetcModel({
    required this.name,
    required this.description,
    required this.points,
    required this.techStack,
    required this.banner,
  });

  ProjetcModel copyWith({
    String? name,
    String? description,
    List<String>? points,
    List<String>? techStack,
    String? banner,
  }) {
    return ProjetcModel(
      name: name ?? this.name,
      description: description ?? this.description,
      points: points ?? this.points,
      techStack: techStack ?? this.techStack,
      banner: banner ?? this.banner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'points': points,
      'techStack': techStack,
      'banner': banner,
    };
  }

  factory ProjetcModel.fromMap(Map<String, dynamic> map) {
    return ProjetcModel(
      name: map['name'] as String,
      description: map['description'] as String,
      points: List<String>.from((map['points'] as List<String>)),
      techStack: List<String>.from((map['techStack'] as List<String>)),
      banner: map['banner'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjetcModel.fromJson(String source) =>
      ProjetcModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProjetcModel(name: $name, description: $description, points: $points, techStack: $techStack, banner: $banner)';
  }

  @override
  bool operator ==(covariant ProjetcModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        listEquals(other.points, points) &&
        listEquals(other.techStack, techStack) &&
        other.banner == banner;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        points.hashCode ^
        techStack.hashCode ^
        banner.hashCode;
  }
}
