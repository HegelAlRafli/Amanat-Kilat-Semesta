class TrackModel {
  String? status;
  String? message;
  Track? track;
  List<Data>? data;
  String? last;

  TrackModel({this.status, this.message, this.track, this.data, this.last});

  TrackModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    track = json['track'] != null ? new Track.fromJson(json['track']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.track != null) {
      data['track'] = this.track!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['last'] = this.last;
    return data;
  }
}

class Track {
  int? id;
  String? awb;
  String? sender;
  String? from;
  String? recipient;
  String? phone;
  String? address;
  String? city;
  String? province;
  String? postalcode;
  String? deliveryDate;
  String? goodsName;
  String? weight;
  String? unitSize;
  int? servicesType;
  String? status;
  String? receiptDate;
  String? notes;
  KotaAsal? kotaAsal;
  KotaAsal? kotaTujuan;
  List<ShippingTrackers>? shippingTrackers;
  Customer? customer;

  Track(
      {this.id,
        this.awb,
        this.sender,
        this.from,
        this.recipient,
        this.phone,
        this.address,
        this.city,
        this.province,
        this.postalcode,
        this.deliveryDate,
        this.goodsName,
        this.weight,
        this.unitSize,
        this.servicesType,
        this.status,
        this.receiptDate,
        this.notes,
        this.kotaAsal,
        this.kotaTujuan,
        this.shippingTrackers,
        this.customer});

  Track.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    awb = json['awb'];
    sender = json['sender'];
    from = json['from'];
    recipient = json['recipient'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    province = json['province'];
    postalcode = json['postalcode'];
    deliveryDate = json['delivery_date'];
    goodsName = json['goods_name'];
    weight = json['weight'];
    unitSize = json['unit_size'];
    servicesType = json['services_type'];
    status = json['status'];
    receiptDate = json['receipt_date'];
    notes = json['notes'];
    kotaAsal = json['kota_asal'] != null
        ? new KotaAsal.fromJson(json['kota_asal'])
        : null;
    kotaTujuan = json['kota_tujuan'] != null
        ? new KotaAsal.fromJson(json['kota_tujuan'])
        : null;
    if (json['shipping_trackers'] != null) {
      shippingTrackers = <ShippingTrackers>[];
      json['shipping_trackers'].forEach((v) {
        shippingTrackers!.add(new ShippingTrackers.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['awb'] = this.awb;
    data['sender'] = this.sender;
    data['from'] = this.from;
    data['recipient'] = this.recipient;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['province'] = this.province;
    data['postalcode'] = this.postalcode;
    data['delivery_date'] = this.deliveryDate;
    data['goods_name'] = this.goodsName;
    data['weight'] = this.weight;
    data['unit_size'] = this.unitSize;
    data['services_type'] = this.servicesType;
    data['status'] = this.status;
    data['receipt_date'] = this.receiptDate;
    data['notes'] = this.notes;
    if (this.kotaAsal != null) {
      data['kota_asal'] = this.kotaAsal!.toJson();
    }
    if (this.kotaTujuan != null) {
      data['kota_tujuan'] = this.kotaTujuan!.toJson();
    }
    if (this.shippingTrackers != null) {
      data['shipping_trackers'] =
          this.shippingTrackers!.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class KotaAsal {
  int? id;
  String? name;

  KotaAsal({this.id, this.name});

  KotaAsal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ShippingTrackers {
  int? id;
  int? shippingId;
  String? date;
  String? time;
  String? status;
  String? notes;

  ShippingTrackers(
      {this.id,
        this.shippingId,
        this.date,
        this.time,
        this.status,
        this.notes});

  ShippingTrackers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingId = json['shipping_id'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shipping_id'] = this.shippingId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['notes'] = this.notes;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? category;
  String? phone;
  String? email;
  String? province;
  String? city;
  String? district;
  String? subdistrict;
  String? address;
  String? postalcode;

  Customer(
      {this.id,
        this.name,
        this.category,
        this.phone,
        this.email,
        this.province,
        this.city,
        this.district,
        this.subdistrict,
        this.address,
        this.postalcode});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    phone = json['phone'];
    email = json['email'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    subdistrict = json['subdistrict'];
    address = json['address'];
    postalcode = json['postalcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    data['subdistrict'] = this.subdistrict;
    data['address'] = this.address;
    data['postalcode'] = this.postalcode;
    return data;
  }
}

class Data {
  int? id;
  int? shippingId;
  String? date;
  String? time;
  String? status;
  String? notes;

  Data(
      {this.id,
        this.shippingId,
        this.date,
        this.time,
        this.status,
        this.notes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingId = json['shipping_id'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shipping_id'] = this.shippingId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['notes'] = this.notes;
    return data;
  }
}
