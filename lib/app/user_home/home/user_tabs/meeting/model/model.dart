class MeetingsModel {
  bool? status;
  String? message;
  Data? data;

  MeetingsModel({this.status, this.message, this.data});

  MeetingsModel.fromJson(Map<String, dynamic> json) {
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
  List<Metings>? metings;

  Data({this.metings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['metings'] != null) {
      metings = <Metings>[];
      json['metings'].forEach((v) {
        metings!.add(new Metings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metings != null) {
      data['metings'] = this.metings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metings {
  int? id;
  int? formId;
  String? title;
  String? place;
  String? description;
  String? date;
  String? time;
  String? status;
  String? link;
  var recipients;
  String? createdAt;
  String? updatedAt;


  Metings(
      {this.id,
        this.formId,
        this.title,
        this.place,
        this.description,
        this.date,
        this.time,
        this.status,
        this.link,
        this.recipients,
        this.createdAt,
        this.updatedAt,
        });

  Metings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formId = json['form_id'];
    title = json['title'];
    place = json['place'];
    description = json['description'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    link = json['link'];
    recipients = json['recipients'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['form_id'] = this.formId;
    data['title'] = this.title;
    data['place'] = this.place;
    data['description'] = this.description;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['link'] = this.link;
    data['recipients'] = this.recipients;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;

    return data;
  }
}
