class AnnoucementModel {
  bool? status;
  String? message;
  Data? data;

  AnnoucementModel({this.status, this.message, this.data});

  AnnoucementModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<News>? news;

  Data({this.news});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  int? id;
  String? title;
  String? slug;
  String? description;
  var seen;
  int? totalView;
  String? postImage;
  String? status;
  String? createdAt;
  String? updatedAt;

  News(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.seen,
        this.totalView,
        this.postImage,
        this.status,
        this.createdAt,
        this.updatedAt});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    seen = json['seen'];
    totalView = json['total_view'];
    postImage = json['postImage'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['seen'] = this.seen;
    data['total_view'] = this.totalView;
    data['postImage'] = this.postImage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
