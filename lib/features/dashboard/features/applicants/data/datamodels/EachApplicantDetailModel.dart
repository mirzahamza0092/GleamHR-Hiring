// To parse this JSON data, do
//
//     final eachApplicantDetailModel = eachApplicantDetailModelFromJson(jsonString);

import 'dart:convert';

EachApplicantDetailModel eachApplicantDetailModelFromJson(String str) => EachApplicantDetailModel.fromJson(json.decode(str));

String eachApplicantDetailModelToJson(EachApplicantDetailModel data) => json.encode(data.toJson());

class EachApplicantDetailModel {
    List<Employee>? employees;
    List<CurrentRating>? status;
    List<Comment>? comments;
    List<dynamic>? emails;
    List<Role>? customRoles;
    List<Role>? managerRoles;
    List<Role>? employeeRoles;
    List<HiringPacket>? hiringPackets;
    Candidate? candidate;
    String? difference;
    List<AllTemplate>? allTemplates;
    CurrentRating? currentStatus;
    CurrentRating? currentRating;
    dynamic candidateAnswers;
    List<int>? employeesCandidateIds;
    dynamic personalityResult;
    List<StatusArray>? statusArray;

    EachApplicantDetailModel({
        this.employees,
        this.status,
        this.comments,
        this.emails,
        this.customRoles,
        this.managerRoles,
        this.employeeRoles,
        this.hiringPackets,
        this.candidate,
        this.difference,
        this.allTemplates,
        this.currentStatus,
        this.currentRating,
        this.candidateAnswers,
        this.employeesCandidateIds,
        this.personalityResult,
        this.statusArray,
    });

    factory EachApplicantDetailModel.fromJson(Map<String, dynamic> json) => EachApplicantDetailModel(
        employees: json["employees"] == null ? [] : List<Employee>.from(json["employees"]!.map((x) => Employee.fromJson(x))),
        status: json["status"] == null ? [] : List<CurrentRating>.from(json["status"]!.map((x) => CurrentRating.fromJson(x))),
        comments: json["comments"] == null ? [] : List<Comment>.from(json["comments"]!.map((x) => Comment.fromJson(x))),
        emails: json["emails"] == null ? [] : List<dynamic>.from(json["emails"]!.map((x) => x)),
        customRoles: json["customRoles"] == null ? [] : List<Role>.from(json["customRoles"]!.map((x) => Role.fromJson(x))),
        managerRoles: json["managerRoles"] == null ? [] : List<Role>.from(json["managerRoles"]!.map((x) => Role.fromJson(x))),
        employeeRoles: json["employeeRoles"] == null ? [] : List<Role>.from(json["employeeRoles"]!.map((x) => Role.fromJson(x))),
        hiringPackets: json["hiringPackets"] == null ? [] : List<HiringPacket>.from(json["hiringPackets"]!.map((x) => HiringPacket.fromJson(x))),
        candidate: json["candidate"] == null ? null : Candidate.fromJson(json["candidate"]),
        difference: json["difference"],
        allTemplates: json["allTemplates"] == null ? [] : List<AllTemplate>.from(json["allTemplates"]!.map((x) => AllTemplate.fromJson(x))),
        currentStatus: json["currentStatus"] == null ? null : CurrentRating.fromJson(json["currentStatus"]),
        currentRating: json["currentRating"] == null ? null : CurrentRating.fromJson(json["currentRating"]),
        candidateAnswers: json["candidateAnswers"],
        employeesCandidateIds: json["employeesCandidateIds"] == null ? [] : List<int>.from(json["employeesCandidateIds"]!.map((x) => x)),
        personalityResult: json["personalityResult"],
        statusArray: json["statusArray"] == null ? [] : List<StatusArray>.from(json["statusArray"]!.map((x) => StatusArray.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toJson())),
        "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toJson())),
        "comments": comments == null ? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "emails": emails == null ? [] : List<dynamic>.from(emails!.map((x) => x)),
        "customRoles": customRoles == null ? [] : List<dynamic>.from(customRoles!.map((x) => x.toJson())),
        "managerRoles": managerRoles == null ? [] : List<dynamic>.from(managerRoles!.map((x) => x.toJson())),
        "employeeRoles": employeeRoles == null ? [] : List<dynamic>.from(employeeRoles!.map((x) => x.toJson())),
        "hiringPackets": hiringPackets == null ? [] : List<dynamic>.from(hiringPackets!.map((x) => x.toJson())),
        "candidate": candidate?.toJson(),
        "difference": difference,
        "allTemplates": allTemplates == null ? [] : List<dynamic>.from(allTemplates!.map((x) => x.toJson())),
        "currentStatus": currentStatus?.toJson(),
        "currentRating": currentRating?.toJson(),
        "candidateAnswers": candidateAnswers,
        "employeesCandidateIds": employeesCandidateIds == null ? [] : List<dynamic>.from(employeesCandidateIds!.map((x) => x)),
        "personalityResult": personalityResult,
        "statusArray": statusArray == null ? [] : List<dynamic>.from(statusArray!.map((x) => x.toJson())),
    };
}

class AllTemplate {
    int? id;
    String? mailable;
    String? templateName;
    String? subject;
    String? message;
    int? welcomeEmail;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<dynamic>? emailAttachments;

    AllTemplate({
        this.id,
        this.mailable,
        this.templateName,
        this.subject,
        this.message,
        this.welcomeEmail,
        this.createdAt,
        this.updatedAt,
        this.emailAttachments,
    });

    factory AllTemplate.fromJson(Map<String, dynamic> json) => AllTemplate(
        id: json["id"],
        mailable: json["mailable"],
        templateName: json["template_name"],
        subject: json["subject"],
        message: json["message"],
        welcomeEmail: json["welcome_email"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        emailAttachments: json["email_attachments"] == null ? [] : List<dynamic>.from(json["email_attachments"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mailable": mailable,
        "template_name": templateName,
        "subject": subject,
        "message": message,
        "welcome_email": welcomeEmail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "email_attachments": emailAttachments == null ? [] : List<dynamic>.from(emailAttachments!.map((x) => x)),
    };
}

class Candidate {
    int? id;
    String? name;
    String? fatherName;
    String? email;
    dynamic avatar;
    String? city;
    String? jobStatus;
    int? recruited;
    int? jobId;
    dynamic talentPoolId;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? desiredJobLocation;
    String? mobileNumber;
    int? statusId;
    dynamic candidateStatusId;
    String? acronym;
    List<dynamic>? answers;
    Job? job;
    dynamic candidateCvDetails;
    Location? desiredLocation;

    Candidate({
        this.id,
        this.name,
        this.fatherName,
        this.email,
        this.avatar,
        this.city,
        this.jobStatus,
        this.recruited,
        this.jobId,
        this.talentPoolId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.desiredJobLocation,
        this.mobileNumber,
        this.statusId,
        this.candidateStatusId,
        this.acronym,
        this.answers,
        this.job,
        this.candidateCvDetails,
        this.desiredLocation,
    });

    factory Candidate.fromJson(Map<String, dynamic> json) => Candidate(
        id: json["id"],
        name: json["name"],
        fatherName: json["father_name"],
        email: json["email"],
        avatar: json["avatar"],
        city: json["city"],
        jobStatus: json["job_status"],
        recruited: json["recruited"],
        jobId: json["job_id"],
        talentPoolId: json["talent_pool_id"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        desiredJobLocation: json["desired_job_location"],
        mobileNumber: json["mobile_number"],
        statusId: json["status_id"],
        candidateStatusId: json["candidate_status_id"],
        acronym: json["acronym"],
        answers: json["answers"] == null ? [] : List<dynamic>.from(json["answers"]!.map((x) => x)),
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        candidateCvDetails: json["candidate_cv_details"],
        desiredLocation: json["desired_location"] == null ? null : Location.fromJson(json["desired_location"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "father_name": fatherName,
        "email": email,
        "avatar": avatar,
        "city": city,
        "job_status": jobStatus,
        "recruited": recruited,
        "job_id": jobId,
        "talent_pool_id": talentPoolId,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "desired_job_location": desiredJobLocation,
        "mobile_number": mobileNumber,
        "status_id": statusId,
        "candidate_status_id": candidateStatusId,
        "acronym": acronym,
        "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x)),
        "job": job?.toJson(),
        "candidate_cv_details": candidateCvDetails,
        "desired_location": desiredLocation?.toJson(),
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

class Job {
    int? id;
    String? title;
    dynamic description;
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
    dynamic divisionId;

    Job({
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
    });

    factory Job.fromJson(Map<String, dynamic> json) => Job(
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
    };
}

class Comment {
    int? id;
    String? comment;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? candidateId;
    int? setBy;
    CandidateSetBy? candidateSetBy;

    Comment({
        this.id,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.candidateId,
        this.setBy,
        this.candidateSetBy,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        comment: json["comment"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        candidateId: json["candidate_id"],
        setBy: json["set_by"],
        candidateSetBy: json["candidate_set_by"] == null ? null : CandidateSetBy.fromJson(json["candidate_set_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "comment": comment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "candidate_id": candidateId,
        "set_by": setBy,
        "candidate_set_by": candidateSetBy?.toJson(),
    };
}

class CandidateSetBy {
    int? id;
    String? firstname;
    String? lastname;
    String? contactNo;
    String? officialEmail;
    int? locationId;
    int? designationId;
    String? picture;
    String? fullName;
    String? acronym;
    Location? location;
    Designation? designation;

    CandidateSetBy({
        this.id,
        this.firstname,
        this.lastname,
        this.contactNo,
        this.officialEmail,
        this.locationId,
        this.designationId,
        this.picture,
        this.fullName,
        this.acronym,
        this.location,
        this.designation,
    });

    factory CandidateSetBy.fromJson(Map<String, dynamic> json) => CandidateSetBy(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        contactNo: json["contact_no"],
        officialEmail: json["official_email"],
        locationId: json["location_id"],
        designationId: json["designation_id"],
        picture: json["picture"],
        fullName: json["full_name"],
        acronym: json["acronym"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        designation: json["designation"] == null ? null : Designation.fromJson(json["designation"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "contact_no": contactNo,
        "official_email": officialEmail,
        "location_id": locationId,
        "designation_id": designationId,
        "picture": picture,
        "full_name": fullName,
        "acronym": acronym,
        "location": location?.toJson(),
        "designation": designation?.toJson(),
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

class CurrentRating {
    int? id;
    int? candidateId;
    String? changeIn;
    String? status;
    int? setBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? mailStatus;
    CandidateSetBy? candidateSetBy;

    CurrentRating({
        this.id,
        this.candidateId,
        this.changeIn,
        this.status,
        this.setBy,
        this.createdAt,
        this.updatedAt,
        this.mailStatus,
        this.candidateSetBy,
    });

    factory CurrentRating.fromJson(Map<String, dynamic> json) => CurrentRating(
        id: json["id"],
        candidateId: json["candidate_id"],
        changeIn: json["change_in"],
        status: json["status"],
        setBy: json["set_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        mailStatus: json["mail_status"],
        candidateSetBy: json["candidate_set_by"] == null ? null : CandidateSetBy.fromJson(json["candidate_set_by"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "candidate_id": candidateId,
        "change_in": changeIn,
        "status": status,
        "set_by": setBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "mail_status": mailStatus,
        "candidate_set_by": candidateSetBy?.toJson(),
    };
}

class Role {
    int? id;
    String? name;
    String? guardName;
    String? type;
    String? description;
    String? subRole;
    DateTime? createdAt;
    DateTime? updatedAt;

    Role({
        this.id,
        this.name,
        this.guardName,
        this.type,
        this.description,
        this.subRole,
        this.createdAt,
        this.updatedAt,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        type: json["type"],
        description: json["description"],
        subRole: json["sub_role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

class HiringPacket {
    int? id;
    String? name;
    dynamic arrivalTime;
    String? location;
    String? latitude;
    String? longitude;
    dynamic contactTo;
    dynamic instructions;
    int? getToKnowEmail;
    String? sendEmailTo;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    HiringPacket({
        this.id,
        this.name,
        this.arrivalTime,
        this.location,
        this.latitude,
        this.longitude,
        this.contactTo,
        this.instructions,
        this.getToKnowEmail,
        this.sendEmailTo,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory HiringPacket.fromJson(Map<String, dynamic> json) => HiringPacket(
        id: json["id"],
        name: json["name"],
        arrivalTime: json["arrival_time"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        contactTo: json["contact_to"],
        instructions: json["instructions"],
        getToKnowEmail: json["get_to_know_email"],
        sendEmailTo: json["send_email_to"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arrival_time": arrivalTime,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "contact_to": contactTo,
        "instructions": instructions,
        "get_to_know_email": getToKnowEmail,
        "send_email_to": sendEmailTo,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class StatusArray {
    int? id;
    String? status;
    String? changeIn;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    StatusArray({
        this.id,
        this.status,
        this.changeIn,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory StatusArray.fromJson(Map<String, dynamic> json) => StatusArray(
        id: json["id"],
        status: json["status"],
        changeIn: json["change_in"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "change_in": changeIn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
