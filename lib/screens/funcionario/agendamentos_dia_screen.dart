// ===============================================================
// IMPORTAÇÕES
// ===============================================================

// Biblioteca utilizada para trabalhar com temporizadores (Timer).
import 'dart:async';

// Biblioteca principal do Flutter, responsável pelos widgets da interface.
import 'package:flutter/material.dart';

// Biblioteca que permite utilizar fontes do Google no aplicativo.
import 'package:google_fonts/google_fonts.dart';

// Biblioteca utilizada para formatar datas e horários.
import 'package:intl/intl.dart';


// ===============================================================
// CLASSE MODELO
// ===============================================================

// Classe que representa um agendamento.
//
// Cada objeto dessa classe armazena as informações
// de um único registro exibido na tela.
class Agendamento {

  // Nome do cliente.
  final String cliente;

  // Serviço solicitado pelo cliente.
  final String servico;

  // Horário do agendamento.
  final String horario;

  // Situação atual do agendamento.
  final String status;

  // Construtor da classe.
  //
  // O "required" obriga que todos os campos sejam
  // informados ao criar um Agendamento.
  Agendamento({
    required this.cliente,
    required this.servico,
    required this.horario,
    required this.status,
  });
}


// ===============================================================
// TELA PRINCIPAL
// ===============================================================

// Tela responsável por exibir todos os agendamentos do dia.
//
// Como existem atualizações em tempo real (relógio,
// pesquisa etc.), ela utiliza StatefulWidget.
class AgendamentosDiaScreen extends StatefulWidget {
  const AgendamentosDiaScreen({super.key});

  @override
  State<AgendamentosDiaScreen> createState() =>
      _AgendamentosDiaScreenState();
}


// ===============================================================
// ESTADO DA TELA
// ===============================================================

// Classe onde ficam todas as variáveis, métodos
// e construção da interface.
class _AgendamentosDiaScreenState
    extends State<AgendamentosDiaScreen> {

  // Controlador responsável por capturar e controlar
  // o texto digitado na barra de pesquisa.
  final TextEditingController _searchController =
      TextEditingController();

  // Timer utilizado para atualizar o relógio da tela
  // a cada segundo.
  late Timer _timer;

  // Guarda o horário atual.
  // Será atualizado constantemente pelo Timer.
  DateTime now = DateTime.now();

  // Texto utilizado para filtrar os clientes.
  String filtro = '';



  // ===============================================================
  // DADOS DE EXEMPLO
  // ===============================================================
  //
  // Lista de agendamentos exibidos na tela.
  // Em um sistema real, esses dados normalmente
  // viriam de um banco de dados ou API.
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



  // ===============================================================
  // INITSTATE
  // ===============================================================
  //
  // Executado apenas uma vez quando a tela é criada.
  @override
  void initState() {
    super.initState();

    // Cria um Timer que será executado a cada 1 segundo.
    //
    // O objetivo é atualizar o relógio exibido na tela.
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {

        // Atualiza a interface.
        setState(() {

          // Armazena o horário atual.
          now = DateTime.now();
        });
      },
    );
  }



  // ===============================================================
  // DISPOSE
  // ===============================================================
  //
  // Executado quando a tela é destruída.
  //
  // Aqui liberamos recursos para evitar vazamento de memória.
  @override
  void dispose() {

    // Encerra o Timer.
    _timer.cancel();

    // Libera o controlador do campo de pesquisa.
    _searchController.dispose();

    super.dispose();
  }



  // ===============================================================
  // COR DO STATUS
  // ===============================================================
  //
  // Retorna uma cor diferente dependendo do status
  // do agendamento.
  Color statusColor(String status) {

    switch (status) {

      // Status finalizado.
      case 'Extraído':
        return Colors.greenAccent;

      // Cliente está chegando.
      case 'Em Trânsito':
        return Colors.orangeAccent;

      // Problema ocorrido.
      case 'Perdido':
        return Colors.redAccent;

      // Qualquer outro status.
      default:
        return Colors.lightBlueAccent;
    }
  }


  // ===============================================================
  // BUILD
  // ===============================================================
  //
  // Método responsável por construir toda a interface da tela.
  // Sempre que setState() é chamado, este método é executado novamente.
  @override
  Widget build(BuildContext context) {

    // Formata a hora atual no formato 24 horas.
    final hora =
        DateFormat('HH:mm:ss').format(now);

    // Formata a data atual.
    final data =
        DateFormat('dd/MM/yyyy').format(now);

    // Cria uma nova lista contendo apenas os clientes
    // que correspondem ao texto digitado na pesquisa.
    final lista = agendamentos.where((item) {

      return item.cliente
          .toLowerCase()
          .contains(filtro.toLowerCase());

    }).toList();

    // Scaffold é a estrutura principal da tela.
    return Scaffold(

      // Cor de fundo principal.
      backgroundColor: const Color(0xFFE5DBA8),

      // ===========================================================
      // BOTÃO FLUTUANTE
      // ===========================================================
      //
      // Botão localizado no canto inferior direito.
      floatingActionButton: FloatingActionButton.extended(

        backgroundColor: const Color(0xFF5F583B),

        // Será executado quando o botão for pressionado.
        onPressed: () {},

        // Ícone do botão.
        icon: const Icon(Icons.add),

        // Texto exibido ao lado do ícone.
        label: const Text("Novo Registro"),
      ),

      // ===========================================================
      // CORPO DA TELA
      // ===========================================================
      body: Stack(

        children: [

          // =======================================================
          // FUNDO COM GRADIENTE
          // =======================================================
          //
          // Primeiro widget da pilha.
          // Serve apenas como plano de fundo.
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

          // =======================================================
          // SAFE AREA
          // =======================================================
          //
          // Evita que o conteúdo fique escondido
          // atrás da barra de status do celular.
          SafeArea(

            child: Column(

              children: [

                // =================================================
                // CARD SUPERIOR
                // =================================================
                //
                // Exibe título, relógio e data.
                Container(

                  margin: const EdgeInsets.all(16),

                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(

                    color: const Color(0xFFF8F1C7),

                    borderRadius:
                        BorderRadius.circular(24),

                    // Sombra do card.
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

                      // Título da tela.
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

                      // Relógio atualizado em tempo real.
                      Text(

                        hora,

                        style:
                            GoogleFonts.spaceMono(

                          fontSize: 28,

                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),

                      // Data atual.
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

                // =================================================
                // CARDS DE INFORMAÇÕES
                // =================================================
                //
                // Mostram a quantidade total de registros
                // e a quantidade encontrada pela pesquisa.
                Padding(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  child: Row(

                    children: [

                      // Card de registros totais.
                      Expanded(

                        child: _infoCard(

                          "REGISTROS",

                          agendamentos.length
                              .toString(),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Card de registros encontrados.
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

                // =================================================
                // CAMPO DE PESQUISA
                // =================================================
                //
                // Permite pesquisar clientes pelo nome.
                Padding(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),

                  child: TextField(

                    // Controlador do campo.
                    controller:
                        _searchController,

                    // Sempre que o usuário digita,
                    // atualiza o filtro.
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
                            BorderRadius.circular(18),

                        borderSide:
                            BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // =================================================
                // LISTA DE AGENDAMENTOS
                // =================================================
                //
                // O Expanded ocupa todo o espaço restante
                // da tela.
                Expanded(

                  child: ListView.builder(

                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),

                    // Quantidade de itens exibidos.
                    itemCount: lista.length,

                    // Cada posição da lista será construída
                    // automaticamente conforme necessário.
                    itemBuilder:
                        (context, index) {

                      // Obtém o agendamento correspondente.
                      final item =
                          lista[index];


                                            // ===================================================
                      // ANIMAÇÃO DE ENTRADA DOS CARDS
                      // ===================================================
                      //
                      // Cada item da lista aparece deslizando de baixo
                      // para cima quando é construído.
                      return TweenAnimationBuilder(

                        // Duração da animação.
                        //
                        // Cada item demora um pouco mais que o anterior,
                        // criando um efeito em cascata.
                        duration:
                            Duration(
                          milliseconds:
                              300 +
                                  (index * 100),
                        ),

                        // A animação começa em 30 pixels abaixo
                        // da posição final.
                        tween: Tween(
                          begin: 30.0,
                          end: 0.0,
                        ),

                        builder:
                            (_, value, child) {

                          // Move o widget durante a animação.
                          return Transform.translate(

                            offset: Offset(
                                0, value),

                            child: child,
                          );
                        },

                        // =================================================
                        // CARD DO AGENDAMENTO
                        // =================================================
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
                                BorderRadius.circular(
                                    22),

                            // Sombra do card.
                            boxShadow: [

                              BoxShadow(

                                color: Colors.black
                                    .withOpacity(.12),

                                blurRadius: 14,

                                offset:
                                    const Offset(0, 8),
                              )
                            ],
                          ),

                          // =================================================
                          // LISTTILE
                          // =================================================
                          //
                          // Widget que organiza automaticamente
                          // avatar, título, subtítulo e botão lateral.
                          child: ListTile(

                            contentPadding:
                                const EdgeInsets.all(18),

                            // =============================================
                            // AVATAR
                            // =============================================
                            //
                            // Exibe a primeira letra do cliente.
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
                                      FontWeight.bold,
                                ),
                              ),
                            ),

                            // =============================================
                            // NOME DO CLIENTE
                            // =============================================
                            title: Text(

                              item.cliente,

                              style:
                                  GoogleFonts.spaceMono(

                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            // =============================================
                            // SUBTÍTULO
                            // =============================================
                            //
                            // Exibe serviço e horário.
                            subtitle: Padding(

                              padding:
                                  const EdgeInsets.only(
                                      top: 8),

                              child: Column(

                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  // Serviço realizado.
                                  Text(
                                      item.servico),

                                  const SizedBox(
                                      height: 4),

                                  // Horário do atendimento.
                                  Text(
                                    'Horário: ${item.horario}',
                                  ),
                                ],
                              ),
                            ),

                            // =============================================
                            // STATUS
                            // =============================================
                            //
                            // Mostra o status com uma cor diferente
                            // para facilitar a identificação.
                            trailing:
                                Container(

                              padding:
                                  const EdgeInsets.symmetric(

                                horizontal: 12,

                                vertical: 8,
                              ),

                              decoration:
                                  BoxDecoration(

                                color:
                                    statusColor(
                                            item.status)
                                        .withOpacity(.12),

                                borderRadius:
                                    BorderRadius.circular(
                                        30),

                                border:
                                    Border.all(

                                  color:
                                      statusColor(
                                          item.status),
                                ),
                              ),

                              child: Text(

                                item.status,

                                style:
                                    TextStyle(

                                  color:
                                      statusColor(
                                          item.status),

                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),

                            // =============================================
                            // AO TOCAR NO CARD
                            // =============================================
                            //
                            // Abre um BottomSheet contendo mais
                            // informações do agendamento.
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
                                      BorderRadius.vertical(

                                    top: Radius.circular(
                                        30),
                                  ),
                                ),

                                builder: (_) {

                                  // Conteúdo do BottomSheet.
                                  return Padding(

                                    padding:
                                        const EdgeInsets.all(
                                            24),

                                    child:
                                        Column(

                                      // Faz o BottomSheet ocupar
                                      // apenas o espaço necessário.
                                      mainAxisSize:
                                          MainAxisSize.min,

                                      children: [

                                        // Nome do cliente.
                                        Text(

                                          item.cliente,

                                          style:
                                              GoogleFonts.spaceMono(

                                            fontSize: 22,

                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(
                                            height: 20),

                                        // Serviço.
                                        ListTile(

                                          leading:
                                              const Icon(
                                            Icons.content_cut,
                                          ),

                                          title:
                                              Text(
                                            item.servico,
                                          ),
                                        ),

                                        // Horário.
                                        ListTile(

                                          leading:
                                              const Icon(
                                            Icons.schedule,
                                          ),

                                          title:
                                              Text(
                                            item.horario,
                                          ),
                                        ),

                                        // Status.
                                        ListTile(

                                          leading:
                                              const Icon(
                                            Icons.flag,
                                          ),

                                          title:
                                              Text(
                                            item.status,
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

  // ===============================================================
  // CARD DE INFORMAÇÕES
  // ===============================================================
  //
  // Método responsável por criar os pequenos cards exibidos
  // abaixo do relógio (REGISTROS e ATIVOS).
  //
  // Criar um método separado evita repetição de código.
  Widget _infoCard(
    String titulo,
    String valor,
  ) {

    return Container(

      // Espaçamento interno do card.
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        // Cor de fundo do card.
        color: const Color(0xFFF8F1C7),

        // Cantos arredondados.
        borderRadius:
            BorderRadius.circular(20),

        // Sombra para dar profundidade.
        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.12),

            blurRadius: 12,
          )
        ],
      ),

      // Organiza os textos verticalmente.
      child: Column(

        children: [

          // =======================================================
          // TÍTULO DO CARD
          // =======================================================
          //
          // Exemplo:
          // REGISTROS
          // ATIVOS
          Text(

            titulo,

            style: GoogleFonts.spaceMono(

              fontSize: 12,

              // Espaçamento entre as letras.
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 8),

          // =======================================================
          // VALOR DO CARD
          // =======================================================
          //
          // Exemplo:
          // 15
          // 4
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

// ===============================================================
// FIM DO ARQUIVO
// ===============================================================
//
// Fluxo geral da tela:
//
// 1. A tela é criada (initState).
// 2. Um Timer atualiza o relógio a cada segundo.
// 3. O build() monta toda a interface.
// 4. A pesquisa filtra os clientes em tempo real.
// 5. A lista exibe os agendamentos.
// 6. Cada card possui animação de entrada.
// 7. Ao tocar em um card, abre um BottomSheet
//    com os detalhes do agendamento.
// 8. Ao fechar a tela, dispose() cancela o Timer
//    e libera o TextEditingController.
//
// Todo o funcionamento permanece exatamente igual;
// apenas foram adicionados comentários para facilitar
// o entendimento do código.