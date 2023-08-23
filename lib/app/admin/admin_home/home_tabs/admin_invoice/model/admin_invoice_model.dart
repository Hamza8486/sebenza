class InvoiceAdminModel {
  bool? status;
  String? message;
  Data? data;

  InvoiceAdminModel({this.status, this.message, this.data});

  InvoiceAdminModel.fromJson(Map<String, dynamic> json) {
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
  List<AdminInvoices>? invoices;

  Data({this.invoices});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['invoices'] != null) {
      invoices = <AdminInvoices>[];
      json['invoices'].forEach((v) {
        invoices!.add(new AdminInvoices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoices != null) {
      data['invoices'] = this.invoices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdminInvoices {
  int? id;
  String? invoiceID;
  int? orderId;
  int? accountTotalUser;
  String? costPerUser;
  String? amountTotal;
  String? discount;
  String? payableAmount;
  String? paidAmount;
  var paymentId;
  var paymentType;
  String? invoiceDate;
  var paymentDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  Orders? orders;

  AdminInvoices(
      {this.id,
        this.invoiceID,
        this.orderId,
        this.accountTotalUser,
        this.costPerUser,
        this.amountTotal,
        this.discount,
        this.payableAmount,
        this.paidAmount,
        this.paymentId,
        this.paymentType,
        this.invoiceDate,
        this.paymentDate,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.orders});

  AdminInvoices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceID = json['invoiceID'];
    orderId = json['order_id'];
    accountTotalUser = json['account_total_user'];
    costPerUser = json['cost_per_user'];
    amountTotal = json['amount_total'];
    discount = json['discount'];
    payableAmount = json['payable_amount'];
    paidAmount = json['paid_amount'];
    paymentId = json['payment_id'];
    paymentType = json['payment_type'];
    invoiceDate = json['invoiceDate'];
    paymentDate = json['paymentDate'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['invoiceID'] = this.invoiceID;
    data['order_id'] = this.orderId;
    data['account_total_user'] = this.accountTotalUser;
    data['cost_per_user'] = this.costPerUser;
    data['amount_total'] = this.amountTotal;
    data['discount'] = this.discount;
    data['payable_amount'] = this.payableAmount;
    data['paid_amount'] = this.paidAmount;
    data['payment_id'] = this.paymentId;
    data['payment_type'] = this.paymentType;
    data['invoiceDate'] = this.invoiceDate;
    data['paymentDate'] = this.paymentDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? userId;
  String? membershipId;
  int? accountTypeId;
  String? accountType;
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

  Orders(
      {this.id,
        this.userId,
        this.membershipId,
        this.accountTypeId,
        this.accountType,
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

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    membershipId = json['membership_id'];
    accountTypeId = json['account_type_id'];
    accountType = json['account_type'];
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
    data['account_type_id'] = this.accountTypeId;
    data['account_type'] = this.accountType;
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
  String? accountType;
  int? accountTypeId;
  String? country;
  String? city;
  String? address;
  var postcode;
  var state;
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
        this.postcode,
        this.state,
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
    postcode = json['postcode'];
    state = json['state'];
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
    data['postcode'] = this.postcode;
    data['state'] = this.state;
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
