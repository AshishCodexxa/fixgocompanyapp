class GetBidAgaintsPostResponseModel {
  GetBidAgaintsPostResponseModel({
    required this.success,
    required this.data,
    required this.message,
    required this.payload,
  });
  late final bool success;
  late final List<Data> data;
  late final String message;
  late final Payload payload;

  GetBidAgaintsPostResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    message = json['message'];
    payload = Payload.fromJson(json['payload']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    _data['payload'] = payload.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.customer,
    required this.post,
    required this.status,
    required this.cancellationReason,
    required this.bidAmount,
    required this.paidAmount,
    required this.isDeleted,
    required this.isArchived,
    required this.advance,
    required this.delivery,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final Customer customer;
  late final String post;
  late final String status;
  late final String cancellationReason;
  late final int bidAmount;
  late final int paidAmount;
  late final bool isDeleted;
  late final bool isArchived;
  late final Advance advance;
  late final Delivery delivery;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    customer = Customer.fromJson(json['customer']);
    post = json['post'];
    status = json['status'];
    cancellationReason = json['cancellationReason'];
    bidAmount = json['bidAmount'];
    paidAmount = json['paidAmount'];
    isDeleted = json['isDeleted'];
    isArchived = json['isArchived'];
    advance = Advance.fromJson(json['advance']);
    delivery = Delivery.fromJson(json['delivery']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['customer'] = customer.toJson();
    _data['post'] = post;
    _data['status'] = status;
    _data['cancellationReason'] = cancellationReason;
    _data['bidAmount'] = bidAmount;
    _data['paidAmount'] = paidAmount;
    _data['isDeleted'] = isDeleted;
    _data['isArchived'] = isArchived;
    _data['advance'] = advance.toJson();
    _data['delivery'] = delivery.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['v'] = V;
    return _data;
  }
}

class Customer {
  Customer({
    required this.rating,
    required this.id,
    required this.phone,
    required this.name,
  });
  late final Rating rating;
  late final String id;
  late final String phone;
  late final String name;

  Customer.fromJson(Map<String, dynamic> json){
    rating = Rating.fromJson(json['rating']);
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rating'] = rating.toJson();
    _data['id'] = id;
    _data['phone'] = phone;
    _data['name'] = name;
    return _data;
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.total,
  });
  late final int rate;
  late final int total;

  Rating.fromJson(Map<String, dynamic> json){
    rate = json['rate'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rate'] = rate;
    _data['total'] = total;
    return _data;
  }
}

class Advance {
  Advance({
    required this.ratio,
    required this.mode,
    required this.amount,
    required this.cashPaymentInitiated,
    required this.paid,
    required this.payBy,
    required this.customer,
    required this.id,
  });
  late final int ratio;
  late final String mode;
  late final int amount;
  late final bool cashPaymentInitiated;
  late final bool paid;
  late final String payBy;
  late final String customer;
  late final String id;

  Advance.fromJson(Map<String, dynamic> json){
    ratio = json['ratio'];
    mode = json['mode'];
    amount = json['amount'];
    cashPaymentInitiated = json['cashPaymentInitiated'];
    paid = json['paid'];
    payBy = json['payBy'];
    customer = json['customer'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ratio'] = ratio;
    _data['mode'] = mode;
    _data['amount'] = amount;
    _data['cashPaymentInitiated'] = cashPaymentInitiated;
    _data['paid'] = paid;
    _data['payBy'] = payBy;
    _data['customer'] = customer;
    _data['id'] = id;
    return _data;
  }
}

class Delivery {
  Delivery({
    required this.ratio,
    required this.mode,
    required this.amount,
    required this.cashPaymentInitiated,
    required this.paid,
    required this.payBy,
    required this.customer,
    required this.id,
  });
  late final int ratio;
  late final String mode;
  late final int amount;
  late final bool cashPaymentInitiated;
  late final bool paid;
  late final String payBy;
  late final String customer;
  late final String id;

  Delivery.fromJson(Map<String, dynamic> json){
    ratio = json['ratio'];
    mode = json['mode'];
    amount = json['amount'];
    cashPaymentInitiated = json['cashPaymentInitiated'];
    paid = json['paid'];
    payBy = json['payBy'];
    customer = json['customer'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ratio'] = ratio;
    _data['mode'] = mode;
    _data['amount'] = amount;
    _data['cashPaymentInitiated'] = cashPaymentInitiated;
    _data['paid'] = paid;
    _data['payBy'] = payBy;
    _data['customer'] = customer;
    _data['id'] = id;
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