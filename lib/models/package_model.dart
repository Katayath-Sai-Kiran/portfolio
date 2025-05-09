// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PackageModel {
  final String name;
  final String description;
  final String link;
  final String banner;
  final int downloads;
  final int pubPoints;
  PackageModel({
    required this.name,
    required this.description,
    required this.link,
    required this.banner,
    required this.downloads,
    required this.pubPoints,
  });

  PackageModel copyWith({
    String? name,
    String? description,
    String? link,
    String? banner,
    int? downloads,
    int? pubPoints,
  }) {
    return PackageModel(
      name: name ?? this.name,
      description: description ?? this.description,
      link: link ?? this.link,
      banner: banner ?? this.banner,
      downloads: downloads ?? this.downloads,
      pubPoints: pubPoints ?? this.pubPoints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'link': link,
      'banner': banner,
      'downloads': downloads,
      'pubPoints': pubPoints,
    };
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      name: map['name'] as String,
      description: map['description'] as String,
      link: map['link'] as String,
      banner: map['banner'] as String,
      downloads: map['downloads'] as int,
      pubPoints: map['pubPoints'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PackageModel.fromJson(String source) =>
      PackageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PackageModel(name: $name, description: $description, link: $link, banner: $banner, downloads: $downloads, pubPoints: $pubPoints)';
  }

  @override
  bool operator ==(covariant PackageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.link == link &&
      other.banner == banner &&
      other.downloads == downloads &&
      other.pubPoints == pubPoints;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      link.hashCode ^
      banner.hashCode ^
      downloads.hashCode ^
      pubPoints.hashCode;
  }
}
