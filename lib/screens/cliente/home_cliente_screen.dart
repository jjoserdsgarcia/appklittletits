import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeClientScreen extends StatefulWidget {
  const HomeClientScreen({super.key});

  @override
  State<HomeClientScreen> createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home do Cliente"),
      ),
      body: LateralMenu(),
    );
  }
}
