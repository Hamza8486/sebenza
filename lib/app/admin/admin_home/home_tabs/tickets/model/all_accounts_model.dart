class AllAccountListModel {
  bool? status;
  String? message;
  Data? data;

  AllAccountListModel({this.status, this.message, this.data});

  AllAccountListModel.fromJson(Map<String, dynamic> json) {
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
  List<Accounttypes>? accounttypes;

  Data({this.accounttypes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['accounttypes'] != null) {
      accounttypes = <Accounttypes>[];
      json['accounttypes'].forEach((v) {
        accounttypes!.add(new Accounttypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accounttypes != null) {
      data['accounttypes'] = this.accounttypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Accounttypes {
  int? id;
  String? accountType;
  String? status;
  String? createdAt;
  String? updatedAt;

  Accounttypes(
      {this.id, this.accountType, this.status, this.createdAt, this.updatedAt});

  Accounttypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountType = json['account_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_type'] = this.accountType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
