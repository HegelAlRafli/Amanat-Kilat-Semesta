import 'dart:convert';

PostageModel postageModelFromJson(String str) => PostageModel.fromJson(json.decode(str));

String postageModelToJson(PostageModel data) => json.encode(data.toJson());

class PostageModel {
  final String status;
  final String message;
  final List<Rate> rate;
  final String asal;
  final String tujuan;

  PostageModel({
    required this.status,
    required this.message,
    required this.rate,
    required this.asal,
    required this.tujuan,
  });

  factory PostageModel.fromJson(Map<String, dynamic> json) => PostageModel(
    status: json["status"],
    message: json["message"],
    rate: List<Rate>.from(json["rate"].map((x) => Rate.fromJson(x))),
    asal: json["asal"],
    tujuan: json["tujuan"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "rate": List<dynamic>.from(rate.map((x) => x.toJson())),
    "asal": asal,
    "tujuan": tujuan,
  };
}

class Rate {
  final int id;
  final int from;
  final int to;
  final int serviceId;
  final int price;
  final String estimate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ServicesType servicesType;

  Rate({
    required this.id,
    required this.from,
    required this.to,
    required this.serviceId,
    required this.price,
    required this.estimate,
    required this.createdAt,
    required this.updatedAt,
    required this.servicesType,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    id: json["id"],
    from: json["from"],
    to: json["to"],
    serviceId: json["service_id"],
    price: json["price"],
    estimate: json["estimate"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    servicesType: ServicesType.fromJson(json["services_type"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to,
    "service_id": serviceId,
    "price": price,
    "estimate": estimate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "services_type": servicesType.toJson(),
  };
}

class ServicesType {
  final int id;
  final String name;
  final String description;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ServicesType({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServicesType.fromJson(Map<String, dynamic> json) => ServicesType(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
