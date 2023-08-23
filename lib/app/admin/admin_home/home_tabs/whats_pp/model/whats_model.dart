class WhatsappModel {
  bool? status;
  String? message;
  Data? data;

  WhatsappModel({this.status, this.message, this.data});

  WhatsappModel.fromJson(Map<String, dynamic> json) {
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
  List<Whatsapp>? whatsapp;

  Data({this.whatsapp});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['whatsapp'] != null) {
      whatsapp = <Whatsapp>[];
      json['whatsapp'].forEach((v) {
        whatsapp!.add(new Whatsapp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.whatsapp != null) {
      data['whatsapp'] = this.whatsapp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Whatsapp {
  int? id;
  String? userName;
  String? whatsappNumber;
  String? status;
  String? createdAt;
  String? updatedAt;

  Whatsapp(
      {this.id,
        this.userName,
        this.whatsappNumber,
        this.status,
        this.createdAt,
        this.updatedAt});

  Whatsapp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    whatsappNumber = json['whatsapp_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['whatsapp_number'] = this.whatsappNumber;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
