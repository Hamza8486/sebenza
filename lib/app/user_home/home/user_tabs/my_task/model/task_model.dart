class TaskModel {
  bool? status;
  String? message;
  Data? data;

  TaskModel({this.status, this.message, this.data});

  TaskModel.fromJson(Map<String, dynamic> json) {
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
  List<Tasks>? tasks;

  Data({this.tasks});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasks {
  int? id;
  int? formId;
  String? name;
  String? details;
  String? date;
  String? time;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Tasknotes>? tasknotes;

  Tasks(
      {this.id,
        this.formId,
        this.name,
        this.details,
        this.date,
        this.time,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.tasknotes});

  Tasks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formId = json['form_id'];
    name = json['name'];
    details = json['details'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tasknotes'] != null) {
      tasknotes = <Tasknotes>[];
      json['tasknotes'].forEach((v) {
        tasknotes!.add(new Tasknotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['form_id'] = this.formId;
    data['name'] = this.name;
    data['details'] = this.details;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.tasknotes != null) {
      data['tasknotes'] = this.tasknotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tasknotes {
  int? id;
  int? taskId;
  String? description;
  String? createdAt;
  String? updatedAt;

  Tasknotes(
      {this.id, this.taskId, this.description, this.createdAt, this.updatedAt});

  Tasknotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['task_id'] = this.taskId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
