import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Project"), centerTitle: true),
      body: Column(
        children: [
          Center(child: Text('data')),
          Center(child: Text("Abdullah Al Shakibdd")),

          Center(child: Text('data')),
          Center(child: Text("Abdullah Al Shakibdd")),
          Text('ASAP'),
          Text("shakib"),
          Center(child: Text('data')),
          Center(child: Text("Abdullah Al Shakibdd")),
          Text('ASAP'),
          Text("shakib"),

          Row(children: []),
        ],
      ),
    );
  }
}
