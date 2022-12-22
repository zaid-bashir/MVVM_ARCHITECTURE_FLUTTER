import 'dart:convert';

SemesterError semesterErrorFromJson(String str) =>
    SemesterError.fromJson(json.decode(str));

String semesterErrorToJson(SemesterError data) => json.encode(data.toJson());

class SemesterError {
  SemesterError({
    this.isError = false,
    this.code = 0,
    this.message = "",
  });

  int code;
  String message;
  bool isError;

  factory SemesterError.fromJson(Map<String, dynamic> json) => SemesterError(
        isError: json['isError'],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isError": isError,
        "code": code,
        "message": message,
      };
}
