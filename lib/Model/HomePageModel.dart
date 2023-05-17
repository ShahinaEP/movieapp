


// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  VideoStreamingApp? videoStreamingApp;
  int? statusCode;

  HomePageModel({
    this.videoStreamingApp,
    this.statusCode,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    videoStreamingApp: json["VIDEO_STREAMING_APP"] == null ? null : VideoStreamingApp.fromJson(json["VIDEO_STREAMING_APP"]),
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "VIDEO_STREAMING_APP": videoStreamingApp?.toJson(),
    "status_code": statusCode,
  };
}

class VideoStreamingApp {
  List<Slider>? slider;
  String? imgVideoUrl;
  RecentlyAdded? recentlyAdded;
  RecentlyAdded? trending;
  ComedyShow? drama;
  ComedyShow? serial;
  ComedyShow? comedyShow;
  ComedyShow? comedySkit;
  ComedyShow? jokesAndStandUpComedy;
  ComedyShow? danceMusic;
  ComedyShow? webSeries;

  VideoStreamingApp({
    this.slider,
    this.imgVideoUrl,
    this.recentlyAdded,
    this.trending,
    this.drama,
    this.serial,
    this.comedyShow,
    this.comedySkit,
    this.jokesAndStandUpComedy,
    this.danceMusic,
    this.webSeries,
  });

  factory VideoStreamingApp.fromJson(Map<String, dynamic> json) => VideoStreamingApp(
    slider: json["slider"] == null ? [] : List<Slider>.from(json["slider"]!.map((x) => Slider.fromJson(x))),
    imgVideoUrl: json["img_video_url"],
    recentlyAdded: json["recently_added"] == null ? null : RecentlyAdded.fromJson(json["recently_added"]),
    trending: json["trending"] == null ? null : RecentlyAdded.fromJson(json["trending"]),
    drama: json["drama"] == null ? null : ComedyShow.fromJson(json["drama"]),
    serial: json["serial"] == null ? null : ComedyShow.fromJson(json["serial"]),
    comedyShow: json["comedy-show"] == null ? null : ComedyShow.fromJson(json["comedy-show"]),
    comedySkit: json["comedy-skit"] == null ? null : ComedyShow.fromJson(json["comedy-skit"]),
    jokesAndStandUpComedy: json["jokes-and-stand-up-comedy"] == null ? null : ComedyShow.fromJson(json["jokes-and-stand-up-comedy"]),
    danceMusic: json["dance-music"] == null ? null : ComedyShow.fromJson(json["dance-music"]),
    webSeries: json["web-series"] == null ? null : ComedyShow.fromJson(json["web-series"]),
  );

  Map<String, dynamic> toJson() => {
    "slider": slider == null ? [] : List<dynamic>.from(slider!.map((x) => x.toJson())),
    "img_video_url": imgVideoUrl,
    "recently_added": recentlyAdded?.toJson(),
    "trending": trending?.toJson(),
    "drama": drama?.toJson(),
    "serial": serial?.toJson(),
    "comedy-show": comedyShow?.toJson(),
    "comedy-skit": comedySkit?.toJson(),
    "jokes-and-stand-up-comedy": jokesAndStandUpComedy?.toJson(),
    "dance-music": danceMusic?.toJson(),
    "web-series": webSeries?.toJson(),
  };
}

class ComedyShow {
  int? currentPage;
  List<MovieDatum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  ComedyShow({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ComedyShow.fromJson(Map<String, dynamic> json) => ComedyShow(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<MovieDatum>.from(json["data"]!.map((x) => MovieDatum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class MovieDatum {
  int? id;
  String? videoAccess;
  String? movieLangId;
  String? movieGenreId;
  String? playlistId;
  String? videoTitle;
  String? releaseDate;
  String? duration;
  String? videoDescription;
  String? videoSlug;
  String? videoImageThumb;
  String? videoImage;
  String? videoType;
  String? videoUrl;
  String? views;
  dynamic downloadEnable;
  dynamic downloadUrl;
  dynamic imdbId;
  dynamic imdbRating;
  dynamic imdbVotes;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  String? status;
  dynamic createdAt;
  DateTime? updatedAt;
  String? mainApp;

  MovieDatum({
    this.id,
    this.videoAccess,
    this.movieLangId,
    this.movieGenreId,
    this.playlistId,
    this.videoTitle,
    this.releaseDate,
    this.duration,
    this.videoDescription,
    this.videoSlug,
    this.videoImageThumb,
    this.videoImage,
    this.videoType,
    this.videoUrl,
    this.views,
    this.downloadEnable,
    this.downloadUrl,
    this.imdbId,
    this.imdbRating,
    this.imdbVotes,
    this.seoTitle,
    this.seoDescription,
    this.seoKeyword,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.mainApp,
  });

  factory MovieDatum.fromJson(Map<String, dynamic> json) => MovieDatum(
    id: json["id"],
    videoAccess: json["video_access"],
    movieLangId: json["movie_lang_id"],
    movieGenreId: json["movie_genre_id"],
    playlistId: json["playlist_id"],
    videoTitle: json["video_title"],
    releaseDate: json["release_date"],
    duration: json["duration"],
    videoDescription: json["video_description"],
    videoSlug: json["video_slug"],
    videoImageThumb: json["video_image_thumb"],
    videoImage: json["video_image"],
    videoType: json["video_type"],
    videoUrl: json["video_url"],
    views: json["views"],
    downloadEnable: json["download_enable"],
    downloadUrl: json["download_url"],
    imdbId: json["imdb_id"],
    imdbRating: json["imdb_rating"],
    imdbVotes: json["imdb_votes"],
    seoTitle: json["seo_title"],
    seoDescription: json["seo_description"],
    seoKeyword: json["seo_keyword"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    mainApp: json["main_app"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video_access": videoAccess,
    "movie_lang_id": movieLangId,
    "movie_genre_id": movieGenreId,
    "playlist_id": playlistId,
    "video_title": videoTitle,
    "release_date": releaseDate,
    "duration": duration,
    "video_description": videoDescription,
    "video_slug": videoSlug,
    "video_image_thumb": videoImageThumb,
    "video_image": videoImage,
    "video_type": videoType,
    "video_url": videoUrl,
    "views": views,
    "download_enable": downloadEnable,
    "download_url": downloadUrl,
    "imdb_id": imdbId,
    "imdb_rating": imdbRating,
    "imdb_votes": imdbVotes,
    "seo_title": seoTitle,
    "seo_description": seoDescription,
    "seo_keyword": seoKeyword,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
    "main_app": mainApp,
  };
}


class RecentlyAdded {
  int? currentPage;
  List<Map<String, String?>>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  RecentlyAdded({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory RecentlyAdded.fromJson(Map<String, dynamic> json) => RecentlyAdded(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Map<String, String?>>.from(json["data"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Slider {
  String? sliderTitle;
  String? sliderType;
  String? sliderPostId;
  String? sliderImage;

  Slider({
    this.sliderTitle,
    this.sliderType,
    this.sliderPostId,
    this.sliderImage,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    sliderTitle: json["slider_title"],
    sliderType: json["slider_type"]!,
    sliderPostId: json["slider_post_id"],
    sliderImage: json["slider_image"],
  );

  Map<String, dynamic> toJson() => {
    "slider_title": sliderTitle,
    "slider_type": sliderType,
    "slider_post_id": sliderPostId,
    "slider_image": sliderImage,
  };
}


