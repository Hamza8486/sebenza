class BasicModel {
  bool? status;
  String? message;
  Data? data;

  BasicModel({this.status, this.message, this.data});

  BasicModel.fromJson(Map<String, dynamic> json) {
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
  Basicinfo? basicinfo;

  Data({this.basicinfo});

  Data.fromJson(Map<String, dynamic> json) {
    basicinfo = json['basicinfo'] != null
        ? new Basicinfo.fromJson(json['basicinfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.basicinfo != null) {
      data['basicinfo'] = this.basicinfo!.toJson();
    }
    return data;
  }
}

class Basicinfo {
  int? id;
  String? contact;
  String? email;
  String? logo;
  String? address;
  String? title;
  String? siteName;
  String? metaDescription;
  String? metaKeyword;
  String? facebookPixel;
  String? googleAnalytics;
  String? facebook;
  String? instagram;
  String? tiktok;
  String? pinterest;
  String? twitter;
  String? google;
  String? rss;
  String? linkedin;
  String? youtube;
  String? createdAt;
  String? updatedAt;

  Basicinfo(
      {this.id,
        this.contact,
        this.email,
        this.logo,
        this.address,
        this.title,
        this.siteName,
        this.metaDescription,
        this.metaKeyword,
        this.facebookPixel,
        this.googleAnalytics,
        this.facebook,
        this.instagram,
        this.tiktok,
        this.pinterest,
        this.twitter,
        this.google,
        this.rss,
        this.linkedin,
        this.youtube,
        this.createdAt,
        this.updatedAt});

  Basicinfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contact = json['contact'];
    email = json['email'];
    logo = json['logo'];
    address = json['address'];
    title = json['title'];
    siteName = json['site_name'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
    facebookPixel = json['facebook_pixel'];
    googleAnalytics = json['google_analytics'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    tiktok = json['tiktok'];
    pinterest = json['pinterest'];
    twitter = json['twitter'];
    google = json['google'];
    rss = json['rss'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['address'] = this.address;
    data['title'] = this.title;
    data['site_name'] = this.siteName;
    data['meta_description'] = this.metaDescription;
    data['meta_keyword'] = this.metaKeyword;
    data['facebook_pixel'] = this.facebookPixel;
    data['google_analytics'] = this.googleAnalytics;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['tiktok'] = this.tiktok;
    data['pinterest'] = this.pinterest;
    data['twitter'] = this.twitter;
    data['google'] = this.google;
    data['rss'] = this.rss;
    data['linkedin'] = this.linkedin;
    data['youtube'] = this.youtube;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
