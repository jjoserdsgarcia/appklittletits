import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ComissaoScreen extends StatefulWidget {
  const ComissaoScreen({super.key});

  @override
  State<ComissaoScreen> createState() =>
      _ComissaoScreenState();
}



class _ComissaoScreenState
    extends State<ComissaoScreen> {


  String periodo = "ESTE MÊS";


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




  double totalComissao(){

    double total=0;

    for(var item in historico){

      total += item["comissao"];

    }

    return total;

  }




  double faturamento(){

    double total=0;

    for(var item in historico){

      total += item["valor"];

    }

    return total;

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


        title:Text(

          "LEVEL 0 // COMISSÃO",

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




      body:Stack(

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

                begin:
                Alignment.topCenter,

                end:
                Alignment.bottomCenter,

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

                          "EMPLOYEE REWARD SYSTEM",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                            fontSize:16,

                            letterSpacing:2,

                          ),

                        ),


                        const SizedBox(
                            height:12),



                        Text(

                          "COMISSÃO ATUAL",

                          style:
                          GoogleFonts.spaceMono(),

                        ),



                        const SizedBox(
                            height:8),




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






                  const SizedBox(
                      height:18),







                  Row(

                    children:[


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



                      Expanded(

                        child:
                        _contador(

                          "FATURADO",

                          "R\$ ${faturamento().toStringAsFixed(0)}",

                        ),

                      ),


                    ],

                  ),






                  const SizedBox(
                      height:20),






                  _painel(

                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,


                      children:[


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




                        Row(

                          children:[

                            _periodo(
                                "HOJE"),


                            const SizedBox(
                                width:8),


                            _periodo(
                                "ESTE MÊS"),


                            const SizedBox(
                                width:8),


                            _periodo(
                                "ANO"),


                          ],

                        )



                      ],

                    ),

                  ),







                  const SizedBox(
                      height:20),






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






                  const SizedBox(
                      height:12),






                  ListView.builder(

                    shrinkWrap:true,

                    physics:
                    const NeverScrollableScrollPhysics(),


                    itemCount:
                    historico.length,


                    itemBuilder:
                    (context,index){


                      final item =
                      historico[index];



                      return Container(


                        margin:
                        const EdgeInsets.only(
                            bottom:12),



                        decoration:
                        BoxDecoration(

                          color:
                          const Color(
                              0xffF8F1C7),

                          borderRadius:
                          BorderRadius.circular(
                              20),


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



                        child:
                        ListTile(


                          contentPadding:
                          const EdgeInsets.all(16),



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





                          title:
                          Text(

                            item["cliente"],

                            style:
                            GoogleFonts.spaceMono(

                              fontWeight:
                              FontWeight.bold,

                            ),

                          ),




                          subtitle:
                          Text(

                            "${item["servico"]}\n"
                            "Venda: R\$${item["valor"]}",

                          ),





                          trailing:
                          Column(

                            mainAxisAlignment:
                            MainAxisAlignment.center,

                            children:[


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


      child:child,

    );

  }





  Widget _contador(
      String titulo,
      String valor){


    return Container(

      padding:
      const EdgeInsets.all(18),


      decoration:
      BoxDecoration(

        color:
        const Color(
            0xffEFE2A8),

        borderRadius:
        BorderRadius.circular(18),

      ),


      child:
      Column(

        children:[


          Text(

            titulo,

            style:
            GoogleFonts.spaceMono(

              fontSize:11,

            ),

          ),



          const SizedBox(
              height:8),



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







  Widget _periodo(String texto){

    bool ativo =
        periodo == texto;


    return GestureDetector(

      onTap:(){

        setState((){

          periodo = texto;

        });

      },


      child:
      Container(

        padding:
        const EdgeInsets.symmetric(

          horizontal:14,

          vertical:10,

        ),


        decoration:
        BoxDecoration(

          color:
          ativo

          ?
          const Color(
              0xff5F583B)

          :
          const Color(
              0xffEFE2A8),


          borderRadius:
          BorderRadius.circular(12),

        ),


        child:
        Text(

          texto,

          style:
          TextStyle(

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