// To parse this JSON data, do
//
//     final allJobsModel = allJobsModelFromJson(jsonString);

import 'dart:convert';

AllJobsModel allJobsModelFromJson(String str) => AllJobsModel.fromJson(json.decode(str));

String allJobsModelToJson(AllJobsModel data) => json.encode(data.toJson());

class AllJobsModel {
    String? success;
    Data? data;

    AllJobsModel({
        this.success,
        this.data,
    });

    factory AllJobsModel.fromJson(Map<String, dynamic> json) => AllJobsModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    String? nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Data({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int? id;
    String? title;
    String? description;
    int? locationId;
    int? designationId;
    int? departmentId;
    int? hiringLeadId;
    int? employmentStatusId;
    String? status;
    DateTime? targetDate;
    String? minimumExperience;
    int? fillPersonalityAssessment;
    int? captchaVerification;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? linkExpiryTime;
    int? divisionId;
    int? candidateCount;
    int? statusCount;
    Department? department;
    Designation? designation;
    Locations? locations;

    Datum({
        this.id,
        this.title,
        this.description,
        this.locationId,
        this.designationId,
        this.departmentId,
        this.hiringLeadId,
        this.employmentStatusId,
        this.status,
        this.targetDate,
        this.minimumExperience,
        this.fillPersonalityAssessment,
        this.captchaVerification,
        this.createdAt,
        this.updatedAt,
        this.linkExpiryTime,
        this.divisionId,
        this.candidateCount,
        this.statusCount,
        this.department,
        this.designation,
        this.locations,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        locationId: json["location_id"],
        designationId: json["designation_id"],
        departmentId: json["department_id"],
        hiringLeadId: json["hiring_lead_id"],
        employmentStatusId: json["employment_status_id"],
        status: json["status"],
        targetDate: json["target_date"] == null ? null : DateTime.parse(json["target_date"]),
        minimumExperience: json["minimum_experience"],
        fillPersonalityAssessment: json["fill_personality_assessment"],
        captchaVerification: json["captcha_verification"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        linkExpiryTime: json["link_expiry_time"],
        divisionId: json["division_id"],
        candidateCount: json["candidate_count"],
        statusCount: json["status_count"],
        department: json["department"] == null ? null : Department.fromJson(json["department"]),
        designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
        locations: json["locations"] == null ? null : Locations.fromJson(json["locations"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "location_id": locationId,
        "designation_id": designationId,
        "department_id": departmentId,
        "hiring_lead_id": hiringLeadId,
        "employment_status_id": employmentStatusId,
        "status": status,
        "target_date": "${targetDate!.year.toString().padLeft(4, '0')}-${targetDate!.month.toString().padLeft(2, '0')}-${targetDate!.day.toString().padLeft(2, '0')}",
        "minimum_experience": minimumExperience,
        "fill_personality_assessment": fillPersonalityAssessment,
        "captcha_verification": captchaVerification,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "link_expiry_time": linkExpiryTime,
        "division_id": divisionId,
        "candidate_count": candidateCount,
        "status_count": statusCount,
        "department": department?.toJson(),
        "designation": designation?.toJson(),
        "locations": locations?.toJson(),
    };
}

class Department {
    int? id;
    String? departmentName;
    String? status;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    Department({
        this.id,
        this.departmentName,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        departmentName: json["department_name"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "department_name": departmentName,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Designation {
    int? id;
    String? designationName;
    int? status;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? availability;

    Designation({
        this.id,
        this.designationName,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.availability,
    });

    factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        id: json["id"],
        designationName: json["designation_name"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        availability: json["availability"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "designation_name": designationName,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "availability": availability,
    };
}

class Locations {
    int? id;
    String? name;
    String? street1;
    String? street2;
    String? city;
    String? state;
    int? zipCode;
    String? country;
    String? latitude;
    String? longitude;
    String? phoneNumber;
    String? timezone;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    dynamic geoRadius;

    Locations({
        this.id,
        this.name,
        this.street1,
        this.street2,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.latitude,
        this.longitude,
        this.phoneNumber,
        this.timezone,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.geoRadius,
    });

    factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json["id"],
        name: json["name"],
        street1: json["street_1"],
        street2: json["street_2"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        country: json["country"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        phoneNumber: json["phone_number"],
        timezone: json["timezone"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        geoRadius: json["geo_radius"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "street_1": street1,
        "street_2": street2,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "phone_number": phoneNumber,
        "timezone": timezone,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "geo_radius": geoRadius,
    };
}

class Link {
    String? url;
    String? label;
    bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
