import 'package:flutter/material.dart';

class TumbalPage extends StatefulWidget {
  const TumbalPage({super.key});

  @override
  State<TumbalPage> createState() => _TumbalPageState();
}

class _TumbalPageState extends State<TumbalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: Icon(Icons.arrow_back), 
        title: Text('Cek Ongkir'),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
