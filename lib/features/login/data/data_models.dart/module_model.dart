// To parse this JSON data, do
//
//     final moduleModel = moduleModelFromJson(jsonString);

import 'dart:convert';

ModuleModel moduleModelFromJson(String str) => ModuleModel.fromJson(json.decode(str));

String moduleModelToJson(ModuleModel data) => json.encode(data.toJson());

class ModuleModel {
    List<Datum>? data;

    ModuleModel({
        this.data,
    });

    factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? moduleName;
    int? status;

    Datum({
        this.id,
        this.moduleName,
        this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        moduleName: json["module_name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "module_name": moduleName,
        "status": status,
    };
}
