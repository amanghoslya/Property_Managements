// To parse this JSON data, do
//
//     final getMaintenanceHistoryModel = getMaintenanceHistoryModelFromJson(jsonString);

import 'dart:convert';

GetMaintenanceHistoryModel getMaintenanceHistoryModelFromJson(String str) => GetMaintenanceHistoryModel.fromJson(json.decode(str));

String getMaintenanceHistoryModelToJson(GetMaintenanceHistoryModel data) => json.encode(data.toJson());

class GetMaintenanceHistoryModel {
    bool? status;
    Data? data;

    GetMaintenanceHistoryModel({
        this.status,
        this.data,
    });

    factory GetMaintenanceHistoryModel.fromJson(Map<String, dynamic> json) => GetMaintenanceHistoryModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Property? property;
    List<String>? filterOptions;
    String? activeFilter;
    List<dynamic>? records;

    Data({
        this.property,
        this.filterOptions,
        this.activeFilter,
        this.records,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        property: json["property"] == null ? null : Property.fromJson(json["property"]),
        filterOptions: json["filter_options"] == null ? [] : List<String>.from(json["filter_options"]!.map((x) => x)),
        activeFilter: json["active_filter"],
        records: json["records"] == null ? [] : List<dynamic>.from(json["records"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "property": property?.toJson(),
        "filter_options": filterOptions == null ? [] : List<dynamic>.from(filterOptions!.map((x) => x)),
        "active_filter": activeFilter,
        "records": records == null ? [] : List<dynamic>.from(records!.map((x) => x)),
    };
}

class Property {
    int? id;
    String? name;
    String? complexName;
    String? status;
    int? totalRecords;
    int? completedRecords;

    Property({
        this.id,
        this.name,
        this.complexName,
        this.status,
        this.totalRecords,
        this.completedRecords,
    });

    factory Property.fromJson(Map<String, dynamic> json) => Property(
        id: json["id"],
        name: json["name"],
        complexName: json["complex_name"],
        status: json["status"],
        totalRecords: json["total_records"],
        completedRecords: json["completed_records"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "complex_name": complexName,
        "status": status,
        "total_records": totalRecords,
        "completed_records": completedRecords,
    };
}
