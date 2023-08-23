class PromoModel {
  bool? status;
  String? message;
  Data? data;

  PromoModel({this.status, this.message, this.data});

  PromoModel.fromJson(Map<String, dynamic> json) {
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
  List<Promocodes>? promocodes;

  Data({this.promocodes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['promocodes'] != null) {
      promocodes = <Promocodes>[];
      json['promocodes'].forEach((v) {
        promocodes!.add(new Promocodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promocodes != null) {
      data['promocodes'] = this.promocodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promocodes {
  int? id;
  String? title;
  String? promocode;
  String? expiredDate;
  String? discountPercent;
  String? status;
  String? createdAt;
  String? updatedAt;

  Promocodes(
      {this.id,
        this.title,
        this.promocode,
        this.expiredDate,
        this.discountPercent,
        this.status,
        this.createdAt,
        this.updatedAt});

  Promocodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    promocode = json['promocode'];
    expiredDate = json['expired_date'];
    discountPercent = json['discount_percent'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['promocode'] = this.promocode;
    data['expired_date'] = this.expiredDate;
    data['discount_percent'] = this.discountPercent;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
