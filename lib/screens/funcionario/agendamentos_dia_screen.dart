import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Agendamento {
  final String cliente;
  final String servico;
  final String horario;
  final String status;

  Agendamento({
    required this.cliente,
    required this.servico,
    required this.horario,
    required this.status,
  });
}

class AgendamentosDiaScreen extends StatefulWidget {
  const AgendamentosDiaScreen({super.key});

  @override
  State<AgendamentosDiaScreen> createState() =>
      _AgendamentosDiaScreenState();
}

class _AgendamentosDiaScreenState
    extends State<AgendamentosDiaScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  late Timer _timer;
  DateTime now = DateTime.now();

  String filtro = '';

  final List<Agendamento> agendamentos = [
    Agendamento(
      cliente: 'João Silva',
      servico: 'Corte Masculino',
      horario: '09:00',
      status: 'Localizado',
    ),
    Agendamento(
      cliente: 'Maria Souza',
      servico: 'Manicure',
      horario: '10:30',
      status: 'Em Trânsito',
    ),
    Agendamento(
      cliente: 'Carlos Lima',
      servico: 'Barba',
      horario: '14:00',
      status: 'Extraído',
    ),
    Agendamento(
      cliente: 'Ana Costa',
      servico: 'Escova',
      horario: '15:30',
      status: 'Perdido',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        setState(() {
          now = DateTime.now();
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Color statusColor(String status) {
    switch (status) {
      case 'Extraído':
        return Colors.greenAccent;
      case 'Em Trânsito':
        return Colors.orangeAccent;
      case 'Perdido':
        return Colors.redAccent;
      default:
        return Colors.lightBlueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hora =
        DateFormat('HH:mm:ss').format(now);

    final data =
        DateFormat('dd/MM/yyyy').format(now);

    final lista = agendamentos.where((item) {
      return item.cliente
          .toLowerCase()
          .contains(filtro.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFE5DBA8),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF5F583B),
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text("Novo Registro"),
      ),

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF5EDBE),
                  Color(0xFFE5DBA8),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F1C7),
                    borderRadius:
                        BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(.15),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "BACKROOMS • LEVEL 0",
                        style: GoogleFonts.spaceMono(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          color:
                              const Color(0xFF423D2A),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        hora,
                        style:
                            GoogleFonts.spaceMono(
                          fontSize: 28,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),

                      Text(
                        data,
                        style:
                            GoogleFonts.spaceMono(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          "REGISTROS",
                          agendamentos.length
                              .toString(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoCard(
                          "ATIVOS",
                          lista.length.toString(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: TextField(
                    controller:
                        _searchController,
                    onChanged: (v) {
                      setState(() {
                        filtro = v;
                      });
                    },
                    decoration:
                        InputDecoration(
                      hintText:
                          "Procurar entidade...",
                      prefixIcon:
                          const Icon(Icons.search),
                      filled: true,
                      fillColor:
                          const Color(0xFFF8F1C7),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                18),
                        borderSide:
                            BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: lista.length,
                    itemBuilder:
                        (context, index) {
                      final item =
                          lista[index];

                      return TweenAnimationBuilder(
                        duration:
                            Duration(
                          milliseconds:
                              300 +
                                  (index * 100),
                        ),
                        tween: Tween(
                          begin: 30.0,
                          end: 0.0,
                        ),
                        builder:
                            (_, value, child) {
                          return Transform
                              .translate(
                            offset: Offset(
                                0, value),
                            child: child,
                          );
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(
                            bottom: 14,
                          ),
                          decoration:
                              BoxDecoration(
                            color:
                                const Color(
                                    0xFFF8F1C7),
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors
                                    .black
                                    .withOpacity(
                                        .12),
                                blurRadius: 14,
                                offset:
                                    const Offset(
                                        0, 8),
                              )
                            ],
                          ),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets
                                    .all(18),

                            leading:
                                CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  const Color(
                                      0xFFD6CC8F),
                              child: Text(
                                item.cliente[0],
                                style:
                                    const TextStyle(
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            title: Text(
                              item.cliente,
                              style:
                                  GoogleFonts
                                      .spaceMono(
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            subtitle: Padding(
                              padding:
                                  const EdgeInsets
                                      .only(
                                          top: 8),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                      item.servico),
                                  const SizedBox(
                                      height: 4),
                                  Text(
                                    'Horário: ${item.horario}',
                                  ),
                                ],
                              ),
                            ),

                            trailing:
                                Container(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration:
                                  BoxDecoration(
                                color:
                                    statusColor(
                                            item
                                                .status)
                                        .withOpacity(
                                            .12),
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            30),
                                border:
                                    Border.all(
                                  color:
                                      statusColor(
                                          item
                                              .status),
                                ),
                              ),
                              child: Text(
                                item.status,
                                style:
                                    TextStyle(
                                  color:
                                      statusColor(
                                          item
                                              .status),
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            onTap: () {
                              showModalBottomSheet(
                                context:
                                    context,
                                backgroundColor:
                                    const Color(
                                        0xFFF8F1C7),
                                shape:
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .vertical(
                                    top: Radius
                                        .circular(
                                            30),
                                  ),
                                ),
                                builder: (_) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets
                                            .all(
                                            24),
                                    child:
                                        Column(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min,
                                      children: [
                                        Text(
                                          item
                                              .cliente,
                                          style:
                                              GoogleFonts.spaceMono(
                                            fontSize:
                                                22,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                                20),
                                        ListTile(
                                          leading:
                                              const Icon(
                                            Icons
                                                .content_cut,
                                          ),
                                          title:
                                              Text(
                                            item
                                                .servico,
                                          ),
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(
                                            Icons
                                                .schedule,
                                          ),
                                          title:
                                              Text(
                                            item
                                                .horario,
                                          ),
                                        ),
                                        ListTile(
                                          leading:
                                              const Icon(
                                            Icons
                                                .flag,
                                          ),
                                          title:
                                              Text(
                                            item
                                                .status,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(
    String titulo,
    String valor,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F1C7),
        borderRadius:
            BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.12),
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: GoogleFonts.spaceMono(
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            valor,
            style: GoogleFonts.spaceMono(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}