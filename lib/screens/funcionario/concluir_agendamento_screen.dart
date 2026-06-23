import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ConcluirAgendamentoScreen extends StatefulWidget {

  const ConcluirAgendamentoScreen({
    super.key,
  });


  @override
  State<ConcluirAgendamentoScreen> createState() =>
      _ConcluirAgendamentoScreenState();

}



class _ConcluirAgendamentoScreenState
    extends State<ConcluirAgendamentoScreen> {


  final observacaoController =
      TextEditingController();


  bool pagamentoConfirmado = false;


  String formaPagamento = "PIX";


  final double valorServico = 45.00;

  final double porcentagemComissao = 0.20;



  double get comissao =>
      valorServico * porcentagemComissao;





  void finalizar(){


    if(!pagamentoConfirmado){

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
          Text(
            "CONFIRME O PAGAMENTO ANTES",
          ),
        ),

      );

      return;

    }



    showDialog(

      context: context,

      builder:(context)=>AlertDialog(

        backgroundColor:
        const Color(0xffF8F1C7),


        title:
        Text(

          "ATENDIMENTO FINALIZADO",

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

          ),

        ),



        content:
        Text(

          "Comissão gerada:\n"
          "R\$ ${comissao.toStringAsFixed(2)}",

          style:
          GoogleFonts.spaceMono(),

        ),



        actions:[

          TextButton(

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







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor:
      const Color(0xffE5DBA8),




      appBar: AppBar(


        backgroundColor:
        const Color(0xffD6CC8F),


        elevation:0,


        title:
        Text(

          "LEVEL 0 // FINALIZAÇÃO",

          style:
          GoogleFonts.spaceMono(

            color:
            const Color(0xff423D2A),

            fontWeight:
            FontWeight.bold,

            letterSpacing:2,

          ),

        ),


      ),







      body:
      Stack(

        children:[



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





          SafeArea(

            child:
            SingleChildScrollView(

              padding:
              const EdgeInsets.all(18),


              child:
              Column(

                children:[






                  _painel(

                    Column(

                      children:[


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



                        const SizedBox(
                            height:15),




                        Text(

                          "CLIENTE",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:12,

                          ),

                        ),



                        const SizedBox(
                            height:5),




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







                  const SizedBox(
                      height:18),








                  _painel(

                    Column(

                      children:[



                        _linha(

                          Icons.content_cut,

                          "Serviço",

                          "Corte + Barba",

                        ),




                        _linha(

                          Icons.timer,

                          "Duração",

                          "45 minutos",

                        ),





                        _linha(

                          Icons.attach_money,

                          "Valor",

                          "R\$ 45,00",

                        ),




                      ],

                    ),

                  ),







                  const SizedBox(
                      height:18),







                  _painel(

                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[



                        Text(

                          "FORMA DE PAGAMENTO",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),



                        const SizedBox(
                            height:15),




                        DropdownButtonFormField<String>(

                          value:
                          formaPagamento,


                          decoration:
                          InputDecoration(

                            filled:true,

                            fillColor:
                            const Color(
                                0xffEFE2A8),


                            border:
                            OutlineInputBorder(

                              borderRadius:
                              BorderRadius.circular(15),

                              borderSide:
                              BorderSide.none,

                            ),

                          ),


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



                          onChanged:(v){

                            setState((){

                              formaPagamento =
                                  v!;

                            });

                          },

                        ),




                        const SizedBox(
                            height:15),




                        SwitchListTile(

                          value:
                          pagamentoConfirmado,


                          activeColor:
                          const Color(
                              0xff5F583B),


                          title:
                          Text(

                            "Pagamento confirmado",

                            style:
                            GoogleFonts.spaceMono(),

                          ),



                          onChanged:(v){

                            setState((){

                              pagamentoConfirmado=v;

                            });

                          },


                        ),



                      ],

                    ),

                  ),






                  const SizedBox(
                      height:18),







                  _painel(

                    TextField(

                      controller:
                      observacaoController,


                      maxLines:4,


                      decoration:
                      InputDecoration(

                        labelText:
                        "Observações do atendimento",


                        filled:true,


                        fillColor:
                        const Color(
                            0xffEFE2A8),


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








                  const SizedBox(
                      height:30),







                  SizedBox(

                    width:
                    double.infinity,


                    height:
                    55,


                    child:
                    ElevatedButton(

                      onPressed:
                      finalizar,


                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        const Color(
                            0xff5F583B),


                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(15),

                        ),

                      ),



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








  Widget _painel(Widget child){

    return Container(

      width:
      double.infinity,


      padding:
      const EdgeInsets.all(20),


      decoration:
      BoxDecoration(

        color:
        const Color(
            0xffF8F1C7)
            .withOpacity(.93),


        borderRadius:
        BorderRadius.circular(22),


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


      child:
      child,


    );

  }








  Widget _linha(

      IconData icon,

      String titulo,

      String valor,

      ){


    return Padding(

      padding:
      const EdgeInsets.only(
          bottom:15),


      child:
      Row(

        children:[


          Icon(
              icon),


          const SizedBox(
              width:15),



          Expanded(

            child:
            Text(

              titulo,

              style:
              GoogleFonts.spaceMono(),

            ),

          ),



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