import 'package:appklittletits/screens/cliente/meus_agendamentos_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableAgenda extends StatefulWidget {
  const AvailableAgenda({
    super.key,
  });

  @override
  State<AvailableAgenda> createState() => _AvailableAgendaState();
}

class _AvailableAgendaState extends State<AvailableAgenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horários disponíveis"),
      ),
    );
  }
}
