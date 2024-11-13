// To parse this JSON data, do
//
//     final getJobCreateDataModel = getJobCreateDataModelFromJson(jsonString);

import 'dart:convert';

GetJobCreateDataModel getJobCreateDataModelFromJson(String str) => GetJobCreateDataModel.fromJson(json.decode(str));

String getJobCreateDataModelToJson(GetJobCreateDataModel data) => json.encode(data.toJson());

class GetJobCreateDataModel {
    String? success;
    Data? data;

    GetJobCreateDataModel({
        this.success,
        this.data,
    });

    factory GetJobCreateDataModel.fromJson(Map<String, dynamic> json) => GetJobCreateDataModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    List<Employee>? employees;
    List<Question>? questions;
    List<Division>? divisions;
    List<Location>? locations;
    List<Department>? departments;
    List<Designation>? designations;
    List<EmploymentStatus>? employmentStatus;

    Data({
        this.employees,
        this.questions,
        this.divisions,
        this.locations,
        this.departments,
        this.designations,
        this.employmentStatus,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        employees: json["employees"] == null ? [] : List<Employee>.from(json["employees"]!.map((x) => Employee.fromJson(x))),
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
        divisions: json["divisions"] == null ? [] : List<Division>.from(json["divisions"]!.map((x) => Division.fromJson(x))),
        locations: json["locations"] == null ? [] : List<Location>.from(json["locations"]!.map((x) => Location.fromJson(x))),
        departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
        designations: json["designations"] == null ? [] : List<Designation>.from(json["designations"]!.map((x) => Designation.fromJson(x))),
        employmentStatus: json["employmentStatus"] == null ? [] : List<EmploymentStatus>.from(json["employmentStatus"]!.map((x) => EmploymentStatus.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toJson())),
        "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
        "divisions": divisions == null ? [] : List<dynamic>.from(divisions!.map((x) => x.toJson())),
        "locations": locations == null ? [] : List<dynamic>.from(locations!.map((x) => x.toJson())),
        "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
        "designations": designations == null ? [] : List<dynamic>.from(designations!.map((x) => x.toJson())),
        "employmentStatus": employmentStatus == null ? [] : List<dynamic>.from(employmentStatus!.map((x) => x.toJson())),
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

class Division {
    int? id;
    String? name;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    Division({
        this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory Division.fromJson(Map<String, dynamic> json) => Division(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class Employee {
    int? id;
    String? employeeNo;
    String? firstname;
    String? lastname;
    String? contactNo;
    String? officialEmail;
    String? personalEmail;
    String? nin;
    DateTime? dateOfBirth;
    String? gender;
    String? maritalStatus;
    String? emergencyContactRelationship;
    String? emergencyContact;
    String? password;
    int? canMarkAttendance;
    String? currentAddress;
    String? currentCity;
    String? currentLatitude;
    String? currentLongitude;
    String? permanentAddress;
    String? permanentCity;
    String? permanentLatitude;
    String? permanentLongitude;
    String? city;
    int? designationId;
    String? type;
    int? status;
    int? employmentStatusId;
    dynamic educationId;
    dynamic visaId;
    String? picture;
    DateTime? joiningDate;
    DateTime? exitDate;
    int? locationId;
    int? zuid;
    int? accountId;
    int? departmentId;
    int? workScheduleId;
    int? inviteToZoho;
    int? inviteToSlack;
    int? inviteToAsana;
    int? managerId;
    DateTime? lastLogin;
    dynamic rememberToken;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? healthCardNo;
    String? username;
    String? fatherName;
    DateTime? lastLoginMobile;
    String? playerId;
    String? motherName;
    int? candidateId;
    String? attendanceStatus;
    String? fullName;
    String? acronym;

    Employee({
        this.id,
        this.employeeNo,
        this.firstname,
        this.lastname,
        this.contactNo,
        this.officialEmail,
        this.personalEmail,
        this.nin,
        this.dateOfBirth,
        this.gender,
        this.maritalStatus,
        this.emergencyContactRelationship,
        this.emergencyContact,
        this.password,
        this.canMarkAttendance,
        this.currentAddress,
        this.currentCity,
        this.currentLatitude,
        this.currentLongitude,
        this.permanentAddress,
        this.permanentCity,
        this.permanentLatitude,
        this.permanentLongitude,
        this.city,
        this.designationId,
        this.type,
        this.status,
        this.employmentStatusId,
        this.educationId,
        this.visaId,
        this.picture,
        this.joiningDate,
        this.exitDate,
        this.locationId,
        this.zuid,
        this.accountId,
        this.departmentId,
        this.workScheduleId,
        this.inviteToZoho,
        this.inviteToSlack,
        this.inviteToAsana,
        this.managerId,
        this.lastLogin,
        this.rememberToken,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.healthCardNo,
        this.username,
        this.fatherName,
        this.lastLoginMobile,
        this.playerId,
        this.motherName,
        this.candidateId,
        this.attendanceStatus,
        this.fullName,
        this.acronym,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeNo: json["employee_no"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        contactNo: json["contact_no"],
        officialEmail: json["official_email"],
        personalEmail: json["personal_email"],
        nin: json["nin"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        maritalStatus: json["marital_status"],
        emergencyContactRelationship: json["emergency_contact_relationship"],
        emergencyContact: json["emergency_contact"],
        password: json["password"],
        canMarkAttendance: json["can_mark_attendance"],
        currentAddress: json["current_address"],
        currentCity: json["current_city"],
        currentLatitude: json["current_latitude"],
        currentLongitude: json["current_longitude"],
        permanentAddress: json["permanent_address"],
        permanentCity: json["permanent_city"],
        permanentLatitude: json["permanent_latitude"],
        permanentLongitude: json["permanent_longitude"],
        city: json["city"],
        designationId: json["designation_id"],
        type: json["type"],
        status: json["status"],
        employmentStatusId: json["employment_status_id"],
        educationId: json["education_id"],
        visaId: json["visa_id"],
        picture: json["picture"],
        joiningDate: json["joining_date"] == null ? null : DateTime.parse(json["joining_date"]),
        exitDate: json["exit_date"] == null ? null : DateTime.parse(json["exit_date"]),
        locationId: json["location_id"],
        zuid: json["zuid"],
        accountId: json["account_id"],
        departmentId: json["department_id"],
        workScheduleId: json["work_schedule_id"],
        inviteToZoho: json["invite_to_zoho"],
        inviteToSlack: json["invite_to_slack"],
        inviteToAsana: json["invite_to_asana"],
        managerId: json["manager_id"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        rememberToken: json["remember_token"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        healthCardNo: json["health_card_no"],
        username: json["username"],
        fatherName: json["father_name"],
        lastLoginMobile: json["last_login_mobile"] == null ? null : DateTime.parse(json["last_login_mobile"]),
        playerId: json["player_id"],
        motherName: json["mother_name"],
        candidateId: json["candidate_id"],
        attendanceStatus: json["attendance_status"],
        fullName: json["full_name"],
        acronym: json["acronym"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_no": employeeNo,
        "firstname": firstname,
        "lastname": lastname,
        "contact_no": contactNo,
        "official_email": officialEmail,
        "personal_email": personalEmail,
        "nin": nin,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "marital_status": maritalStatus,
        "emergency_contact_relationship": emergencyContactRelationship,
        "emergency_contact": emergencyContact,
        "password": password,
        "can_mark_attendance": canMarkAttendance,
        "current_address": currentAddress,
        "current_city": currentCity,
        "current_latitude": currentLatitude,
        "current_longitude": currentLongitude,
        "permanent_address": permanentAddress,
        "permanent_city": permanentCity,
        "permanent_latitude": permanentLatitude,
        "permanent_longitude": permanentLongitude,
        "city": city,
        "designation_id": designationId,
        "type": type,
        "status": status,
        "employment_status_id": employmentStatusId,
        "education_id": educationId,
        "visa_id": visaId,
        "picture": picture,
        "joining_date": "${joiningDate!.year.toString().padLeft(4, '0')}-${joiningDate!.month.toString().padLeft(2, '0')}-${joiningDate!.day.toString().padLeft(2, '0')}",
        "exit_date": "${exitDate!.year.toString().padLeft(4, '0')}-${exitDate!.month.toString().padLeft(2, '0')}-${exitDate!.day.toString().padLeft(2, '0')}",
        "location_id": locationId,
        "zuid": zuid,
        "account_id": accountId,
        "department_id": departmentId,
        "work_schedule_id": workScheduleId,
        "invite_to_zoho": inviteToZoho,
        "invite_to_slack": inviteToSlack,
        "invite_to_asana": inviteToAsana,
        "manager_id": managerId,
        "last_login": lastLogin?.toIso8601String(),
        "remember_token": rememberToken,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "health_card_no": healthCardNo,
        "username": username,
        "father_name": fatherName,
        "last_login_mobile": lastLoginMobile?.toIso8601String(),
        "player_id": playerId,
        "mother_name": motherName,
        "candidate_id": candidateId,
        "attendance_status": attendanceStatus,
        "full_name": fullName,
        "acronym": acronym,
    };
}

class EmploymentStatus {
    int? id;
    String? employmentStatus;
    String? description;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? deletedAt;

    EmploymentStatus({
        this.id,
        this.employmentStatus,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory EmploymentStatus.fromJson(Map<String, dynamic> json) => EmploymentStatus(
        id: json["id"],
        employmentStatus: json["employment_status"],
        description: json["description"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employment_status": employmentStatus,
        "description": description,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
    };
}

class Location {
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
    int? geoRadius;

    Location({
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

    factory Location.fromJson(Map<String, dynamic> json) => Location(
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

class Question {
    int? id;
    String? question;
    String? fieldType;
    int? typeId;
    String? jobAssessmentId;
    DateTime? createdAt;
    DateTime? updatedAt;

    Question({
        this.id,
        this.question,
        this.fieldType,
        this.typeId,
        this.jobAssessmentId,
        this.createdAt,
        this.updatedAt,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        fieldType: json["fieldType"],
        typeId: json["type_id"],
        jobAssessmentId: json["job_assessment_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "fieldType": fieldType,
        "type_id": typeId,
        "job_assessment_id": jobAssessmentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
