// To parse this JSON data, do
//
//     final jobApplicantsModel = jobApplicantsModelFromJson(jsonString);

import 'dart:convert';

JobApplicantsModel jobApplicantsModelFromJson(String str) => JobApplicantsModel.fromJson(json.decode(str));

String jobApplicantsModelToJson(JobApplicantsModel data) => json.encode(data.toJson());

class JobApplicantsModel {
    String? success;
    List<Applicant>? applicants;

    JobApplicantsModel({
        this.success,
        this.applicants,
    });

    factory JobApplicantsModel.fromJson(Map<String, dynamic> json) => JobApplicantsModel(
        success: json["success"],
        applicants: json["applicants"] == null ? [] : List<Applicant>.from(json["applicants"]!.map((x) => Applicant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "applicants": applicants == null ? [] : List<dynamic>.from(applicants!.map((x) => x.toJson())),
    };
}

class Applicant {
    int? id;
    String? name;
    String? fatherName;
    String? email;
    String? avatar;
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
    int? candidateStatusId;
    CurrentRating? currentRating;
    String? acronym;
    Job? job;
    CandidateStatus? candidateStatus;
    List<Answer>? answers;
    List<CurrentRating>? status;
    List<CurrentRating>? statusLog;
    dynamic suitabilityScore;
    CandidateCvDetails? candidateCvDetails;
    dynamic talentPool;

    Applicant({
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
        this.currentRating,
        this.acronym,
        this.job,
        this.candidateStatus,
        this.answers,
        this.status,
        this.statusLog,
        this.suitabilityScore,
        this.candidateCvDetails,
        this.talentPool,
    });

    factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
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
        currentRating: json["currentRating"] == null ? null : CurrentRating.fromJson(json["currentRating"]),
        acronym: json["acronym"],
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        candidateStatus: json["candidate_status"] == null ? null : CandidateStatus.fromJson(json["candidate_status"]),
        answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
        status: json["status"] == null ? [] : List<CurrentRating>.from(json["status"]!.map((x) => CurrentRating.fromJson(x))),
        statusLog: json["status_log"] == null ? [] : List<CurrentRating>.from(json["status_log"]!.map((x) => CurrentRating.fromJson(x))),
        suitabilityScore: json["suitability_score"],
        candidateCvDetails: json["candidate_cv_details"] == null ? null : CandidateCvDetails.fromJson(json["candidate_cv_details"]),
        talentPool: json["talent_pool"],
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
        "currentRating": currentRating?.toJson(),
        "acronym": acronym,
        "job": job?.toJson(),
        "candidate_status": candidateStatus?.toJson(),
        "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
        "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toJson())),
        "status_log": statusLog == null ? [] : List<dynamic>.from(statusLog!.map((x) => x.toJson())),
        "suitability_score": suitabilityScore,
        "candidate_cv_details": candidateCvDetails?.toJson(),
        "talent_pool": talentPool,
    };
}

class Answer {
    int? id;
    int? jobQuestionsId;
    int? candidateId;
    String? answer;
    dynamic deletedAt;
    DateTime? createdAt;
    DateTime? updatedAt;

    Answer({
        this.id,
        this.jobQuestionsId,
        this.candidateId,
        this.answer,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        jobQuestionsId: json["jobQuestions_id"],
        candidateId: json["candidate_id"],
        answer: json["answer"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jobQuestions_id": jobQuestionsId,
        "candidate_id": candidateId,
        "answer": answer,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class CandidateCvDetails {
    int? id;
    int? candidateId;
    dynamic noOfJobs;
    dynamic experience;
    dynamic jobSkills;
    dynamic similarity;
    DateTime? createdAt;
    DateTime? updatedAt;

    CandidateCvDetails({
        this.id,
        this.candidateId,
        this.noOfJobs,
        this.experience,
        this.jobSkills,
        this.similarity,
        this.createdAt,
        this.updatedAt,
    });

    factory CandidateCvDetails.fromJson(Map<String, dynamic> json) => CandidateCvDetails(
        id: json["id"],
        candidateId: json["candidate_id"],
        noOfJobs: json["no_of_jobs"],
        experience: json["experience"],
        jobSkills: json["job_skills"],
        similarity: json["similarity"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "candidate_id": candidateId,
        "no_of_jobs": noOfJobs,
        "experience": experience,
        "job_skills": jobSkills,
        "similarity": similarity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class CandidateStatus {
    int? id;
    String? status;
    String? changeIn;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    CandidateStatus({
        this.id,
        this.status,
        this.changeIn,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory CandidateStatus.fromJson(Map<String, dynamic> json) => CandidateStatus(
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

class CurrentRating {
    int? id;
    int? candidateId;
    String? changeIn;
    String? status;
    int? setBy;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? mailStatus;

    CurrentRating({
        this.id,
        this.candidateId,
        this.changeIn,
        this.status,
        this.setBy,
        this.createdAt,
        this.updatedAt,
        this.mailStatus,
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
    int? divisionId;
    HiringLead? hiringLead;

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
        this.hiringLead,
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
        hiringLead: json["hiring_lead"] == null ? null : HiringLead.fromJson(json["hiring_lead"]),
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
        "hiring_lead": hiringLead?.toJson(),
    };
}

class HiringLead {
    int? id;
    String? employeeNo;
    String? firstname;
    String? lastname;
    dynamic contactNo;
    String? officialEmail;
    dynamic personalEmail;
    dynamic nin;
    dynamic dateOfBirth;
    String? gender;
    dynamic maritalStatus;
    String? emergencyContactRelationship;
    dynamic emergencyContact;
    String? password;
    int? canMarkAttendance;
    dynamic currentAddress;
    dynamic currentCity;
    dynamic currentLatitude;
    dynamic currentLongitude;
    dynamic permanentAddress;
    dynamic permanentCity;
    dynamic permanentLatitude;
    dynamic permanentLongitude;
    dynamic city;
    int? designationId;
    String? type;
    int? status;
    int? employmentStatusId;
    dynamic educationId;
    dynamic visaId;
    dynamic picture;
    DateTime? joiningDate;
    DateTime? exitDate;
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
    dynamic lastLoginMobile;
    dynamic playerId;
    dynamic motherName;
    dynamic candidateId;
    String? attendanceStatus;
    String? fullName;
    String? acronym;

    HiringLead({
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

    factory HiringLead.fromJson(Map<String, dynamic> json) => HiringLead(
        id: json["id"],
        employeeNo: json["employee_no"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        contactNo: json["contact_no"],
        officialEmail: json["official_email"],
        personalEmail: json["personal_email"],
        nin: json["nin"],
        dateOfBirth: json["date_of_birth"],
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
        lastLoginMobile: json["last_login_mobile"],
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
        "date_of_birth": dateOfBirth,
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
        "last_login_mobile": lastLoginMobile,
        "player_id": playerId,
        "mother_name": motherName,
        "candidate_id": candidateId,
        "attendance_status": attendanceStatus,
        "full_name": fullName,
        "acronym": acronym,
    };
}
