class Expenses{
  final int? id;
  final String name;
  final String description;
  final double cost;
  final String? category;

  Expenses({
    this.id,
    required this.name,
    required this.description,
    required this.cost,
    required this.category
  });

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'description' : description,
      'cost' : cost,
      'category' : category
    };
  }

  factory Expenses.fromMap(Map<String, dynamic> expense){
    return Expenses(
      id: expense['id'],
      name: expense['name'],
      description: expense['description'],
      cost: expense['cost'],
      category: expense['category']
    );
  }
}