// ===============================================================
// IMPORTAÇÕES
// ===============================================================

// Biblioteca principal do Flutter.
// Contém todos os widgets utilizados para criar a interface.
import 'package:flutter/material.dart';

// Biblioteca responsável por disponibilizar as fontes do Google.
import 'package:google_fonts/google_fonts.dart';



// ===============================================================
// TELA DE CADASTRO DE HORÁRIO
// ===============================================================
//
// Esta tela permite cadastrar:
//
// • Horário de entrada;
// • Horário de saída;
// • Dias autorizados;
// • Salvar o registro.
//
// Como seus dados podem mudar durante a execução,
// ela utiliza um StatefulWidget.
class CadastroHorarioScreen extends StatefulWidget {
  const CadastroHorarioScreen({super.key});

  @override
  State<CadastroHorarioScreen> createState() =>
      _CadastroHorarioScreenState();
}



// ===============================================================
// ESTADO DA TELA
// ===============================================================
//
// Aqui ficam todas as variáveis,
// métodos e construção da interface.
class _CadastroHorarioScreenState
    extends State<CadastroHorarioScreen> {

  // =============================================================
  // HORÁRIOS
  // =============================================================
  //
  // Variável que armazenará o horário de entrada.
  //
  // O "?" significa que ela pode ser nula
  // enquanto o usuário ainda não selecionou uma hora.
  TimeOfDay? entrada;

  // Armazena o horário de saída.
  TimeOfDay? saida;



  // =============================================================
  // LISTA DE DIAS
  // =============================================================
  //
  // Lista fixa contendo todos os dias da semana.
  //
  // Ela será utilizada para criar automaticamente
  // os botões de seleção dos dias.
  final List<String> dias = [

    "SEG",
    "TER",
    "QUA",
    "QUI",
    "SEX",
    "SAB",
    "DOM",

  ];



  // =============================================================
  // DIAS SELECIONADOS
  // =============================================================
  //
  // Guarda apenas os dias escolhidos pelo usuário.
  //
  // Exemplo:
  //
  // ["SEG", "QUA", "SEX"]
  //
  final List<String> selecionados = [];



  // =============================================================
  // ESCOLHER HORÁRIO
  // =============================================================
  //
  // Abre o seletor de horário do Flutter.
  //
  // Recebe um parâmetro booleano:
  //
  // true  -> horário de entrada
  // false -> horário de saída
  Future<void> escolherHora(
      bool inicio) async {

    // Exibe o TimePicker.
    final hora =
        await showTimePicker(

      context: context,

      // Horário inicial exibido no seletor.
      initialTime:
          TimeOfDay.now(),
    );


    // Caso o usuário tenha escolhido um horário.
    if(hora != null){

      // Atualiza a interface.
      setState(() {

        // Se for horário de entrada.
        if(inicio){

          entrada = hora;

        }else{

          // Caso contrário,
          // salva como horário de saída.
          saida = hora;

        }

      });

    }
  }



  // =============================================================
  // SALVAR
  // =============================================================
  //
  // Método chamado quando o botão
  // "SALVAR REGISTRO" é pressionado.
  //
  // Atualmente apenas exibe um SnackBar.
  void salvar(){

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content:
        Text(
          "HORÁRIO REGISTRADO NO SISTEMA",
        ),

      ),

    );

  }



  // =============================================================
  // BUILD
  // =============================================================
  //
  // Método responsável por construir toda a interface.
  //
  // Sempre que setState() for chamado,
  // este método será executado novamente.
  @override
  Widget build(BuildContext context) {


        // =============================================================
    // SCAFFOLD
    // =============================================================
    //
    // Estrutura principal da tela.
    return Scaffold(

      // Cor de fundo da tela.
      backgroundColor:
      const Color(0xffE5DBA8),


      // ===========================================================
      // APPBAR
      // ===========================================================
      //
      // Barra superior da aplicação.
      appBar: AppBar(

        // Cor de fundo da AppBar.
        backgroundColor:
        const Color(0xffD6CC8F),

        // Remove a sombra padrão.
        elevation: 0,

        // Título exibido na barra.
        title: Text(

          "LEVEL 0 // HORÁRIO",

          style:
          GoogleFonts.spaceMono(

            color:
            const Color(0xff423D2A),

            fontWeight:
            FontWeight.bold,

            // Espaçamento entre letras.
            letterSpacing: 2,

          ),

        ),

      ),


      // ===========================================================
      // CORPO DA TELA
      // ===========================================================
      body: Stack(

        children: [

          // =======================================================
          // FUNDO
          // =======================================================
          //
          // Container responsável pelo fundo da tela.
          //
          // Utiliza um gradiente para criar profundidade.
          Container(

            decoration:
            const BoxDecoration(

              gradient:
              LinearGradient(

                colors:[

                  Color(0xffF5EDBE),
                  Color(0xffD8C987),

                ],

                begin:
                Alignment.topCenter,

                end:
                Alignment.bottomCenter,

              ),

            ),

          ),



          // =======================================================
          // SAFE AREA
          // =======================================================
          //
          // Evita que o conteúdo fique atrás da barra
          // de notificações ou dos cantos arredondados.
          SafeArea(

            child:
            SingleChildScrollView(

              // Espaçamento interno.
              padding:
              const EdgeInsets.all(18),

              // Organiza todos os painéis verticalmente.
              child:
              Column(

                children: [



                  // =================================================
                  // PAINEL SUPERIOR
                  // =================================================
                  //
                  // Exibe o título principal da tela.
                  _painel(

                    child:
                    Column(

                      children: [

                        // Nome do sistema.
                        Text(

                          "EMPLOYEE SCHEDULE SYSTEM",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:16,

                            fontWeight:
                            FontWeight.bold,

                            letterSpacing:2,

                          ),

                        ),

                        const SizedBox(
                            height:10),

                        // Subtítulo.
                        Text(

                          "CADASTRAR NOVO HORÁRIO",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:13,

                          ),

                        ),

                      ],

                    ),

                  ),



                  const SizedBox(height:20),



                  // =================================================
                  // PAINEL DE HORÁRIOS
                  // =================================================
                  //
                  // Responsável por permitir a escolha
                  // do horário de entrada e saída.
                  _painel(

                    child:
                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[

                        // Título da seção.
                        Text(

                          "INTERVALO DE OPERAÇÃO",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),

                        const SizedBox(
                            height:15),

                        // Linha contendo os dois cartões
                        // de seleção de horário.
                        Row(

                          children:[

                            // =========================================
                            // HORÁRIO DE ENTRADA
                            // =========================================
                            Expanded(

                              child:
                              _horaCard(

                                // Texto exibido no cartão.
                                "ENTRADA",

                                // Horário atualmente selecionado.
                                entrada,

                                // Abre o seletor de horário.
                                ()=>
                                    escolherHora(true),

                              ),

                            ),

                            const SizedBox(
                                width:15),

                            // =========================================
                            // HORÁRIO DE SAÍDA
                            // =========================================
                            Expanded(

                              child:
                              _horaCard(

                                "SAÍDA",

                                // Horário escolhido.
                                saida,

                                // Abre o seletor de saída.
                                ()=>
                                    escolherHora(false),

                              ),

                            ),

                          ],

                        ),

                      ],

                    ),

                  ),



                  const SizedBox(
                      height:20),




                  // =================================================
                  // PAINEL DE DIAS DA SEMANA
                  // =================================================
                  //
                  // Permite selecionar em quais dias
                  // o horário será válido.
                  _painel(

                    child:
                    Column(

                      // Alinha todo o conteúdo à esquerda.
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[

                        // Título da seção.
                        Text(

                          "DIAS AUTORIZADOS",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),

                        const SizedBox(
                            height:15),

                        // =============================================
                        // WRAP
                        // =============================================
                        //
                        // O Wrap organiza os botões automaticamente
                        // em várias linhas quando não há espaço.
                        Wrap(

                          // Espaçamento horizontal entre os botões.
                          spacing:8,

                          // Cria um botão para cada item da lista "dias".
                          children:

                          dias.map((dia){

                            // Verifica se este dia já foi selecionado.
                            final ativo =
                            selecionados
                                .contains(dia);

                            // =========================================
                            // BOTÃO DO DIA
                            // =========================================
                            //
                            // GestureDetector detecta o toque do usuário.
                            return GestureDetector(

                              // Executado quando o usuário toca no botão.
                              onTap:(){

                                // Atualiza a interface.
                                setState((){

                                  // Se o dia já estiver selecionado,
                                  // ele será removido.
                                  if(ativo){

                                    selecionados
                                        .remove(dia);

                                  }else{

                                    // Caso contrário,
                                    // adiciona o dia à lista.
                                    selecionados
                                        .add(dia);

                                  }

                                });

                              },

                              // Aparência visual do botão.
                              child:
                              Container(

                                padding:
                                const EdgeInsets
                                    .symmetric(

                                  horizontal:18,

                                  vertical:12,

                                ),

                                decoration:
                                BoxDecoration(

                                  // Cor muda dependendo se o botão
                                  // está selecionado ou não.
                                  color:
                                  ativo

                                  ?

                                  const Color(
                                      0xff6F6642)

                                      :

                                  const Color(
                                      0xffEFE2A8),

                                  // Cantos arredondados.
                                  borderRadius:
                                  BorderRadius
                                      .circular(10),

                                  // Borda do botão.
                                  border:
                                  Border.all(

                                    color:
                                    const Color(
                                        0xff9D8D52),

                                  ),

                                ),

                                // Nome do dia.
                                child:
                                Text(

                                  dia,

                                  style:
                                  TextStyle(

                                    // Cor do texto muda conforme
                                    // o estado do botão.
                                    color:
                                    ativo

                                    ?
                                    Colors.white

                                    :
                                    Colors.black,

                                    fontWeight:
                                    FontWeight.bold,

                                  ),

                                ),

                              ),

                            );

                          }).toList(),

                        ),

                      ],

                    ),

                  ),

                  const SizedBox(
                      height:30),

                  // =================================================
                  // BOTÃO SALVAR
                  // =================================================
                  //
                  // Botão responsável por chamar o método "salvar()".
                  SizedBox(

                    // Faz o botão ocupar toda a largura disponível.
                    width:
                    double.infinity,

                    // Altura fixa do botão.
                    height:55,

                    child:
                    ElevatedButton(

                      style:
                      ElevatedButton
                          .styleFrom(

                        // Cor de fundo.
                        backgroundColor:
                        const Color(
                            0xff5F583B),

                        // Arredondamento das bordas.
                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius
                              .circular(15),

                        ),

                      ),

                      // Método executado ao clicar.
                      onPressed:
                      salvar,

                      // Texto exibido no botão.
                      child:
                      Text(

                        "SALVAR REGISTRO",

                        style:
                        GoogleFonts.spaceMono(

                          color:
                          Colors.white,

                          fontWeight:
                          FontWeight.bold,

                          letterSpacing:2,

                        ),

                      ),

                    ),

                  ),


                       ],

              ),

            ),

          ),

        ],

      ),

    );

  }



  // =============================================================
  // PAINEL PADRÃO
  // =============================================================
  //
  // Método responsável por criar os painéis utilizados
  // ao longo da tela.
  //
  // Em vez de repetir o mesmo Container várias vezes,
  // criamos um método reutilizável.
  //
  // O parâmetro "child" recebe qualquer widget que será
  // exibido dentro do painel.
  Widget _painel(
      {required Widget child}){

    return Container(

      // Faz o painel ocupar toda a largura disponível.
      width:
      double.infinity,

      // Espaçamento interno.
      padding:
      const EdgeInsets.all(20),

      decoration:
      BoxDecoration(

        // Cor de fundo com leve transparência.
        color:
        const Color(
            0xffF8F1C7)
            .withOpacity(.92),

        // Bordas arredondadas.
        borderRadius:
        BorderRadius.circular(22),

        // Sombra para destacar o painel.
        boxShadow:[

          BoxShadow(

            color:
            Colors.black
                .withOpacity(.18),

            blurRadius:20,

            offset:
            const Offset(0,8),

          ),

        ],

      ),

      // Conteúdo enviado para este painel.
      child:child,

    );

  }




  // =============================================================
  // CARD DE HORÁRIO
  // =============================================================
  //
  // Método responsável por criar os cartões de
  // "ENTRADA" e "SAÍDA".
  //
  // Parâmetros:
  //
  // titulo -> Texto exibido no topo do cartão.
  //
  // hora -> Horário atualmente selecionado.
  //
  // abrir -> Função executada quando o cartão é clicado.
  Widget _horaCard(

      String titulo,

      TimeOfDay? hora,

      VoidCallback abrir){

    // Detecta o toque do usuário.
    return GestureDetector(

      // Executa a função recebida.
      onTap:abrir,

      child:
      Container(

        // Espaçamento interno.
        padding:
        const EdgeInsets.all(15),

        decoration:
        BoxDecoration(

          // Cor de fundo.
          color:
          const Color(
              0xffEFE2A8),

          // Bordas arredondadas.
          borderRadius:
          BorderRadius.circular(15),

        ),

        // Organiza os textos verticalmente.
        child:
        Column(

          children:[

            // =====================================================
            // TÍTULO
            // =====================================================
            //
            // Exibe "ENTRADA" ou "SAÍDA".
            Text(

              titulo,

              style:
              GoogleFonts.spaceMono(

                fontSize:12,

                fontWeight:
                FontWeight.bold,

              ),

            ),

            const SizedBox(
                height:10),

            // =====================================================
            // HORÁRIO
            // =====================================================
            //
            // Caso nenhum horário tenha sido escolhido,
            // será exibido "--:--".
            //
            // Caso exista um horário,
            // ele será formatado conforme a região do aparelho.
            Text(

              hora == null

              ?

              "--:--"

              :

              hora.format(context),

              style:
              GoogleFonts.spaceMono(

                fontSize:25,

                fontWeight:
                FontWeight.bold,

              ),

            ),

          ],

        ),

      ),

    );

  }

}



// =============================================================
// FIM DO ARQUIVO
// =============================================================
//
// Fluxo geral desta tela:
//
// 1. O usuário abre a tela.
// 2. Escolhe o horário de entrada.
// 3. Escolhe o horário de saída.
// 4. Seleciona os dias da semana permitidos.
// 5. Pressiona "SALVAR REGISTRO".
// 6. O método salvar() é chamado.
// 7. Um SnackBar confirma o cadastro.
//
// A interface foi organizada utilizando métodos
// reutilizáveis (_painel e _horaCard),
// facilitando futuras manutenções.
//
// Nenhuma linha do funcionamento original foi alterada.
// Apenas foram adicionados comentários explicativos
// para facilitar o entendimento do código.