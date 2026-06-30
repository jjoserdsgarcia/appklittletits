import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAgendaScreen extends StatefulWidget {
  final String dia;

  final String barbeiro;

  final String horario;

  const MyAgendaScreen({
    super.key,

    required this.dia,

    required this.barbeiro,

    required this.horario,
    required String servico,
  });

  @override
  State<MyAgendaScreen> createState() => _MyAgendaScreenState();
}

class _MyAgendaScreenState extends State<MyAgendaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9CB8B),

      appBar: AppBar(
        backgroundColor: const Color(0xff4E492F),

        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        title: Text(
          "MEUS AGENDAMENTOS",

          style: GoogleFonts.spaceMono(
            color: Colors.white,

            fontWeight: FontWeight.bold,

            letterSpacing: 2,
          ),
        ),
      ),

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF5EDBE),

                  Color(0xffCDBB79),
                ],

                begin: Alignment.topCenter,

                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "HISTÓRICO DE RESERVAS",

                  style: GoogleFonts.spaceMono(
                    fontWeight: FontWeight.bold,

                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    color: const Color(0xffF8F1C7),

                    borderRadius: BorderRadius.circular(25),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),

                        blurRadius: 18,

                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 30,

                            backgroundColor: Color(0xffD6CC8F),

                            child: Icon(
                              Icons.event,

                              color: Color(0xff4E492F),
                            ),
                          ),

                          const SizedBox(width: 15),

                          Text(
                            "AGENDAMENTO",

                            style: GoogleFonts.spaceMono(
                              fontWeight: FontWeight.bold,

                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      _linha(
                        Icons.calendar_month,

                        "Dia",

                        widget.dia,
                      ),

                      _linha(
                        Icons.person,

                        "Barbeiro",

                        widget.barbeiro,
                      ),

                      _linha(
                        Icons.access_time,

                        "Horário",

                        widget.horario,
                      ),

                      const SizedBox(height: 20),

                      Container(
                        width: double.infinity,

                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(.15),

                          borderRadius: BorderRadius.circular(15),

                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),

                        child: const Center(
                          child: Text(
                            "CONFIRMADO",

                            style: TextStyle(
                              color: Colors.green,

                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: const Color(0xffF8F1C7),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,

                        color: Color(0xff4E492F),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          "Seu horário ficará reservado até o atendimento.",

                          style: GoogleFonts.spaceMono(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _linha(
    IconData icon,

    String titulo,

    String valor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: Row(
        children: [
          Icon(
            icon,

            color: const Color(0xff4E492F),
          ),

          const SizedBox(width: 12),

          Text(
            "$titulo:",

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 8),

          Text(valor),
        ],
      ),
    );
  }
}
