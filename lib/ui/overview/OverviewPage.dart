import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have clicked the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        )
    );
  }

}