class Savings{
  int? id;
  final double amount;
  final String date;

  Savings({this.id, required this.amount, required this.date});

  factory Savings.fromMap(Map<String, dynamic> savings){
    return Savings(amount: savings['total'] * 0.2, date: savings['created_at']);
  }
}