import 'dart:convert';

RateModel rateModelFromJson(String str) => RateModel.fromJson(json.decode(str));

String rateModelToJson(RateModel data) => json.encode(data.toJson());

class RateModel {
  final String status;
  final String message;
  final List<From> from;
  final List<From> to;

  RateModel({
    required this.status,
    required this.message,
    required this.from,
    required this.to,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    status: json["status"],
    message: json["message"],
    from: List<From>.from(json["from"].map((x) => From.fromJson(x))),
    to: List<From>.from(json["to"].map((x) => From.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "from": List<dynamic>.from(from.map((x) => x.toJson())),
    "to": List<dynamic>.from(to.map((x) => x.toJson())),
  };
}

class From {
  final int id;
  final String name;

  From({
    required this.id,
    required this.name,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
