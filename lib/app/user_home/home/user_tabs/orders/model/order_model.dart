class GetOrders {
  bool? status;
  String? message;
  Data? data;

  GetOrders({this.status, this.message, this.data});

  GetOrders.fromJson(Map<String, dynamic> json) {
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
  Order? order;

  Data({this.order});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  String? membershipId;
  int? accountTotalUser;
  int? newUser;
  String? costPerUser;
  String? amountTotal;
  String? orderDate;
  var expireDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  Users? users;

  Order(
      {this.id,
        this.userId,
        this.membershipId,
        this.accountTotalUser,
        this.newUser,
        this.costPerUser,
        this.amountTotal,
        this.orderDate,
        this.expireDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.users});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    membershipId = json['membership_id'];
    accountTotalUser = json['account_total_user'];
    newUser = json['new_user'];
    costPerUser = json['cost_per_user'];
    amountTotal = json['amount_total'];
    orderDate = json['orderDate'];
    expireDate = json['expireDate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['membership_id'] = this.membershipId;
    data['account_total_user'] = this.accountTotalUser;
    data['new_user'] = this.newUser;
    data['cost_per_user'] = this.costPerUser;
    data['amount_total'] = this.amountTotal;
    data['orderDate'] = this.orderDate;
    data['expireDate'] = this.expireDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  var emailVerifiedAt;
  String? companyName;
  String? membershipCode;
  var memberBy;
  String? profile;
  var accountType;
  var accountTypeId;
  String? country;
  String? city;
  String? address;
  var userLimit;
  int? userLimitId;
  String? createdAt;
  String? updatedAt;
  List<Roles>? roles;

  Users(
      {this.id,
        this.firstName,
        this.lastName,
        this.phone,
        this.email,
        this.emailVerifiedAt,
        this.companyName,
        this.membershipCode,
        this.memberBy,
        this.profile,
        this.accountType,
        this.accountTypeId,
        this.country,
        this.city,
        this.address,
        this.userLimit,
        this.userLimitId,
        this.createdAt,
        this.updatedAt,
        this.roles});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    companyName = json['company_name'];
    membershipCode = json['membership_code'];
    memberBy = json['member_by'];
    profile = json['profile'];
    accountType = json['account_type'];
    accountTypeId = json['account_type_id'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    userLimit = json['user_limit'];
    userLimitId = json['user_limit_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['company_name'] = this.companyName;
    data['membership_code'] = this.membershipCode;
    data['member_by'] = this.memberBy;
    data['profile'] = this.profile;
    data['account_type'] = this.accountType;
    data['account_type_id'] = this.accountTypeId;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['user_limit'] = this.userLimit;
    data['user_limit_id'] = this.userLimitId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
        this.name,
        this.guardName,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    roleId = json['role_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['role_id'] = this.roleId;
    data['model_type'] = this.modelType;
    return data;
  }
}
