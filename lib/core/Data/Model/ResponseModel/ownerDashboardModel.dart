// To parse this JSON data, do
//
//     final ownerDashboardModel = ownerDashboardModelFromJson(jsonString);

import 'dart:convert';

OwnerDashboardModel ownerDashboardModelFromJson(String str) =>
    OwnerDashboardModel.fromJson(json.decode(str));

String ownerDashboardModelToJson(OwnerDashboardModel data) =>
    json.encode(data.toJson());

class OwnerDashboardModel {
  bool? status;
  Data? data;

  OwnerDashboardModel({this.status, this.data});

  factory OwnerDashboardModel.fromJson(Map<String, dynamic> json) =>
      OwnerDashboardModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"status": status, "data": data?.toJson()};
}

class Data {
  Property? property;
  Widgets? widgets;

  Data({this.property, this.widgets});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    property: json["property"] == null
        ? null
        : Property.fromJson(json["property"]),
    widgets: json["widgets"] == null ? null : Widgets.fromJson(json["widgets"]),
  );

  Map<String, dynamic> toJson() => {
    "property": property?.toJson(),
    "widgets": widgets?.toJson(),
  };
}

class Property {
  int? id;
  String? nameNumber;
  String? type;
  String? location;
  String? area;
  String? status;
  CarePackage? carePackage;
  String? overallScore;
  String? imageUrl;
  Complex? complex;
  Caretaker? caretaker;

  Property({
    this.id,
    this.nameNumber,
    this.type,
    this.location,
    this.area,
    this.status,
    this.carePackage,
    this.overallScore,
    this.imageUrl,
    this.complex,
    this.caretaker,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    nameNumber: json["name_number"],
    type: json["type"],
    imageUrl: json["image_url"],
    location: json["location"],
    area: json["area"],
    status: json["status"],
    carePackage: json["care_package"] == null
        ? null
        : CarePackage.fromJson(json["care_package"]),
    overallScore: json["overall_score"],
    complex: json["complex"] == null ? null : Complex.fromJson(json["complex"]),
    caretaker: json["caretaker"] == null
        ? null
        : Caretaker.fromJson(json["caretaker"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_number": nameNumber,
    "type": type,
    "image_url": imageUrl,
    "location": location,
    "area": area,
    "status": status,
    "care_package": carePackage?.toJson(),
    "overall_score": overallScore,
    "complex": complex?.toJson(),
    "caretaker": caretaker?.toJson(),
  };
}

class CarePackage {
  String? key;
  String? label;

  CarePackage({this.key, this.label});

  factory CarePackage.fromJson(Map<String, dynamic> json) =>
      CarePackage(key: json["key"], label: json["label"]);

  Map<String, dynamic> toJson() => {"key": key, "label": label};
}

class Caretaker {
  int? id;
  String? name;
  String? phone;

  Caretaker({this.id, this.name, this.phone});

  factory Caretaker.fromJson(Map<String, dynamic> json) =>
      Caretaker(id: json["id"], name: json["name"], phone: json["phone"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "phone": phone};
}

class Complex {
  int? id;
  String? name;

  Complex({this.id, this.name});

  factory Complex.fromJson(Map<String, dynamic> json) =>
      Complex(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Widgets {
  int? pendingIssues;
  int? openMaintenance;
  int? documentsCount;
  LatestInspection? latestInspection;
  LatestAudit? latestAudit;
  ServiceRequests? serviceRequests;
  MaintenancePayment? maintenancePayment;

  Widgets({
    this.pendingIssues,
    this.openMaintenance,
    this.documentsCount,
    this.latestInspection,
    this.latestAudit,
    this.serviceRequests,
    this.maintenancePayment,
  });

  factory Widgets.fromJson(Map<String, dynamic> json) => Widgets(
    pendingIssues: json["pending_issues"],
    openMaintenance: json["open_maintenance"],
    documentsCount: json["documents_count"],
    latestInspection: json["latest_inspection"] == null
        ? null
        : LatestInspection.fromJson(json["latest_inspection"]),
    latestAudit: json["latest_audit"] == null
        ? null
        : LatestAudit.fromJson(json["latest_audit"]),
    serviceRequests: json["service_requests"] == null
        ? null
        : ServiceRequests.fromJson(json["service_requests"]),
    maintenancePayment: json["maintenance_payment"] == null
        ? null
        : MaintenancePayment.fromJson(json["maintenance_payment"]),
  );

  Map<String, dynamic> toJson() => {
    "pending_issues": pendingIssues,
    "open_maintenance": openMaintenance,
    "documents_count": documentsCount,
    "latest_inspection": latestInspection?.toJson(),
    "latest_audit": latestAudit?.toJson(),
    "service_requests": serviceRequests?.toJson(),
    "maintenance_payment": maintenancePayment?.toJson(),
  };
}

class LatestAudit {
  int? id;
  String? title;
  DateTime? createdAt;

  LatestAudit({this.id, this.title, this.createdAt});

  factory LatestAudit.fromJson(Map<String, dynamic> json) => LatestAudit(
    id: json["id"],
    title: json["title"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "created_at": createdAt == null
        ? null
        : "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
  };
}

class LatestInspection {
  int? id;
  DateTime? date;
  String? score;
  String? status;

  LatestInspection({this.id, this.date, this.score, this.status});

  factory LatestInspection.fromJson(Map<String, dynamic> json) =>
      LatestInspection(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        score: json["score"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date == null
        ? null
        : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "score": score,
    "status": status,
  };
}

class ServiceRequests {
  int? active;
  int? inProgress;

  ServiceRequests({this.active, this.inProgress});

  factory ServiceRequests.fromJson(Map<String, dynamic> json) =>
      ServiceRequests(active: json["active"], inProgress: json["in_progress"]);

  Map<String, dynamic> toJson() => {
    "active": active,
    "in_progress": inProgress,
  };
}

class MaintenancePayment {
  String? status;
  int? outstanding;
  int? upcoming;
  int? overdue;
  int? remaining;

  MaintenancePayment({
    this.status,
    this.outstanding,
    this.upcoming,
    this.overdue,
    this.remaining,
  });

  factory MaintenancePayment.fromJson(Map<String, dynamic> json) =>
      MaintenancePayment(
        status: json["status"],
        outstanding: json["outstanding"],
        upcoming: json["upcoming"],
        overdue: json["overdue"],
        remaining: json["remaining"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "outstanding": outstanding,
    "upcoming": upcoming,
    "overdue": overdue,
    "remaining": remaining,
  };
}
