class TicketUserModel {
  bool? status;
  String? message;
  Data? data;

  TicketUserModel({this.status, this.message, this.data});

  TicketUserModel.fromJson(Map<String, dynamic> json) {
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
  List<Supporttickets>? supporttickets;

  Data({this.supporttickets});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['supporttickets'] != null) {
      supporttickets = <Supporttickets>[];
      json['supporttickets'].forEach((v) {
        supporttickets!.add(new Supporttickets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.supporttickets != null) {
      data['supporttickets'] =
          this.supporttickets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Supporttickets {
  int? id;
  int? fromId;
  String? name;
  String? email;
  String? subject;
  String? department;
  String? priority;
  String? message;
  String? attachment;
  String? status;
  var solvedBy;
  String? createdAt;
  String? updatedAt;
  Users? users;

  Supporttickets(
      {this.id,
        this.fromId,
        this.name,
        this.email,
        this.subject,
        this.department,
        this.priority,
        this.message,
        this.attachment,
        this.status,
        this.solvedBy,
        this.createdAt,
        this.updatedAt,
        this.users});

  Supporttickets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromId = json['from_id'];
    name = json['name'];
    email = json['email'];
    subject = json['subject'];
    department = json['department'];
    priority = json['priority'];
    message = json['message'];
    attachment = json['attachment'];
    status = json['status'];
    solvedBy = json['solved_By'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_id'] = this.fromId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['subject'] = this.subject;
    data['department'] = this.department;
    data['priority'] = this.priority;
    data['message'] = this.message;
    data['attachment'] = this.attachment;
    data['status'] = this.status;
    data['solved_By'] = this.solvedBy;
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
