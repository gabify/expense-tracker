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
  String? _category = 'Needs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
        
                  SizedBox(height: 30,),
        
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Transaction Name',
                      hintText: 'Ex. Electric Bill',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)
                      ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 2
                            )

                        ),
                        errorStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                        ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return '*Please provide a name for your transaction';
                      }

                      return null;
                    },
                    onSaved: (value) => _name,
                  ),

                  SizedBox(height: 25,),
        
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Transaction Cost',
                        hintText: '1,000.00',
                        prefixText: '₱ ',
                        prefixStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2
                          )

                        ),
                        errorStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),
                        filled: true,
                        fillColor: Colors.grey[300],
                        floatingLabelBehavior: FloatingLabelBehavior.never
                    ),
                    validator: (value){
                      if(value == null || value.trim().isEmpty){
                        return '*Please provide a cost for your transaction.';
                      }

                      String costValue = value.trim();

                      try{
                        double cost = double.parse(costValue);

                        if(cost <= 0){
                          return '*Cost must be greater than 0.';
                        }

                        return null;
                      }catch(e){
                        return '*Only numeric values are allowed.';
                      }
                    },
                    onSaved: (value){
                      _cost = double.parse(value!);
                    },
                  ),

                  SizedBox(height: 25,),

                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Transaction Description',
                      hintText: 'Ex. Payment for Electricity',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          )

                      ),
                      errorStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 12),
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return '*Please provide description for your transaction';
                      }

                      return null;
                    },
                    onSaved: (value) => _description,
                  ),

                  SizedBox(height: 25,),

                  Text(
                    'Why are you making this transaction?',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 10,),

                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Its essential to my daily life.'),
                        titleTextStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]
                        ),
                        minTileHeight: 10,
                        leading: Radio<String>(
                          value: 'Needs',
                          groupValue: _category,
                          activeColor: Colors.teal,
                          onChanged: (String? value){
                            setState(() => _category = value);
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Its for comfort or enjoyment.'),
                        titleTextStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[800]
                        ),
                        minTileHeight: 10,
                        leading: Radio<String>(
                          value: 'Wants',
                          groupValue: _category,
                          activeColor: Colors.teal,
                          onChanged: (String? value){
                            setState(() => _category = value);
                          },
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 35,),
        
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();

                              Expenses expense = Expenses(
                                name: _name,
                                description: _description,
                                cost: _cost,
                                category: _category
                              );

                              print(expense);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[800],
                            minimumSize: Size(10, 50)
                          ),
                          child: Text(
                            'Save Transaction',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                        ),
                      ]
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
