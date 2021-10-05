import 'package:flutter/material.dart';

class SecondaryScreen extends StatefulWidget {
  const SecondaryScreen({Key? key}) : super(key: key);

  @override
  _SecondaryScreenState createState() => _SecondaryScreenState();
}

class _SecondaryScreenState extends State<SecondaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secondary Screen"),
      ),
      body: const Center(child: Text("This is the New Screen"))
    );
  }
}
