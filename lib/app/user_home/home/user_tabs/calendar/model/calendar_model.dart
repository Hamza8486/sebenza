class GetCalendarModel {
  bool? status;
  String? message;
  Data? data;

  GetCalendarModel({this.status, this.message, this.data});

  GetCalendarModel.fromJson(Map<String, dynamic> json) {
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
  List<Calenders>? calenders;

  Data({this.calenders});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['calenders'] != null) {
      calenders = <Calenders>[];
      json['calenders'].forEach((v) {
        calenders!.add(new Calenders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calenders != null) {
      data['calenders'] = this.calenders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Calenders {
  int? id;
  String? title;
  int? formId;
  String? details;
  String? bgColor;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? status;
  String? createdAt;
  String? updatedAt;

  Calenders(
      {this.id,
        this.title,
        this.formId,
        this.details,
        this.bgColor,
        this.startDate,
        this.startTime,
        this.endDate,
        this.endTime,
        this.status,
        this.createdAt,
        this.updatedAt});

  Calenders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    formId = json['form_id'];
    details = json['details'];
    bgColor = json['bgColor'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['form_id'] = this.formId;
    data['details'] = this.details;
    data['bgColor'] = this.bgColor;
    data['startDate'] = this.startDate;
    data['startTime'] = this.startTime;
    data['endDate'] = this.endDate;
    data['endTime'] = this.endTime;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
