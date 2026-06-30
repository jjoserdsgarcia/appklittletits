// ===============================================================
// IMPORTAÇÕES
// ===============================================================

// Biblioteca principal do Flutter.
// Contém todos os widgets utilizados para criar a interface.
import 'package:flutter/material.dart';

// Biblioteca responsável por disponibilizar fontes do Google.
import 'package:google_fonts/google_fonts.dart';



// ===============================================================
// TELA DE COMISSÃO
// ===============================================================
//
// Tela responsável por exibir:
//
// • Comissão total;
// • Faturamento;
// • Quantidade de serviços;
// • Histórico de produção;
// • Seleção de período.
//
// Como existem informações que podem ser alteradas
// durante o uso da tela, utilizamos um StatefulWidget.
class ComissaoScreen extends StatefulWidget {
  const ComissaoScreen({super.key});

  @override
  State<ComissaoScreen> createState() =>
      _ComissaoScreenState();
}



// ===============================================================
// ESTADO DA TELA
// ===============================================================
//
// Nesta classe ficam todas as variáveis,
// métodos e construção da interface.
class _ComissaoScreenState
    extends State<ComissaoScreen> {

  // =============================================================
  // PERÍODO SELECIONADO
  // =============================================================
  //
  // Guarda qual período está atualmente selecionado.
  //
  // O valor inicial é "ESTE MÊS".
  String periodo = "ESTE MÊS";



  // =============================================================
  // HISTÓRICO DE PRODUÇÃO
  // =============================================================
  //
  // Lista contendo os serviços realizados.
  //
  // Cada item é um Map com:
  //
  // cliente
  // servico
  // valor
  // comissao
  // status
  //
  // Em um sistema real, essas informações
  // normalmente viriam de um banco de dados.
  final List<Map<String,dynamic>> historico = [

    {
      "cliente":"João Silva",
      "servico":"Corte Masculino",
      "valor":35.0,
      "comissao":7.0,
      "status":"PAGO"
    },

    {
      "cliente":"Maria Souza",
      "servico":"Manicure",
      "valor":45.0,
      "comissao":9.0,
      "status":"PAGO"
    },

    {
      "cliente":"Carlos Lima",
      "servico":"Barba",
      "valor":25.0,
      "comissao":5.0,
      "status":"PENDENTE"
    },

  ];



  // =============================================================
  // TOTAL DA COMISSÃO
  // =============================================================
  //
  // Percorre todo o histórico somando apenas
  // o valor das comissões.
  //
  // Retorna o valor total das comissões.
  double totalComissao(){

    // Variável acumuladora.
    double total = 0;

    // Percorre cada item da lista.
    for(var item in historico){

      // Soma a comissão do item atual.
      total += item["comissao"];

    }

    // Retorna o total calculado.
    return total;

  }



  // =============================================================
  // FATURAMENTO TOTAL
  // =============================================================
  //
  // Soma o valor de todas as vendas realizadas.
  //
  // Retorna o faturamento bruto.
  double faturamento(){

    // Variável acumuladora.
    double total = 0;

    // Percorre todos os registros.
    for(var item in historico){

      // Soma o valor da venda.
      total += item["valor"];

    }

    // Retorna o faturamento final.
    return total;

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


        // Remove a sombra padrão da AppBar.
        elevation:0,


        // Título exibido na barra superior.
        title:Text(

          "LEVEL 0 // COMISSÃO",

          style:
          GoogleFonts.spaceMono(

            // Cor do texto.
            color:
            const Color(0xff423D2A),

            // Deixa o texto em negrito.
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
      body:Stack(

        children:[



          // =======================================================
          // FUNDO DA TELA
          // =======================================================
          //
          // Container responsável pelo gradiente de fundo.
          Container(

            decoration:
            const BoxDecoration(

              gradient:
              LinearGradient(

                colors:[

                  Color(0xffF5EDBE),
                  Color(0xffD8C987),

                ],

                // Início do gradiente.
                begin:
                Alignment.topCenter,

                // Final do gradiente.
                end:
                Alignment.bottomCenter,

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

              // Organiza os widgets verticalmente.
              child:
              Column(

                children:[





                  // =================================================
                  // PAINEL PRINCIPAL
                  // =================================================
                  //
                  // Exibe o título do sistema
                  // e o valor total da comissão.
                  _painel(

                    Column(

                      children:[


                        // Nome do sistema.
                        Text(

                          "EMPLOYEE REWARD SYSTEM",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                            fontSize:16,

                            letterSpacing:2,

                          ),

                        ),


                                                // Texto indicando a seção da comissão.
                        const SizedBox(
                            height:12),



                        // Subtítulo do painel principal.
                        Text(

                          "COMISSÃO ATUAL",

                          style:
                          GoogleFonts.spaceMono(),

                        ),



                        // Espaçamento entre o subtítulo
                        // e o valor da comissão.
                        const SizedBox(
                            height:8),




                        // Exibe o valor total das comissões.
                        //
                        // O método totalComissao() soma todas
                        // as comissões presentes na lista.
                        Text(

                          "R\$ ${totalComissao().toStringAsFixed(2)}",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:38,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),


                      ],

                    ),

                  ),





                  // Espaçamento entre o painel principal
                  // e os cartões informativos.
                  const SizedBox(
                      height:18),






                  // Linha contendo os contadores.
                  Row(

                    children:[


                      // Card com a quantidade
                      // de serviços realizados.
                      Expanded(

                        child:
                        _contador(

                          "SERVIÇOS",

                          historico.length
                              .toString(),

                        ),

                      ),



                      const SizedBox(
                          width:12),



                      // Card mostrando o faturamento total.
                      Expanded(

                        child:
                        _contador(

                          "FATURADO",

                          "R\$ ${faturamento().toStringAsFixed(0)}",

                        ),

                      ),


                    ],

                  ),





                  // Espaçamento antes do painel
                  // de seleção do período.
                  const SizedBox(
                      height:20),






                  // Painel para seleção do período.
                  _painel(

                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,


                      children:[


                        // Título da seção.
                        Text(

                          "PERÍODO DE ANÁLISE",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),



                        const SizedBox(
                            height:15),




                        // Linha contendo os botões
                        // de seleção do período.
                        Row(

                          children:[

                            // Botão "HOJE".
                            _periodo(
                                "HOJE"),


                            const SizedBox(
                                width:8),


                            // Botão "ESTE MÊS".
                            _periodo(
                                "ESTE MÊS"),


                            const SizedBox(
                                width:8),


                            // Botão "ANO".
                            _periodo(
                                "ANO"),


                          ],

                        )



                      ],

                    ),

                  ),






                  // Espaçamento antes do histórico.
                  const SizedBox(
                      height:20),






                  // Alinha o título do histórico
                  // à esquerda da tela.
                  Align(

                    alignment:
                    Alignment.centerLeft,


                    child:
                    Text(

                      "HISTÓRICO DE PRODUÇÃO",

                      style:
                      GoogleFonts.spaceMono(

                        fontWeight:
                        FontWeight.bold,

                        letterSpacing:2,

                      ),

                    ),

                  ),






                  // Espaçamento entre o título
                  // e a lista.
                  const SizedBox(
                      height:12),






                  // Lista com todo o histórico
                  // de serviços realizados.
                  ListView.builder(

                    // Faz a lista ocupar somente
                    // o espaço necessário.
                    shrinkWrap:true,

                    // Desativa a rolagem própria,
                    // utilizando a do SingleChildScrollView.
                    physics:
                    const NeverScrollableScrollPhysics(),


                    // Quantidade de registros.
                    itemCount:
                    historico.length,


                    // Constrói cada item da lista.
                    itemBuilder:
                    (context,index){


                      // Obtém o item correspondente
                      // ao índice atual.
                      final item =
                      historico[index];



                      // Card do histórico.
                      return Container(


                        // Espaçamento inferior
                        // entre os cards.
                        margin:
                        const EdgeInsets.only(
                            bottom:12),



                        decoration:
                        BoxDecoration(

                          // Cor de fundo.
                          color:
                          const Color(
                              0xffF8F1C7),

                          // Bordas arredondadas.
                          borderRadius:
                          BorderRadius.circular(
                              20),


                          // Sombra do card.
                          boxShadow:[

                            BoxShadow(

                              color:
                              Colors.black
                                  .withOpacity(.15),

                              blurRadius:12,

                              offset:
                              const Offset(
                                  0,6),

                            ),

                          ],


                        ),



                        // Organiza automaticamente
                        // os elementos do card.
                        child:
                        ListTile(


                          // Espaçamento interno.
                          contentPadding:
                          const EdgeInsets.all(16),



                          // Ícone exibido à esquerda.
                          leading:
                          CircleAvatar(

                            backgroundColor:
                            const Color(
                                0xffD6CC8F),


                            child:
                            const Icon(
                              Icons.attach_money,
                              color:
                              Color(
                                  0xff423D2A),
                            ),

                          ),





                          // Nome do cliente.
                          title:
                          Text(

                            item["cliente"],

                            style:
                            GoogleFonts.spaceMono(

                              fontWeight:
                              FontWeight.bold,

                            ),

                          ),




                          // Serviço realizado
                          // e valor da venda.
                          subtitle:
                          Text(

                            "${item["servico"]}\n"
                            "Venda: R\$${item["valor"]}",

                          ),





                          // Exibe comissão e status.
                          trailing:
                          Column(

                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children:[


                              // Valor da comissão.
                              Text(

                                "R\$${item["comissao"]}",

                                style:
                                const TextStyle(

                                  fontWeight:
                                  FontWeight.bold,

                                  color:
                                  Colors.green,

                                ),

                              ),


                              // Situação da comissão.
                              Text(

                                item["status"],

                                style:
                                const TextStyle(

                                  fontSize:11,

                                ),

                              ),


                            ],

                          ),



                        ),



                      );


                    },

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
  // Responsável por criar os painéis utilizados
  // em toda a tela.
  //
  // Recebe qualquer Widget como conteúdo
  // através do parâmetro "child".
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

        // Sombra do painel.
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
      child:child,

    );

  }





  // =============================================================
  // MÉTODO _contador()
  // =============================================================
  //
  // Cria os pequenos cartões informativos
  // exibidos abaixo da comissão.
  //
  // Exemplo:
  // SERVIÇOS
  // FATURADO
  Widget _contador(
      String titulo,
      String valor){


    return Container(

      // Espaçamento interno.
      padding:
      const EdgeInsets.all(18),


      decoration:
      BoxDecoration(

        // Cor de fundo.
        color:
        const Color(
            0xffEFE2A8),

        // Bordas arredondadas.
        borderRadius:
        BorderRadius.circular(18),

      ),


      child:
      Column(

        children:[

          // Título do contador.
          Text(

            titulo,

            style:
            GoogleFonts.spaceMono(

              fontSize:11,

            ),

          ),



          // Espaçamento entre título e valor.
          const SizedBox(
              height:8),



          // Valor apresentado.
          Text(

            valor,

            style:
            GoogleFonts.spaceMono(

              fontSize:22,

              fontWeight:
              FontWeight.bold,

            ),

          )


        ],

      ),

    );

  }






  // =============================================================
  // MÉTODO _periodo()
  // =============================================================
  //
  // Cria um botão para selecionar
  // o período da análise.
  //
  // Os botões são:
  // • HOJE
  // • ESTE MÊS
  // • ANO
  Widget _periodo(String texto){

    // Verifica se este botão é o período selecionado.
    bool ativo =
        periodo == texto;


    return GestureDetector(

      // Executado quando o botão é pressionado.
      onTap:(){

        // Atualiza a interface.
        setState((){

          // Salva o novo período selecionado.
          periodo = texto;

        });

      },


      child:
      Container(

        // Espaçamento interno.
        padding:
        const EdgeInsets.symmetric(

          horizontal:14,

          vertical:10,

        ),


        decoration:
        BoxDecoration(

          // Altera a cor conforme o estado
          // do botão (ativo ou inativo).
          color:
          ativo

          ?
          const Color(
              0xff5F583B)

          :
          const Color(
              0xffEFE2A8),

          // Bordas arredondadas.
          borderRadius:
          BorderRadius.circular(12),

        ),


        child:
        Text(

          texto,

          style:
          TextStyle(

            // Cor do texto muda
            // quando o botão está ativo.
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

  }


}

// =============================================================
// FIM DO ARQUIVO
// =============================================================
//
// Fluxo da tela:
//
// 1. Os dados do histórico são carregados.
// 2. totalComissao() calcula a soma das comissões.
// 3. faturamento() calcula o valor total faturado.
// 4. O build() monta toda a interface.
// 5. O usuário pode selecionar um período.
// 6. A lista exibe o histórico de produção.
// 7. Os métodos _painel(), _contador() e _periodo()
//    reutilizam componentes visuais, evitando repetição
//    de código.
//
// Nenhuma linha do funcionamento original foi alterada.
// Apenas foram adicionados comentários para facilitar
// o entendimento do código.