// To parse this JSON data, do
//
//     final propertyDetailsModel = propertyDetailsModelFromJson(jsonString);

import 'dart:convert';

PropertyDetailsModel propertyDetailsModelFromJson(String str) =>
    PropertyDetailsModel.fromJson(json.decode(str));

String propertyDetailsModelToJson(PropertyDetailsModel data) =>
    json.encode(data.toJson());

class PropertyDetailsModel {
  bool? status;
  Data? data;

  PropertyDetailsModel({this.status, this.data});

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) =>
      PropertyDetailsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"status": status, "data": data?.toJson()};
}

class Data {
  int? id;
  String? propertyNameNumber;
  String? propertyType;
  String? location;
  String? area;
  String? status;
  String? imageUrl;
  String? carePackage;
  String? carePackageLabel;
  String? overallScore;
  dynamic caretaker;
  Complex? complex;
  Widgets? widgets;

  Data({
    this.id,
    this.propertyNameNumber,
    this.propertyType,
    this.location,
    this.area,
    this.status,
    this.imageUrl,
    this.carePackage,
    this.carePackageLabel,
    this.overallScore,
    this.caretaker,
    this.complex,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    propertyNameNumber: json["property_name_number"],
    propertyType: json["property_type"],
    location: json["location"],
    area: json["area"],
    status: json["status"],
    imageUrl: json["image_url"],
    carePackage: json["care_package"],
    carePackageLabel: json["care_package_label"],
    overallScore: json["overall_score"],
    caretaker: json["caretaker"],
    complex: json["complex"] == null ? null : Complex.fromJson(json["complex"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "property_name_number": propertyNameNumber,
    "property_type": propertyType,
    "location": location,
    "area": area,
    "status": status,
    "image_url": imageUrl,
    "care_package": carePackage,
    "care_package_label": carePackageLabel,
    "overall_score": overallScore,
    "caretaker": caretaker,
    "complex": complex?.toJson(),
  };
}

class Complex {
  int? id;
  String? name;
  String? address;
  List<String>? facilities;

  Complex({this.id, this.name, this.address, this.facilities});

  factory Complex.fromJson(Map<String, dynamic> json) => Complex(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    facilities: json["facilities"] == null
        ? []
        : List<String>.from(json["facilities"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "facilities": facilities == null
        ? []
        : List<dynamic>.from(facilities!.map((x) => x)),
  };
}

class Widgets {
    int? pendingIssues;
    int? openMaintenance;
    int? documentsCount;
    LatestInspection? latestInspection;
    LatestAudit? latestAudit;

    Widgets({
        this.pendingIssues,
        this.openMaintenance,
        this.documentsCount,
        this.latestInspection,
        this.latestAudit,
    });

    factory Widgets.fromJson(Map<String, dynamic> json) => Widgets(
        pendingIssues: json["pending_issues"],
        openMaintenance: json["open_maintenance"],
        documentsCount: json["documents_count"],
        latestInspection: json["latest_inspection"] == null ? null : LatestInspection.fromJson(json["latest_inspection"]),
        latestAudit: json["latest_audit"] == null ? null : LatestAudit.fromJson(json["latest_audit"]),
    );

    Map<String, dynamic> toJson() => {
        "pending_issues": pendingIssues,
        "open_maintenance": openMaintenance,
        "documents_count": documentsCount,
        "latest_inspection": latestInspection?.toJson(),
        "latest_audit": latestAudit?.toJson(),
    };
}

class LatestAudit {
    int? id;
    String? title;
    DateTime? createdAt;

    LatestAudit({
        this.id,
        this.title,
        this.createdAt,
    });

    factory LatestAudit.fromJson(Map<String, dynamic> json) => LatestAudit(
        id: json["id"],
        title: json["title"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt == null ? null : "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
    };
}

class LatestInspection {
    int? id;
    DateTime? date;
    String? score;
    String? status;

    LatestInspection({
        this.id,
        this.date,
        this.score,
        this.status,
    });

    factory LatestInspection.fromJson(Map<String, dynamic> json) => LatestInspection(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        score: json["score"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date == null ? null : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "score": score,
        "status": status,
    };
}
