// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? accessToken;
    String? tokenType;
    DateTime? expiresAt;
    UserData? userData;
    List<UserRole>? userRole;

    LoginModel({
        this.accessToken,
        this.tokenType,
        this.expiresAt,
        this.userData,
        this.userRole,
    });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresAt: json["expires_at"] == null ? null : DateTime.parse(json["expires_at"]),
        userData: json["user_data"] == null ? null : UserData.fromJson(json["user_data"]),
        userRole: json["user_role"] == null ? [] : List<UserRole>.from(json["user_role"]!.map((x) => UserRole.fromJson(x))),
    );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_at": expiresAt?.toIso8601String(),
        "user_data": userData?.toJson(),
        "user_role": userRole == null ? [] : List<dynamic>.from(userRole!.map((x) => x.toJson())),
    };
}

class UserData {
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
    dynamic city;
    int? designationId;
    String? type;
    int? status;
    int? employmentStatusId;
    dynamic educationId;
    dynamic visaId;
    String? picture;
    DateTime? joiningDate;
    dynamic exitDate;
    int? locationId;
    int? zuid;
    int? accountId;
    int? departmentId;
    int? workScheduleId;
    dynamic inviteToZoho;
    dynamic inviteToSlack;
    dynamic inviteToAsana;
    int? managerId;
    DateTime? lastLogin;
    dynamic rememberToken;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic healthCardNo;
    String? username;
    String? fatherName;
    DateTime? lastLoginMobile;
    String? playerId;
    String? motherName;
    dynamic candidateId;
    String? fullName;
    String? acronym;
    Location? location;
    Designation? designation;
    Department? department;

  UserData({
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
    this.fullName,
    this.acronym,
    this.location,
    this.designation,
    this.department,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        employeeNo: json["employee_no"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        contactNo: json["contact_no"],
        officialEmail: json["official_email"],
        personalEmail: json["personal_email"],
        nin: json["nin"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
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
        joiningDate: json["joining_date"] == null
            ? null
            : DateTime.parse(json["joining_date"]),
        exitDate: json["exit_date"],
        locationId: json["location_id"],
        zuid: json["zuid"],
        accountId: json["account_id"],
        departmentId: json["department_id"],
        workScheduleId: json["work_schedule_id"],
        inviteToZoho: json["invite_to_zoho"],
        inviteToSlack: json["invite_to_slack"],
        inviteToAsana: json["invite_to_asana"],
        managerId: json["manager_id"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        rememberToken: json["remember_token"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        healthCardNo: json["health_card_no"],
        username: json["username"],
        fatherName: json["father_name"],
        lastLoginMobile: json["last_login_mobile"] == null
            ? null
            : DateTime.parse(json["last_login_mobile"]),
        playerId: json["player_id"],
        motherName: json["mother_name"],
        candidateId: json["candidate_id"],
        fullName: json["full_name"],
        acronym: json["acronym"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        designation: json["designation"] == null
            ? null
            : Designation.fromJson(json["designation"]),
        department: json["department"] == null
            ? null
            : Department.fromJson(json["department"]),
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
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
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
        "joining_date":
            "${joiningDate!.year.toString().padLeft(4, '0')}-${joiningDate!.month.toString().padLeft(2, '0')}-${joiningDate!.day.toString().padLeft(2, '0')}",
        "exit_date": exitDate,
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
        "full_name": fullName,
        "acronym": acronym,
        "location": location?.toJson(),
        "designation": designation?.toJson(),
        "department": department?.toJson(),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

  Designation({
    this.id,
    this.designationName,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => Designation(
        id: json["id"],
        designationName: json["designation_name"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "designation_name": designationName,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Location {
    int? id;
    String? name;
    String? street1;
    dynamic street2;
    String? city;
    String? state;
    int? zipCode;
    String? country;
    String? latitude;
    String? longitude;
    dynamic phoneNumber;
    dynamic timezone;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    dynamic geoRadius;

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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

class UserRole {
    int? id;
    String? name;
    String? guardName;
    String? type;
    dynamic description;
    String? subRole;
    DateTime? createdAt;
    DateTime? updatedAt;
    UserRolePivot? pivot;
    List<Permission>? permissions;

  UserRole({
    this.id,
    this.name,
    this.guardName,
    this.type,
    this.description,
    this.subRole,
    this.createdAt,
    this.updatedAt,
    this.pivot,
    this.permissions,
  });

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        type: json["type"],
        description: json["description"],
        subRole: json["sub_role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : UserRolePivot.fromJson(json["pivot"]),
        permissions: json["permissions"] == null ? [] : List<Permission>.from(json["permissions"]!.map((x) => Permission.fromJson(x))),
    );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "type": type,
        "description": description,
        "sub_role": subRole,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
        "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x.toJson())),
    };
}

class Permission {
    int? id;
    String? name;
    String? guardName;
    DateTime? createdAt;
    DateTime? updatedAt;
    PermissionPivot? pivot;

    Permission({
        this.id,
        this.name,
        this.guardName,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : PermissionPivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot?.toJson(),
    };
}

class PermissionPivot {
    int? roleId;
    int? permissionId;
    int? accessLevelId;

    PermissionPivot({
        this.roleId,
        this.permissionId,
        this.accessLevelId,
    });

    factory PermissionPivot.fromJson(Map<String, dynamic> json) => PermissionPivot(
        roleId: json["role_id"],
        permissionId: json["permission_id"],
        accessLevelId: json["access_level_id"],
    );

    Map<String, dynamic> toJson() => {
        "role_id": roleId,
        "permission_id": permissionId,
        "access_level_id": accessLevelId,
    };
}

class UserRolePivot {
    int? modelId;
    int? roleId;
    String? modelType;

    UserRolePivot({
        this.modelId,
        this.roleId,
        this.modelType,
    });

    factory UserRolePivot.fromJson(Map<String, dynamic> json) => UserRolePivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
      };
}
