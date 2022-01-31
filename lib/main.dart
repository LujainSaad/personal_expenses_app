import 'package:flutter/material.dart';
import '../widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            ),
          ),
        appBarTheme: const AppBarTheme(
           titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              ),
        )
      ),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget{

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
final List<Transaction> _userTransactions =[
    //  Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(String txTitle , double txAmount){
    final newTx = Transaction(   //creating new object to Transaction
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString()
     );

     setState(() {
       _userTransactions.add(newTx);
     });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(
      context: ctx, 
      builder: (_){
        return NewTransactions(_addNewTransaction);
    },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
        IconButton(
          onPressed: ()=> _startAddNewTransaction(context), 
          icon: Icon(Icons.add))
          ],
      ),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Container(
          width: double.infinity,
          child: Card( 
            color: Colors.blue,
           elevation: 3,),
        ),
        TransactionList(_userTransactions),
      ],
      )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> _startAddNewTransaction(context), 
          ),
    );
  }
}


        // TextButton(
        // child: Text('TextButton'),
        // style: TextButton.styleFrom(
        // primary: Colors.blue,
        // onSurface: Colors.grey,
        // ),
        // onPressed: ()=>{},
        // ),
        // ElevatedButton(
        // child: Text('ElevatedButton'),
        // style: TextButton.styleFrom(
        // primary: Colors.white,
        // backgroundColor: Colors.blue,
        // onSurface: Colors.grey,
        // ),
        // onPressed: ()=>{},
        // ),
        // OutlinedButton(
        // child: Text('OutlinedButton'),
        // style: TextButton.styleFrom(
        // primary: Colors.blue,
        // side: BorderSide(color: Colors.blue, width: 3),
        // onSurface: Colors.grey,
        // ),
        // onPressed: ()=>{},
        // ),