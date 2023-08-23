class InvoiceDetailModel {
  bool? status;
  String? message;
  Data? data;

  InvoiceDetailModel({this.status, this.message, this.data});

  InvoiceDetailModel.fromJson(Map<String, dynamic> json) {
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
  InvoicesDetailModelAll? invoices;

  Data({this.invoices});

  Data.fromJson(Map<String, dynamic> json) {
    invoices = json['invoices'] != null
        ? new InvoicesDetailModelAll.fromJson(json['invoices'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoices != null) {
      data['invoices'] = this.invoices!.toJson();
    }
    return data;
  }
}

class InvoicesDetailModelAll {
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

  InvoicesDetailModelAll(
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

  InvoicesDetailModelAll.fromJson(Map<String, dynamic> json) {
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
        this.updatedAt});

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
    return data;
  }
}
