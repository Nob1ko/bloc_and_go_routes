import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  // Define a state variable for the counter
  int _counter = 0;

  // Method to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'DISCOVER',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'Counter: $_counter',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          CupertinoButton(
            color: CupertinoColors.activeBlue,
            onPressed: () => context.push('/a/detail'),
            child: Text('Increment Counter'),
          ),
        ],
      ),
    );
  }
}
