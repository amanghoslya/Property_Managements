// To parse this JSON data, do
//
//     final getServiceRequestDetailsModel = getServiceRequestDetailsModelFromJson(jsonString);

import 'dart:convert';

GetServiceRequestDetailsModel getServiceRequestDetailsModelFromJson(String str) => GetServiceRequestDetailsModel.fromJson(json.decode(str));

String getServiceRequestDetailsModelToJson(GetServiceRequestDetailsModel data) => json.encode(data.toJson());

class GetServiceRequestDetailsModel {
    bool? status;
    Data? data;

    GetServiceRequestDetailsModel({
        this.status,
        this.data,
    });

    factory GetServiceRequestDetailsModel.fromJson(Map<String, dynamic> json) => GetServiceRequestDetailsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    Header? header;
    RequestInformation? requestInformation;
    String? requestDetails;
    List<StatusTimeline>? statusTimeline;
    AssignedTo? assignedTo;
    List<Attachment>? attachments;

    Data({
        this.header,
        this.requestInformation,
        this.requestDetails,
        this.statusTimeline,
        this.assignedTo,
        this.attachments,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        header: json["header"] == null ? null : Header.fromJson(json["header"]),
        requestInformation: json["request_information"] == null ? null : RequestInformation.fromJson(json["request_information"]),
        requestDetails: json["request_details"],
        statusTimeline: json["status_timeline"] == null ? [] : List<StatusTimeline>.from(json["status_timeline"]!.map((x) => StatusTimeline.fromJson(x))),
        assignedTo: json["assigned_to"] == null ? null : AssignedTo.fromJson(json["assigned_to"]),
        attachments: json["attachments"] == null ? [] : List<Attachment>.from(json["attachments"]!.map((x) => Attachment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "header": header?.toJson(),
        "request_information": requestInformation?.toJson(),
        "request_details": requestDetails,
        "status_timeline": statusTimeline == null ? [] : List<dynamic>.from(statusTimeline!.map((x) => x.toJson())),
        "assigned_to": assignedTo?.toJson(),
        "attachments": attachments == null ? [] : List<dynamic>.from(attachments!.map((x) => x.toJson())),
    };
}

class Attachment {
    String? fileName;
    String? type;
    String? size;
    String? url;

    Attachment({
        this.fileName,
        this.type,
        this.size,
        this.url,
    });

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        fileName: json["file_name"],
        type: json["type"],
        size: json["size"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "file_name": fileName,
        "type": type,
        "size": size,
        "url": url,
    };
}

class Header {
    String? ticketNumber;
    String? title;
    String? subtitle;
    String? statusPill;

    Header({
        this.ticketNumber,
        this.title,
        this.subtitle,
        this.statusPill,
    });

    factory Header.fromJson(Map<String, dynamic> json) => Header(
        ticketNumber: json["ticket_number"],
        title: json["title"],
        subtitle: json["subtitle"],
        statusPill: json["status_pill"],
    );

    Map<String, dynamic> toJson() => {
        "ticket_number": ticketNumber,
        "title": title,
        "subtitle": subtitle,
        "status_pill": statusPill,
    };
}

class RequestInformation {
    String? serviceCategory;
    String? serviceType;
    String? priority;
    String? preferredDate;
    String? property;

    RequestInformation({
        this.serviceCategory,
        this.serviceType,
        this.priority,
        this.preferredDate,
        this.property,
    });

    factory RequestInformation.fromJson(Map<String, dynamic> json) => RequestInformation(
        serviceCategory: json["service_category"],
        serviceType: json["service_type"],
        priority: json["priority"],
        preferredDate: json["preferred_date"],
        property: json["property"],
    );

    Map<String, dynamic> toJson() => {
        "service_category": serviceCategory,
        "service_type": serviceType,
        "priority": priority,
        "preferred_date": preferredDate,
        "property": property,
    };
}

class StatusTimeline {
    String? statusKey;
    String? label;
    String? dateTime;
    bool? isCompleted;
    bool? isCurrent;

    StatusTimeline({
        this.statusKey,
        this.label,
        this.dateTime,
        this.isCompleted,
        this.isCurrent,
    });

    factory StatusTimeline.fromJson(Map<String, dynamic> json) => StatusTimeline(
        statusKey: json["status_key"],
        label: json["label"],
        dateTime: json["date_time"],
        isCompleted: json["is_completed"],
        isCurrent: json["is_current"],
    );

    Map<String, dynamic> toJson() => {
        "status_key": statusKey,
        "label": label,
        "date_time": dateTime,
        "is_completed": isCompleted,
        "is_current": isCurrent,
    };
}

class AssignedTo {
    String? name;
    String? role;
    String? avatarUrl;
    String? phone;

    AssignedTo({
        this.name,
        this.role,
        this.avatarUrl,
        this.phone,
    });

    factory AssignedTo.fromJson(Map<String, dynamic> json) => AssignedTo(
        name: json["name"],
        role: json["role"],
        avatarUrl: json["avatar_url"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "avatar_url": avatarUrl,
        "phone": phone,
    };
}
