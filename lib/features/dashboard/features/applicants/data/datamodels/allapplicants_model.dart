// To parse this JSON data, do
//
//     final allApplicantsModel = allApplicantsModelFromJson(jsonString);

import 'dart:convert';

AllApplicantsModel allApplicantsModelFromJson(String str) => AllApplicantsModel.fromJson(json.decode(str));

String allApplicantsModelToJson(AllApplicantsModel data) => json.encode(data.toJson());

class AllApplicantsModel {
    String? success;
    Applicants? applicants;

    AllApplicantsModel({
        this.success,
        this.applicants,
    });

    factory AllApplicantsModel.fromJson(Map<String, dynamic> json) => AllApplicantsModel(
        success: json["success"],
        applicants: json["applicants"] == null ? null : Applicants.fromJson(json["applicants"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "applicants": applicants?.toJson(),
    };
}

class Applicants {
    int? currentPage;
    List<Datum>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    dynamic nextPageUrl;
    String? path;
    int? perPage;
    dynamic prevPageUrl;
    int? to;
    int? total;

    Applicants({
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

    factory Applicants.fromJson(Map<String, dynamic> json) => Applicants(
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
    SuitabilityScore? suitabilityScore;
    CandidateCvDetails? candidateCvDetails;
    dynamic talentPool;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        suitabilityScore: json["suitability_score"] == null ? null : SuitabilityScore.fromJson(json["suitability_score"]),
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
        "suitability_score": suitabilityScore?.toJson(),
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

class SuitabilityScore {
    int? id;
    int? candidateId;
    String? score;
    DateTime? createdAt;
    DateTime? updatedAt;

    SuitabilityScore({
        this.id,
        this.candidateId,
        this.score,
        this.createdAt,
        this.updatedAt,
    });

    factory SuitabilityScore.fromJson(Map<String, dynamic> json) => SuitabilityScore(
        id: json["id"],
        candidateId: json["candidate_id"],
        score: json["score"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "candidate_id": candidateId,
        "score": score,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
