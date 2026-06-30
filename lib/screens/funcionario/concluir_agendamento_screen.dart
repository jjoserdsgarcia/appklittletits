// ===============================================================
// IMPORTAÇÕES
// ===============================================================

// Biblioteca principal do Flutter.
// Contém todos os widgets utilizados na interface.
import 'package:flutter/material.dart';

// Biblioteca utilizada para aplicar fontes do Google.
import 'package:google_fonts/google_fonts.dart';



// ===============================================================
// TELA DE CONCLUSÃO DE AGENDAMENTO
// ===============================================================
//
// Tela responsável por finalizar um atendimento,
// confirmar o pagamento e calcular a comissão.
class ConcluirAgendamentoScreen extends StatefulWidget {

  const ConcluirAgendamentoScreen({
    super.key,
  });

  @override
  State<ConcluirAgendamentoScreen> createState() =>
      _ConcluirAgendamentoScreenState();

}



// ===============================================================
// ESTADO DA TELA
// ===============================================================
//
// Nesta classe ficam armazenadas todas as variáveis,
// métodos e widgets utilizados pela tela.
class _ConcluirAgendamentoScreenState
    extends State<ConcluirAgendamentoScreen> {

  // =============================================================
  // CONTROLADOR DAS OBSERVAÇÕES
  // =============================================================
  //
  // Responsável por armazenar o texto digitado
  // no campo de observações.
  final observacaoController =
      TextEditingController();


  // =============================================================
  // CONFIRMAÇÃO DO PAGAMENTO
  // =============================================================
  //
  // Indica se o pagamento foi confirmado.
  bool pagamentoConfirmado = false;


  // =============================================================
  // FORMA DE PAGAMENTO
  // =============================================================
  //
  // Guarda a forma de pagamento escolhida
  // pelo usuário.
  String formaPagamento = "PIX";


  // =============================================================
  // DADOS DO SERVIÇO
  // =============================================================
  //
  // Valor cobrado pelo serviço.
  final double valorServico = 45.00;

  // Percentual de comissão do funcionário.
  final double porcentagemComissao = 0.20;



  // =============================================================
  // GETTER DA COMISSÃO
  // =============================================================
  //
  // Calcula automaticamente a comissão
  // sempre que ela for utilizada.
  double get comissao =>
      valorServico * porcentagemComissao;




  // =============================================================
  // FINALIZAR ATENDIMENTO
  // =============================================================
  //
  // Método executado ao pressionar o botão
  // "CONCLUIR ATENDIMENTO".
  void finalizar(){

    // Verifica se o pagamento foi confirmado.
    if(!pagamentoConfirmado){

      // Caso não tenha sido confirmado,
      // exibe uma mensagem ao usuário.
      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
          Text(
            "CONFIRME O PAGAMENTO ANTES",
          ),
        ),

      );

      // Encerra o método para impedir
      // a finalização do atendimento.
      return;

    }


    // ===========================================================
    // JANELA DE CONFIRMAÇÃO
    // ===========================================================
    //
    // Exibida quando o atendimento
    // é finalizado com sucesso.
    showDialog(

      context: context,

      builder:(context)=>AlertDialog(

        // Cor de fundo da janela.
        backgroundColor:
        const Color(0xffF8F1C7),

        // Título da janela.
        title:
        Text(

          "ATENDIMENTO FINALIZADO",

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

          ),

        ),

        // Conteúdo exibido dentro da janela.
        content:
        Text(

          "Comissão gerada:\n"
          "R\$ ${comissao.toStringAsFixed(2)}",

          style:
          GoogleFonts.spaceMono(),

        ),

        // Botões da janela.
        actions:[

          TextButton(

            // Fecha o AlertDialog.
            onPressed:(){

              Navigator.pop(context);

            },

            child:
            const Text(
                "OK"),

          )

        ],

      ),

    );

  }



  // =============================================================
  // BUILD
  // =============================================================
  //
  // Método responsável por construir
  // toda a interface da tela.
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


        // Remove a sombra da AppBar.
        elevation:0,


        // Título exibido na barra superior.
        title:
        Text(

          "LEVEL 0 // FINALIZAÇÃO",

          style:
          GoogleFonts.spaceMono(

            // Cor do texto.
            color:
            const Color(0xff423D2A),

            // Texto em negrito.
            fontWeight:
            FontWeight.bold,

            // Espaçamento entre as letras.
            letterSpacing:2,

          ),

        ),


      ),






      // ===========================================================
      // CORPO DA TELA
      // ===========================================================
      body:
      Stack(

        children:[



          // =======================================================
          // FUNDO DA TELA
          // =======================================================
          //
          // Container responsável pelo gradiente
          // utilizado como fundo.
          Container(

            decoration:
            const BoxDecoration(

              gradient:
              LinearGradient(

                colors:[

                  Color(0xffF5EDBE),
                  Color(0xffD8C987),

                ],

              ),

            ),

          ),






          // =======================================================
          // SAFE AREA
          // =======================================================
          //
          // Evita que o conteúdo fique atrás
          // da barra de status do aparelho.
          SafeArea(

            child:
            SingleChildScrollView(

              // Espaçamento interno da tela.
              padding:
              const EdgeInsets.all(18),

              // Organiza todos os painéis verticalmente.
              child:
              Column(

                children:[






                  // =================================================
                  // PAINEL DO CLIENTE
                  // =================================================
                  //
                  // Exibe as informações principais
                  // do atendimento.
                  _painel(

                    Column(

                      children:[


                        // Nome do sistema.
                        Text(

                          "SERVICE COMPLETION TERMINAL",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:15,

                            fontWeight:
                            FontWeight.bold,

                            letterSpacing:2,

                          ),

                        ),



                        // Espaçamento entre o título
                        // e o nome do cliente.
                        const SizedBox(
                            height:15),




                        // Identificação do campo.
                        Text(

                          "CLIENTE",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:12,

                          ),

                        ),



                        // Espaçamento.
                        const SizedBox(
                            height:5),




                        // Nome do cliente.
                        Text(

                          "Maria Souza",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:22,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),



                      ],

                    ),

                  ),







                  // Espaçamento entre os painéis.
                  const SizedBox(
                      height:18),







                  // =================================================
                  // PAINEL DE DADOS DO SERVIÇO
                  // =================================================
                  //
                  // Exibe o serviço realizado,
                  // duração e valor.
                  _painel(

                    Column(

                      children:[



                        // Linha contendo o serviço realizado.
                        _linha(

                          Icons.content_cut,

                          "Serviço",

                          "Corte + Barba",

                        ),




                        // Linha com a duração do atendimento.
                        _linha(

                          Icons.timer,

                          "Duração",

                          "45 minutos",

                        ),






                        // Linha exibindo o valor do serviço.
                        _linha(

                          Icons.attach_money,

                          "Valor",

                          "R\$ 45,00",

                        ),




                      ],

                    ),

                  ),







                  // Espaçamento antes do painel
                  // de pagamento.
                  const SizedBox(
                      height:18),








                                    // =================================================
                  // PAINEL DE PAGAMENTO
                  // =================================================
                  //
                  // Permite selecionar a forma de pagamento
                  // e confirmar que ele foi realizado.
                  _painel(

                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[



                        // Título da seção.
                        Text(

                          "FORMA DE PAGAMENTO",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),



                        // Espaçamento entre o título
                        // e o campo de seleção.
                        const SizedBox(
                            height:15),




                        // Lista suspensa contendo
                        // as formas de pagamento.
                        DropdownButtonFormField<String>(

                          // Valor atualmente selecionado.
                          value:
                          formaPagamento,


                          decoration:
                          InputDecoration(

                            // Ativa a cor de fundo.
                            filled:true,

                            // Cor do campo.
                            fillColor:
                            const Color(
                                0xffEFE2A8),

                            // Remove a borda padrão.
                            border:
                            OutlineInputBorder(

                              borderRadius:
                              BorderRadius.circular(15),

                              borderSide:
                              BorderSide.none,

                            ),

                          ),

                          // Opções disponíveis.
                          items:[

                            "PIX",
                            "CARTÃO",
                            "DINHEIRO",

                          ].map((e){

                            return DropdownMenuItem(

                              value:e,

                              child:
                              Text(e),

                            );

                          }).toList(),

                          // Executado quando o usuário
                          // altera a forma de pagamento.
                          onChanged:(v){

                            setState((){

                              formaPagamento =
                                  v!;

                            });

                          },

                        ),




                        // Espaçamento antes do Switch.
                        const SizedBox(
                            height:15),




                        // Interruptor para confirmar
                        // que o pagamento foi realizado.
                        SwitchListTile(

                          // Estado atual do Switch.
                          value:
                          pagamentoConfirmado,

                          // Cor quando ativado.
                          activeColor:
                          const Color(
                              0xff5F583B),

                          // Texto exibido ao lado.
                          title:
                          Text(

                            "Pagamento confirmado",

                            style:
                            GoogleFonts.spaceMono(),

                          ),

                          // Atualiza o estado do Switch.
                          onChanged:(v){

                            setState((){

                              pagamentoConfirmado=v;

                            });

                          },

                        ),

                      ],

                    ),

                  ),






                  // Espaçamento antes do painel
                  // de observações.
                  const SizedBox(
                      height:18),








                  // =================================================
                  // PAINEL DE OBSERVAÇÕES
                  // =================================================
                  //
                  // Campo onde o funcionário pode
                  // registrar informações adicionais
                  // sobre o atendimento.
                  _painel(

                    TextField(

                      // Controlador responsável
                      // pelo texto digitado.
                      controller:
                      observacaoController,

                      // Permite até quatro linhas.
                      maxLines:4,

                      decoration:
                      InputDecoration(

                        // Texto exibido acima do campo.
                        labelText:
                        "Observações do atendimento",

                        // Ativa a cor de fundo.
                        filled:true,

                        // Cor do campo.
                        fillColor:
                        const Color(
                            0xffEFE2A8),

                        // Remove a borda padrão.
                        border:
                        OutlineInputBorder(

                          borderRadius:
                          BorderRadius.circular(15),

                          borderSide:
                          BorderSide.none,

                        ),

                      ),

                    ),

                  ),







                  // Espaçamento antes do botão.
                  const SizedBox(
                      height:30),








                  // =================================================
                  // BOTÃO FINALIZAR
                  // =================================================
                  //
                  // Executa o método finalizar()
                  // quando pressionado.
                  SizedBox(

                    // Faz o botão ocupar toda a largura.
                    width:
                    double.infinity,

                    // Altura fixa.
                    height:
                    55,

                    child:
                    ElevatedButton(

                      // Método executado ao clicar.
                      onPressed:
                      finalizar,

                      style:
                      ElevatedButton.styleFrom(

                        // Cor de fundo do botão.
                        backgroundColor:
                        const Color(
                            0xff5F583B),

                        // Bordas arredondadas.
                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(15),

                        ),

                      ),

                      // Texto exibido no botão.
                      child:
                      Text(

                        "CONCLUIR ATENDIMENTO",

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

                  )







                               ],

              ),

            ),

          )

        ],

      ),

    );

  }






  // =============================================================
  // MÉTODO _painel()
  // =============================================================
  //
  // Responsável por criar todos os painéis utilizados
  // na tela.
  //
  // Recebe qualquer Widget através do parâmetro "child"
  // para evitar repetição de código.
  Widget _painel(Widget child){

    return Container(

      // Faz o painel ocupar toda a largura disponível.
      width:
      double.infinity,

      // Espaçamento interno.
      padding:
      const EdgeInsets.all(20),

      decoration:
      BoxDecoration(

        // Cor de fundo do painel.
        color:
        const Color(
            0xffF8F1C7)
            .withOpacity(.93),

        // Bordas arredondadas.
        borderRadius:
        BorderRadius.circular(22),

        // Sombra para destacar o painel.
        boxShadow:[

          BoxShadow(

            color:
            Colors.black.withOpacity(.15),

            blurRadius:18,

            offset:
            const Offset(0,8),

          )

        ],

      ),

      // Conteúdo recebido pelo método.
      child:
      child,

    );

  }








  // =============================================================
  // MÉTODO _linha()
  // =============================================================
  //
  // Cria uma linha de informação contendo:
  //
  // • Ícone
  // • Título
  // • Valor
  //
  // Este método é reutilizado para mostrar
  // Serviço, Duração e Valor do atendimento.
  Widget _linha(

      IconData icon,

      String titulo,

      String valor,

      ){

    return Padding(

      // Espaçamento inferior entre as linhas.
      padding:
      const EdgeInsets.only(
          bottom:15),

      child:
      Row(

        children:[

          // Ícone representando a informação.
          Icon(
              icon),

          // Espaçamento entre o ícone e o texto.
          const SizedBox(
              width:15),

          // Título ocupa o espaço disponível.
          Expanded(

            child:
            Text(

              titulo,

              style:
              GoogleFonts.spaceMono(),

            ),

          ),

          // Valor correspondente ao título.
          Text(

            valor,

            style:
            GoogleFonts.spaceMono(

              fontWeight:
              FontWeight.bold,

            ),

          ),

        ],

      ),

    );

  }

}



// =============================================================
// FIM DO ARQUIVO
// =============================================================
//
// Fluxo desta tela:
//
// 1. O usuário visualiza os dados do atendimento.
// 2. Escolhe a forma de pagamento.
// 3. Confirma o pagamento pelo Switch.
// 4. Pode adicionar observações.
// 5. Pressiona "CONCLUIR ATENDIMENTO".
// 6. O método finalizar() verifica se o pagamento
//    foi confirmado.
// 7. Caso não esteja confirmado, um SnackBar é exibido.
// 8. Caso esteja confirmado, um AlertDialog informa
//    que o atendimento foi finalizado e mostra
//    a comissão gerada.
//
// Os métodos _painel() e _linha() foram criados
// para reutilizar componentes visuais e evitar
// repetição de código.
//
// Nenhuma linha do funcionamento original foi alterada.
// Apenas foram adicionados comentários explicativos
// para facilitar o entendimento do código.