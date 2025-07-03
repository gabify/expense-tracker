import 'package:expense_tracker/Expenses/expenses.dart';
import 'package:flutter/material.dart';

class Addexpense extends StatefulWidget {
  const Addexpense({super.key});

  @override
  State<Addexpense> createState() => _AddexpenseState();
}

class _AddexpenseState extends State<Addexpense> {

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  double _cost = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Transaction',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8
                  ),
                ),
                Text(
                  'Some text I would like to add later on for aesthetic',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey[800]
                  ),
                ),

                SizedBox(height: 25,),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Transaction Name',
                    hintText: 'Ex. Electric Bill',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                    floatingLabelBehavior: FloatingLabelBehavior.never
                  ),
                ),

                SizedBox(height: 25,),

                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Transaction Description',
                      hintText: 'Ex. Payment for Electricity',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      floatingLabelBehavior: FloatingLabelBehavior.never
                  ),
                ),

                SizedBox(height: 25,),

                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Transaction Cost',
                      hintText: 'Ex. 1,000.00',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      floatingLabelBehavior: FloatingLabelBehavior.never
                  ),
                ),

                SizedBox(height: 25,),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            print('The form is Validated');
                          }
                        },
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[300]
                        ),
                      ),
                    ]
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
