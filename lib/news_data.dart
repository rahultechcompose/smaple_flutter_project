import 'dart:convert';


class NewsResponse {
  NewsResponse({
  /*  this.status,
    this.statusCode,
    this.version,
    this.lastModified,
    this.access,
    this.total,
    this.limit,
    this.offset,*/
    this.data,
  });

/*  final String status;
  final int statusCode;
  final String version;
  final String lastModified;
  final String access;
  final int total;
  final int limit;
  final int offset;*/
  final List<NewsData> data;

  factory NewsResponse.fromRawJson(String str) => NewsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
 /*   status: json["status"] == null ? null : json["status"],
    statusCode: json["status-code"] == null ? null : json["status-code"],
    version: json["version"] == null ? null : json["version"],
    lastModified: json["last-modified"] == null ? null : json["last-modified"],
    access: json["access"] == null ? null : json["access"],
    total: json["total"] == null ? null : json["total"],
    limit: json["limit"] == null ? null : json["limit"],
    offset: json["offset"] == null ? null : json["offset"],*/
    data: json["data"] == null ? null : List<NewsData>.from(json["data"].map((x) => NewsData.fromJson(x as Map<String, dynamic>)) as Iterable),
  );

  Map<String, dynamic> toJson() => {
/*    "status": status == null ? null : status,
    "status-code": statusCode == null ? null : statusCode,
    "version": version == null ? null : version,
    "last-modified": lastModified == null ? null : lastModified,
    "access": access == null ? null : access,
    "total": total == null ? null : total,
    "limit": limit == null ? null : limit,
    "offset": offset == null ? null : offset,*/
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NewsData {
  NewsData({
    this.id,
    this.title,
    this.summary,
    this.link,
    this.published,
    this.image,
  });

  final int id;
  final String title;
  final String summary;
  final String link;
  final String published;
  final String image;

  factory NewsData.fromRawJson(String str) => NewsData.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
    id: json["id"] == null ? null : json["id"] as int,
    title: json["title"] == null ? null : json["title"] as String,
    summary: json["summary"] == null ? null : json["summary"] as String,
    link: json["link"] == null ? null : json["link"] as String,
    published: json["published"] == null ? null : json["published"] as String,
    image: json["image"] == null ? null : json["image"] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "summary": summary,
    "link": link,
    "published": published ,
    "image": image,
  };
}
