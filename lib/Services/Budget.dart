class Budget {
  double _total = 0.0;
  double _needs = 0.0;
  double _wants = 0.0;
  double _savings = 0.0;


  void addBudget(double total){
    _total = total;
    _needs = total * 0.5;
    _wants = total * 0.3;
    _savings = total * 0.2;
  }

  double get total => _total;
  double get needs => _needs;
  double get wants => _wants;
  double get savings => _savings;

}