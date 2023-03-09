class ListTransactions {
  final int id;
  final int amount;
  final String reference;
  final Map<String,dynamic> customer;
  
  const ListTransactions({
    required this.id,
    required this.amount,
    required this.reference,
    required this.customer
});
  
  factory ListTransactions.fromJson(Map<String, dynamic> json){
    return ListTransactions(id: json['id'], amount: json['amount'], reference: json['reference'], customer: json['customer']);
  }
}

