// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

RxList<Post> allPostsList = <Post>[].obs;


class Post {
  Post({
    this.id,
    this.caption,
    this.media,
    this.createdAt,
    this.author,
    this.spot,
    this.relevantComments,
    this.numberOfComments,
    this.likedBy,
    this.numberOfLikes,
    this.tags,
    this.url,
  });

  String? id;
  Caption? caption;
  List<Media>? media;
  DateTime? createdAt;
  Author? author;
  Spot? spot;
  dynamic relevantComments;
  int? numberOfComments;
  dynamic likedBy;
  int? numberOfLikes;
  List? tags;
  String? url;

   Post.fromJson(Map<String, dynamic> json) {
     allPostsList.add(
         Post(
           id: json["id"],
           caption: Caption.fromJson(json["caption"]),
           media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
           createdAt: DateTime.parse(json["created_at"]),
           author: Author.fromJson(json["author"]),
           spot: Spot.fromJson(json["spot"]),
           relevantComments: json["relevant_comments"],
           numberOfComments: json["number_of_comments"],
           likedBy: json["liked_by"],
           numberOfLikes: json["number_of_likes"],
           tags: json["caption"]["tags"],
           url: json["url"],
         )
     ) ;
   }


  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption!.toJson(),
    "media": List<dynamic>.from(media!.map((x) => x.toJson())),
    "created_at": createdAt!.toIso8601String(),
    "author": author!.toJson(),
    "spot": spot!.toJson(),
    "relevant_comments": relevantComments,
    "number_of_comments": numberOfComments,
    "liked_by": likedBy,
    "number_of_likes": numberOfLikes,
    "tags": tags,
    "url": url,
  };
}

class Author {
  Author({
    this.id,
    this.username,
    this.photoUrl,
    this.fullName,
    this.isPrivate,
    this.isVerified,
    this.followStatus,
  });

  String? id;
  String? username;
  String? photoUrl;
  String? fullName;
  bool? isPrivate;
  bool? isVerified;
  String? followStatus;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    username: json["username"],
    photoUrl: json["photo_url"],
    fullName: json["full_name"],
    isPrivate: json["is_private"],
    isVerified: json["is_verified"],
    followStatus: json["follow_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "photo_url": photoUrl,
    "full_name": fullName,
    "is_private": isPrivate,
    "is_verified": isVerified,
    "follow_status": followStatus,
  };
}

class Caption {
  Caption({
    this.text,
    this.tags,
  });

  String? text;
  List<Tag>? tags;

  factory Caption.fromJson(Map<String, dynamic> json) => Caption(
    text: json["text"],
    tags:
    json["tags"]!=null?
    List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))):<Tag>[],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
  };
}

class Tag {
  Tag({
    this.id,
    this.displayText,
    this.tagText,
    this.url,
    this.type,
  });

  String? id;
  String? displayText;
  String? tagText;
  String? url;
  String? type;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    displayText: json["display_text"],
    tagText: json["tag_text"],
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "display_text": displayText,
    "tag_text": tagText,
    "url": url,
    "type": type,
  };
}

class Media {
  Media({
    this.url,
    this.blurHash,
    this.type,
  });

  String? url;
  String? blurHash;
  String? type;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    url: json["url"],
    blurHash: json["blur_hash"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "blur_hash": blurHash,
    "type": type,
  };
}

class Spot {
  Spot({
    this.id,
    this.name,
    this.types,
    this.logo,
    this.location,
    this.isSaved,
  });

  String? id;
  String? name;
  List<Type>? types;
  Logo? logo;
  Location? location;
  bool? isSaved;

  factory Spot.fromJson(Map<String, dynamic> json) => Spot(
    id: json["id"],
    name: json["name"],
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    logo: Logo.fromJson(json["logo"]),
    location: Location.fromJson(json["location"]),
    isSaved: json["is_saved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "types": List<dynamic>.from(types!.map((x) => x.toJson())),
    "logo": logo!.toJson(),
    "location": location!.toJson(),
    "is_saved": isSaved,
  };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
    this.display,
  });

  double? latitude;
  double? longitude;
  String? display;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    display: json["display"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "display": display,
  };
}

class Logo {
  Logo({
    this.url,
    this.type,
  });

  String? url;
  String? type;

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "type": type,
  };
}

class Type {
  Type({
    this.id,
    this.name,
    this.url,
  });

  int? id;
  String? name;
  String? url;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    id: json["id"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
  };
}
