class TransactionTotal {
  bool? status;
  String? message;
  Data? data;

  TransactionTotal({this.status, this.message, this.data});

  TransactionTotal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalTransactions;
  int? uniqueCustomers;
  int? totalVolume;
  List<TotalVolumeByCurrency>? totalVolumeByCurrency;
  int? pendingTransfers;
  List? pendingTransfersByCurrency;

  Data(
      {this.totalTransactions,
        this.uniqueCustomers,
        this.totalVolume,
        this.totalVolumeByCurrency,
        this.pendingTransfers,
        this.pendingTransfersByCurrency});

  Data.fromJson(Map<String, dynamic> json) {
    totalTransactions = json['total_transactions'];
    uniqueCustomers = json['unique_customers'];
    totalVolume = json['total_volume'];
    if (json['total_volume_by_currency'] != null) {
      totalVolumeByCurrency = <TotalVolumeByCurrency>[];
      json['total_volume_by_currency'].forEach((v) {
        totalVolumeByCurrency!.add(new TotalVolumeByCurrency.fromJson(v));
      });
    }
    pendingTransfers = json['pending_transfers'];
    if (json['pending_transfers_by_currency'] != null) {
      pendingTransfersByCurrency = [];
      json['pending_transfers_by_currency'].forEach((v) {
        pendingTransfersByCurrency!
            .add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_transactions'] = this.totalTransactions;
    data['unique_customers'] = this.uniqueCustomers;
    data['total_volume'] = this.totalVolume;
    if (this.totalVolumeByCurrency != null) {
      data['total_volume_by_currency'] =
          this.totalVolumeByCurrency!.map((v) => v.toJson()).toList();
    }
    data['pending_transfers'] = this.pendingTransfers;
    if (this.pendingTransfersByCurrency != null) {
      data['pending_transfers_by_currency'] =
          this.pendingTransfersByCurrency!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalVolumeByCurrency {
  String? currency;
  int? amount;

  TotalVolumeByCurrency({this.currency, this.amount});

  TotalVolumeByCurrency.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    return data;
  }
}
