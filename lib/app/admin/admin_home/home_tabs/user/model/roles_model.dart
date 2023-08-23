class GetUserRoles {
  bool? status;
  String? message;
  Data? data;

  GetUserRoles({this.status, this.message, this.data});

  GetUserRoles.fromJson(Map<String, dynamic> json) {
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
  List<RolesModelAll>? roles;

  Data({this.roles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['roles'] != null) {
      roles = <RolesModelAll>[];
      json['roles'].forEach((v) {
        roles!.add(new RolesModelAll.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RolesModelAll {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;

  RolesModelAll({this.id, this.name, this.guardName, this.createdAt, this.updatedAt});

  RolesModelAll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
