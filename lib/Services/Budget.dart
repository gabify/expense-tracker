class Budget {
  int? _id;
  double _total = 0.0;
  double _needs = 0.0;
  double _wants = 0.0;
  double _savings = 0.0;
  String _created_at = '';

  Budget(int? id, double total, String created_at){
    _id = id;
    _total = total;
    _needs = total * 0.5;
    _wants = total * 0.3;
    _savings = savings * 0.2;
    _created_at = created_at;

  }

  void addBudget(double total, String created_at){
    _total = total;
    _needs = total * 0.5;
    _wants = total * 0.3;
    _savings = total * 0.2;
    _created_at = created_at;
  }

  Map<String, dynamic> toMap(){
    return {
      'total' : _total,
      'created_at' : _created_at,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> budget){
    return Budget(
      budget['id'], budget['total'], budget['created_at']
    );
  }

  double get total => _total;
  double get needs => _needs;
  double get wants => _wants;
  double get savings => _savings;
  String get created_at => _created_at;

}