class GetPostInfoByIdResponseModel {
  GetPostInfoByIdResponseModel({
    required this.success,
    required this.data,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final Data data;
  late final String message;
  late final Payload payload;

  GetPostInfoByIdResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.pickup,
    required this.receiver,
    required this.customer,
    required this.postType,
    required this.status,
    required this.postExpiryDate,
    required this.pickupDate,
    required this.loadDetail,
    required this.vehicle,
    required this.fare,
    required this.commission,
    required this.advancePayment,
    required this.deliveryPayment,
    required this.isArchived,
    required this.lowestBid,
    required this.lowestBidder,
    required this.vehicleAccepted,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final Pickup pickup;
  late final Receiver receiver;
  late final String customer;
  late final String postType;
  late final String status;
  late final String postExpiryDate;
  late final String pickupDate;
  late final LoadDetail loadDetail;
  late final Vehicle vehicle;
  late final int fare;
  late final int commission;
  late final AdvancePayment advancePayment;
  late final DeliveryPayment deliveryPayment;
  late final bool isArchived;
  late final int lowestBid;
  late final int lowestBidder;
  late final int vehicleAccepted;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    pickup = Pickup.fromJson(json['pickup']);
    receiver = Receiver.fromJson(json['receiver']);
    customer = json['customer'];
    postType = json['postType'];
    status = json['status'];
    postExpiryDate = json['postExpiryDate'];
    pickupDate = json['pickupDate'];
    loadDetail = LoadDetail.fromJson(json['loadDetail']);
    vehicle = Vehicle.fromJson(json['vehicle']);
    fare = json['fare'];
    commission = json['commission'];
    advancePayment = AdvancePayment.fromJson(json['advancePayment']);
    deliveryPayment = DeliveryPayment.fromJson(json['deliveryPayment']);
    isArchived = json['isArchived'];
    lowestBid = json['lowestBid'];
    lowestBidder = json['lowestBidder'];
    vehicleAccepted = json['vehicleAccepted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['pickup'] = pickup.toJson();
    _data['receiver'] = receiver.toJson();
    _data['customer'] = customer;
    _data['postType'] = postType;
    _data['status'] = status;
    _data['postExpiryDate'] = postExpiryDate;
    _data['pickupDate'] = pickupDate;
    _data['loadDetail'] = loadDetail.toJson();
    _data['vehicle'] = vehicle.toJson();
    _data['fare'] = fare;
    _data['commission'] = commission;
    _data['advancePayment'] = advancePayment.toJson();
    _data['deliveryPayment'] = deliveryPayment.toJson();
    _data['isArchived'] = isArchived;
    _data['lowestBid'] = lowestBid;
    _data['lowestBidder'] = lowestBidder;
    _data['vehicleAccepted'] = vehicleAccepted;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class Pickup {
  Pickup({
    required this.reference,
    required this.name,
    required this.phone,
    required this.geo,
    required this.address,
    required this.customer,
    required this.id,
  });
  late final String reference;
  late final String name;
  late final String phone;
  late final Geo geo;
  late final Address address;
  late final String customer;
  late final String id;

  Pickup.fromJson(Map<String, dynamic> json){
    reference = json['reference'];
    name = json['name'];
    phone = json['phone'];
    geo = Geo.fromJson(json['geo']);
    address = Address.fromJson(json['address']);
    customer = json['customer'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reference'] = reference;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['geo'] = geo.toJson();
    _data['address'] = address.toJson();
    _data['customer'] = customer;
    _data['_id'] = id;
    return _data;
  }
}

class Geo {
  Geo({
    required this.type,
    required this.address,
    required this.coordinates,
    required this.id,
  });
  late final String type;
  late final String address;
  late final List<double> coordinates;
  late final String id;

  Geo.fromJson(Map<String, dynamic> json){
    type = json['type'];
    address = json['address'];
    coordinates = List.castFrom<dynamic, double>(json['coordinates']);
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['address'] = address;
    _data['coordinates'] = coordinates;
    _data['_id'] = id;
    return _data;
  }
}

class Address {
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    required this.id,
  });
  late final String street;
  late final String city;
  late final String state;
  late final String country;
  late final String postalCode;
  late final String id;

  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postalCode'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['city'] = city;
    _data['state'] = state;
    _data['country'] = country;
    _data['postalCode'] = postalCode;
    _data['_id'] = id;
    return _data;
  }
}

class Receiver {
  Receiver({
    required this.name,
    required this.phone,
    required this.address,
    required this.customer,
    required this.id,
  });
  late final String name;
  late final String phone;
  late final Address address;
  late final String customer;
  late final String id;

  Receiver.fromJson(Map<String, dynamic> json){
    name = json['name'];
    phone = json['phone'];
    address = Address.fromJson(json['address']);
    customer = json['customer'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['phone'] = phone;
    _data['address'] = address.toJson();
    _data['customer'] = customer;
    _data['_id'] = id;
    return _data;
  }
}

class LoadDetail {
  LoadDetail({
    required this.load,
    required this.loadUnit,
    required this.loadType,
    required this.loadSize,
    required this.goodsImage,
    required this.description,
  });
  late final int load;
  late final String loadUnit;
  late final String loadType;
  late final LoadSize loadSize;
  late final List<String> goodsImage;
  late final String description;

  LoadDetail.fromJson(Map<String, dynamic> json){
    load = json['load'];
    loadUnit = json['loadUnit'];
    loadType = json['loadType'];
    loadSize = LoadSize.fromJson(json['loadSize']);
    goodsImage = List.castFrom<dynamic, String>(json['goodsImage']);
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['load'] = load;
    _data['loadUnit'] = loadUnit;
    _data['loadType'] = loadType;
    _data['loadSize'] = loadSize.toJson();
    _data['goodsImage'] = goodsImage;
    _data['description'] = description;
    return _data;
  }
}

class LoadSize {
  LoadSize({
    required this.length,
    required this.width,
    required this.height,
  });
  late final int length;
  late final int width;
  late final int height;

  LoadSize.fromJson(Map<String, dynamic> json){
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['length'] = length;
    _data['width'] = width;
    _data['height'] = height;
    return _data;
  }
}

class Vehicle {
  Vehicle({
    required this.vehicleType,
    required this.capacity,
    required this.quantity,
    required this.length,
    required this.tyreType,
    required this.capacityUnit,
    required this.quantityAccepted,
    required this.width,
    required this.height,
  });
  late final String vehicleType;
  late final int capacity;
  late final int quantity;
  late final int length;
  late final String tyreType;
  late final String capacityUnit;
  late final int quantityAccepted;
  late final int width;
  late final int height;

  Vehicle.fromJson(Map<String, dynamic> json){
    vehicleType = json['vehicleType'];
    capacity = json['capacity'];
    quantity = json['quantity'];
    length = json['length'];
    tyreType = json['tyreType'];
    capacityUnit = json['capacityUnit'];
    quantityAccepted = json['quantityAccepted'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vehicleType'] = vehicleType;
    _data['capacity'] = capacity;
    _data['quantity'] = quantity;
    _data['length'] = length;
    _data['tyreType'] = tyreType;
    _data['capacityUnit'] = capacityUnit;
    _data['quantityAccepted'] = quantityAccepted;
    _data['width'] = width;
    _data['height'] = height;
    return _data;
  }
}

class AdvancePayment {
  AdvancePayment({
    required this.ratio,
    required this.payBy,
    required this.customer,
    required this.mode,
  });
  late final int ratio;
  late final String payBy;
  late final String customer;
  late final String mode;

  AdvancePayment.fromJson(Map<String, dynamic> json){
    ratio = json['ratio'];
    payBy = json['payBy'];
    customer = json['customer'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ratio'] = ratio;
    _data['payBy'] = payBy;
    _data['customer'] = customer;
    _data['mode'] = mode;
    return _data;
  }
}

class DeliveryPayment {
  DeliveryPayment({
    required this.ratio,
    required this.payBy,
    required this.customer,
    required this.mode,
  });
  late final int ratio;
  late final String payBy;
  late final String customer;
  late final String mode;

  DeliveryPayment.fromJson(Map<String, dynamic> json){
    ratio = json['ratio'];
    payBy = json['payBy'];
    customer = json['customer'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ratio'] = ratio;
    _data['payBy'] = payBy;
    _data['customer'] = customer;
    _data['mode'] = mode;
    return _data;
  }
}

class Payload {
  Payload();

  Payload.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}