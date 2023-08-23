class ExpenceTypeModel {
  bool? status;
  String? message;
  Data? data;

  ExpenceTypeModel({this.status, this.message, this.data});

  ExpenceTypeModel.fromJson(Map<String, dynamic> json) {
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
  List<Expensetypes>? expensetypes;

  Data({this.expensetypes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['expensetypes'] != null) {
      expensetypes = <Expensetypes>[];
      json['expensetypes'].forEach((v) {
        expensetypes!.add(new Expensetypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expensetypes != null) {
      data['expensetypes'] = this.expensetypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expensetypes {
  int? id;
  String? membershipId;
  String? expenceType;
  String? status;
  String? createdAt;
  String? updatedAt;

  Expensetypes(
      {this.id,
        this.membershipId,
        this.expenceType,
        this.status,
        this.createdAt,
        this.updatedAt});

  Expensetypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipId = json['membership_id'];
    expenceType = json['expence_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['membership_id'] = this.membershipId;
    data['expence_type'] = this.expenceType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
