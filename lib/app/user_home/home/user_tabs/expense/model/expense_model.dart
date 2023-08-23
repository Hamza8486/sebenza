class ExpenceModel {
  bool? status;
  String? message;
  Data? data;

  ExpenceModel({this.status, this.message, this.data});

  ExpenceModel.fromJson(Map<String, dynamic> json) {
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
  List<Expenses>? expenses;

  Data({this.expenses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['expenses'] != null) {
      expenses = <Expenses>[];
      json['expenses'].forEach((v) {
        expenses!.add(new Expenses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expenses != null) {
      data['expenses'] = this.expenses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expenses {
  int? id;
  String? membershipId;
  int? expensetypeId;
  String? amount;
  String? notes;
  String? image;
  String? createdAt;
  String? updatedAt;
  Expensetypes? expensetypes;

  Expenses(
      {this.id,
        this.membershipId,
        this.expensetypeId,
        this.amount,
        this.notes,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.expensetypes});

  Expenses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    membershipId = json['membership_id'];
    expensetypeId = json['expensetype_id'];
    amount = json['amount'];
    notes = json['notes'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expensetypes = json['expensetypes'] != null
        ? new Expensetypes.fromJson(json['expensetypes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['membership_id'] = this.membershipId;
    data['expensetype_id'] = this.expensetypeId;
    data['amount'] = this.amount;
    data['notes'] = this.notes;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.expensetypes != null) {
      data['expensetypes'] = this.expensetypes!.toJson();
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
