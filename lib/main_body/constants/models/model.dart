class Transaction {
  bool? status;
  String? message;
  List<Data>? data;
  Meta? meta;

  Transaction({this.status, this.message, this.data, this.meta});

  Transaction.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) { data!.add(new Data.fromJson(v)); });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? domain;
  String? status;
  String? reference;
  int? amount;
  Null? message;
  String? gatewayResponse;
  String? paidAt;
  String? createdAt;
  String? channel;
  String? currency;
  String? ipAddress;
  Metadata? metadata;
  Null? timeline;
  Customer? customer;
  Authorization? authorization;
  Plan? plan;
  int? requestedAmount;
  Null? log;
  int? fees;
  String? ppaidAt;
  String? ccreatedAt;

  Data({this.id, this.domain, this.status, this.reference, this.amount, this.message, this.gatewayResponse, this.paidAt, this.createdAt, this.channel, this.currency, this.ipAddress, this.metadata, this.timeline, this.customer, this.authorization, this.plan, this.requestedAmount, this.log, this.fees, this.ppaidAt, this.ccreatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    status = json['status'];
    reference = json['reference'];
    amount = json['amount'];
    message = json['message'];
    gatewayResponse = json['gateway_response'];
    paidAt = json['paid_at'];
    createdAt = json['created_at'];
    channel = json['channel'];
    currency = json['currency'];
    ipAddress = json['ip_address'];
    metadata = json['metadata'] is Map<String, dynamic> ? Metadata.fromJson(json['metadata']) : null;
    timeline = json['timeline'];
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']as Map<String, dynamic>) : null;
    authorization = json['authorization'] != null ? new Authorization.fromJson(json['authorization']as Map<String, dynamic>) : null;
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    requestedAmount = json['requested_amount'];
    log = json['log'];
    fees = json['fees'];
    paidAt = json['paidAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['status'] = this.status;
    data['reference'] = this.reference;
    data['amount'] = this.amount;
    data['message'] = this.message;
    data['gateway_response'] = this.gatewayResponse;
    data['paid_at'] = this.paidAt;
    data['created_at'] = this.createdAt;
    data['channel'] = this.channel;
    data['currency'] = this.currency;
    data['ip_address'] = this.ipAddress;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['timeline'] = this.timeline;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.authorization != null) {
      data['authorization'] = this.authorization!.toJson();
    }
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    data['requested_amount'] = this.requestedAmount;
    data['log'] = this.log;
    data['fees'] = this.fees;
    data['paidAt'] = this.paidAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Metadata {
  List<CustomFields>? customFields;

  Metadata({this.customFields});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json['custom_fields'] != null) {
      customFields = <CustomFields>[];
      json['custom_fields'].forEach((v) { customFields!.add(new CustomFields.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customFields != null) {
      data['custom_fields'] = this.customFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomFields {
  String? displayName;
  String? variableName;
  String? value;

  CustomFields({this.displayName, this.variableName, this.value});

  CustomFields.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    variableName = json['variable_name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['variable_name'] = this.variableName;
    data['value'] = this.value;
    return data;
  }
}

class Customer {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  Null? metadata;
  String? customerCode;
  int? id;
  String? riskAction;

  Customer({this.firstName, this.lastName, this.email, this.phone, this.metadata, this.customerCode, this.id, this.riskAction});

  Customer.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    metadata = json['metadata'];
    customerCode = json['customer_code'];
    id = json['id'];
    riskAction = json['risk_action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['metadata'] = this.metadata;
    data['customer_code'] = this.customerCode;
    data['id'] = this.id;
    data['risk_action'] = this.riskAction;
    return data;
  }
}

class Authorization {
  String? authorizationCode;
  String? bin;
  String? last4;
  String? expMonth;
  String? expYear;
  String? cardType;
  String? bank;
  String? countryCode;
  String? brand;
  String? accountName;

  Authorization({this.authorizationCode, this.bin, this.last4, this.expMonth, this.expYear, this.cardType, this.bank, this.countryCode, this.brand, this.accountName});

  Authorization.fromJson(Map<String, dynamic> json) {
    authorizationCode = json['authorization_code'];
    bin = json['bin'];
    last4 = json['last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    cardType = json['card_type'];
    bank = json['bank'];
    countryCode = json['country_code'];
    brand = json['brand'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_code'] = this.authorizationCode;
    data['bin'] = this.bin;
    data['last4'] = this.last4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['card_type'] = this.cardType;
    data['bank'] = this.bank;
    data['country_code'] = this.countryCode;
    data['brand'] = this.brand;
    data['account_name'] = this.accountName;
    return data;
  }
}

class Plan {


  Plan();

Plan.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
return data;
}
}

class Meta {
int? total;
int? skipped;
int? perPage;
int? page;
int? pageCount;

Meta({this.total, this.skipped, this.perPage, this.page, this.pageCount});

Meta.fromJson(Map<String, dynamic> json) {
total = json['total'];
skipped = json['skipped'];
perPage = json['perPage'];
page = json['page'];
pageCount = json['pageCount'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['total'] = this.total;
data['skipped'] = this.skipped;
data['perPage'] = this.perPage;
data['page'] = this.page;
data['pageCount'] = this.pageCount;
return data;
}
}
