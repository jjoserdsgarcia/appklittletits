import 'package:appklittletits/screens/cliente/horarios_screen.dart';
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
  String servicoSelecionado = "";

  final List<Map<String, dynamic>> servicos = [
    {
      "nome": "Corte Masculino",

      "descricao": "Corte tradicional e moderno",

      "preco": "R\$ 35",

      "icon": Icons.content_cut,
    },

    {
      "nome": "Corte + Barba",

      "descricao": "Corte completo com acabamento",

      "preco": "R\$ 60",

      "icon": Icons.face,
    },

    {
      "nome": "Barba",

      "descricao": "Modelagem profissional",

      "preco": "R\$ 30",

      "icon": Icons.person,
    },
  ];

  void continuar() {
    if (servicoSelecionado.isEmpty) {
      return;
    }

    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (_) => const AvailableAgenda(
          servico: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD9CB8B),

      appBar: AppBar(
        backgroundColor: const Color(0xff4E492F),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        title: Text(
          "NOVO AGENDAMENTO",

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
            padding: const EdgeInsets.all(18),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "ESCOLHA O SERVIÇO",

                  style: GoogleFonts.spaceMono(
                    fontWeight: FontWeight.bold,

                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: servicos.length,

                    itemBuilder: (context, index) {
                      final item = servicos[index];

                      bool selecionado = item["nome"] == servicoSelecionado;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            servicoSelecionado = item["nome"];
                          });
                        },

                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),

                          margin: const EdgeInsets.only(bottom: 15),

                          padding: const EdgeInsets.all(18),

                          decoration: BoxDecoration(
                            color: selecionado ? const Color(0xff4E492F) : const Color(0xffF8F1C7),

                            borderRadius: BorderRadius.circular(25),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.15),

                                blurRadius: 12,

                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 28,

                                backgroundColor: const Color(0xffD6CC8F),

                                child: Icon(
                                  item["icon"],

                                  color: const Color(0xff4E492F),
                                ),
                              ),

                              const SizedBox(width: 15),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      item["nome"],

                                      style: GoogleFonts.spaceMono(
                                        color: selecionado ? Colors.white : Colors.black,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      item["descricao"],

                                      style: TextStyle(
                                        color: selecionado ? Colors.white70 : Colors.black87,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      item["preco"],

                                      style: TextStyle(
                                        color: selecionado ? Colors.white : Colors.black,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton(
                    onPressed: servicoSelecionado.isEmpty ? null : continuar,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4E492F),

                      disabledBackgroundColor: Colors.grey,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    child: Text(
                      servicoSelecionado.isEmpty ? "ESCOLHA UM SERVIÇO" : "CONTINUAR",

                      style: const TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
