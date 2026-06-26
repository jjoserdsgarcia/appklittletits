import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeEmployeeScreen extends StatefulWidget {
  const HomeEmployeeScreen({super.key});

  @override
  State<HomeEmployeeScreen> createState() => _HomeEmployeeScreenState();
}

class _HomeEmployeeScreenState extends State<HomeEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LateralMenu(),
      appBar: AppBar(),
    );
  }
}
