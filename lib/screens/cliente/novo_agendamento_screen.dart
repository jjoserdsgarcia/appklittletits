import 'package:appklittletits/screens/funcionario/horarios_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NovoAgendamentoScreen extends StatefulWidget {
  const NovoAgendamentoScreen({
    super.key,
  });

  @override
  State<NovoAgendamentoScreen> createState() => _NovoAgendamentoScreenState();
}

class _NovoAgendamentoScreenState extends State<NovoAgendamentoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Agendamento"),
      ),
    );
  }
}
