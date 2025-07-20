import 'package:expense_tracker/Services/BudgetProvider.dart';
import 'package:expense_tracker/Services/InAppNotifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({super.key});

  @override
  State<BudgetCard> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final budget = context.watch<BudgetProvider>().budget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
    Card(
    color: Colors.teal[100],
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'As of ${DateFormat('MMMM yyyy').format(DateTime.now())}',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.read<BudgetProvider>().formatCurrency(budget.total),
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Your budget for this month',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Some text to add later'),
                ElevatedButton(
                  onPressed: () async{
                    final result = await showDialog(
                        context: context,
                        builder : (BuildContext context){
                          return InAppNotifier(
                              title: const Text('Edit your budget:'),
                              content: TextField(
                                controller: _controller,
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                decoration: const InputDecoration(
                                    hintText: "Enter new budget"
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.teal
                                      ),
                                    )
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, _controller);
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                          color: Colors.teal
                                      ),
                                    )
                                )
                              ],
                          );
                        }
                    );

                    if(result != null && result.value.text.isNotEmpty){
                      context.read<BudgetProvider>().addBudget(
                          double.parse(result.value.text.trim()),
                          DateTime.now().toIso8601String()
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.vertical(
                              top: Radius.circular(7),
                              bottom: Radius.circular(7)
                          )
                      )
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.create),
                      SizedBox(width: 4.8,),
                      Text('Edit Budget')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  ]);
  }
}
