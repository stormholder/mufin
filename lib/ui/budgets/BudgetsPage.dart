import 'package:flutter/material.dart';

class BudgetsPage extends StatefulWidget {
  const BudgetsPage({Key? key}) : super(key: key);

  final String title = "Budgets";

  @override
  State<StatefulWidget> createState() => _BudgetsState();
}

class _BudgetsState extends State<BudgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'This is the budgets page',
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}