import 'package:expense_track/history.dart';

import 'package:flutter/material.dart';
import 'class.dart';






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'expense tracker',
      theme: ThemeData(

      ),
      home: MyHomePage(title: "expense tracker"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Expense> expenseList = [];
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final titleController = TextEditingController();
  final categoryController = TextEditingController();
  final noteController = TextEditingController();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack( children: [Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/money.png'), // Path to your image
                  fit: BoxFit.cover,
                  opacity: 0.4// Cover the entire screen
              ),
            )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage(expenseList: expenseList)));
              }, icon: Icon(Icons.history),
                iconSize: 45,),
            ],
          ),
          Center(
            child: Container(
              width: 200,
              child: Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextField(controller: amountController,
                    decoration: InputDecoration(labelText: 'Amount',
                      prefixIcon: Icon(Icons.abc_sharp),
                      filled: true,
                      fillColor: Colors.tealAccent[10],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),),
                    keyboardType: TextInputType.number,

                  ),
                  TextField(controller: dateController, decoration: InputDecoration(labelText: 'Date',
                      prefixIcon: Icon(Icons.abc_sharp),
                      filled: true,
                      fillColor: Colors.tealAccent[10],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      )),
                    keyboardType: TextInputType.datetime,),
                  TextField(controller: titleController, decoration: InputDecoration(labelText: 'Title',
                      prefixIcon: Icon(Icons.abc_sharp),
                      filled: true,
                      fillColor: Colors.tealAccent[10],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      )),
                  ),
                  TextField(controller: categoryController, decoration: InputDecoration(labelText: 'Category',
                      prefixIcon: Icon(Icons.abc_sharp),
                      filled: true,
                      fillColor: Colors.tealAccent[10],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  TextField(controller: noteController, decoration: InputDecoration(labelText: 'Note',
                      prefixIcon: Icon(Icons.abc_sharp),
                      filled: true,
                      fillColor: Colors.tealAccent[10],
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ))),
                  ElevatedButton(
                    onPressed: () {
                      Expense newExpense = Expense(
                        amount: amountController.text,
                        date: dateController.text,
                        title: titleController.text,
                        category: categoryController.text,
                        note: noteController.text,
                      );

                      setState(() {
                        expenseList.add(newExpense);
                      });


                      amountController.clear();
                      dateController.clear();
                      titleController.clear();
                      categoryController.clear();
                      noteController.clear();
                    },
                    child: Text("Add Expense"),

                  ),




                ],

              ),
            ),
          )

        ])
    );
  }
}
