import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeClientScreen extends StatefulWidget {

  const HomeClientScreen({
    super.key,
  });


  @override
  State<HomeClientScreen> createState() =>
      _HomeClientScreenState();

}



class _HomeClientScreenState
    extends State<HomeClientScreen> {



  final List<Map<String,dynamic>> cortes = [


    {
      "nome":"Corte Degradê",
      "descricao":
      "Laterais baixas com acabamento moderno e personalizado",
      "tempo":"40 minutos",
      "preco":"R\$ 35,00",
    },


    {
      "nome":"Corte Social",
      "descricao":
      "Corte clássico para estilo elegante e profissional",
      "tempo":"30 minutos",
      "preco":"R\$ 30,00",
    },


    {
      "nome":"Corte + Barba",
      "descricao":
      "Combo completo com acabamento e alinhamento",
      "tempo":"60 minutos",
      "preco":"R\$ 55,00",
    },


    {
      "nome":"Barba Completa",
      "descricao":
      "Modelagem, limpeza e acabamento profissional",
      "tempo":"30 minutos",
      "preco":"R\$ 25,00",
    },


    {
      "nome":"Platinado",
      "descricao":
      "Coloração especial com tratamento completo",
      "tempo":"120 minutos",
      "preco":"R\$ 120,00",
    },


  ];






  @override
  Widget build(BuildContext context) {


    return Scaffold(


      drawer:
      const LateralMenu(),



      backgroundColor:
      const Color(0xffE5DBA8),




      appBar:
      AppBar(


        backgroundColor:
        const Color(0xff5F583B),


        elevation:0,


        title:
        Text(

          "LEVEL 0 // CLIENT",

          style:
          GoogleFonts.spaceMono(

            color:
            Colors.white,

            fontWeight:
            FontWeight.bold,

            letterSpacing:2,

          ),

        ),


        iconTheme:
        const IconThemeData(

          color:
          Colors.white,

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

                crossAxisAlignment:
                CrossAxisAlignment.start,


                children:[






                  _painel(

                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,


                      children:[



                        Text(

                          "WELCOME BACK",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:14,

                            letterSpacing:3,

                          ),

                        ),




                        const SizedBox(
                            height:10),





                        Text(

                          "CLIENTE",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:30,

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),





                        const SizedBox(
                            height:10),




                        Text(

                          "Sistema de agendamento da barbearia",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:12,

                          ),

                        ),



                      ],

                    ),

                  ),







                  const SizedBox(
                      height:20),






                  Row(

                    children:[



                      Expanded(

                        child:
                        _cardInfo(

                          Icons.calendar_month,

                          "PRÓXIMO",

                          "Livre",

                        ),

                      ),





                      const SizedBox(
                          width:12),




                      Expanded(

                        child:
                        _cardInfo(

                          Icons.content_cut,

                          "SERVIÇOS",

                          "${cortes.length}",

                        ),

                      ),



                    ],

                  ),







                  const SizedBox(
                      height:20),






                  _painel(


                    Column(

                      children:[



                        const Icon(

                          Icons.event_available,

                          size:55,

                          color:
                          Color(0xff5F583B),

                        ),





                        const SizedBox(
                            height:15),




                        Text(

                          "AGENDE SEU HORÁRIO",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                            letterSpacing:2,

                          ),

                        ),





                        const SizedBox(
                            height:15),





                        SizedBox(

                          width:
                          double.infinity,


                          height:
                          50,


                          child:
                          ElevatedButton(

                            onPressed:(){},


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

                              "NOVO AGENDAMENTO",

                              style:
                              GoogleFonts.spaceMono(

                                color:
                                Colors.white,

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),


                          ),

                        )


                      ],

                    ),

                  ),








                  const SizedBox(
                      height:25),







                  Text(

                    "CATÁLOGO DE SERVIÇOS",

                    style:
                    GoogleFonts.spaceMono(

                      fontWeight:
                      FontWeight.bold,

                      letterSpacing:2,

                    ),

                  ),




                  const SizedBox(
                      height:15),







                  ListView.builder(

                    shrinkWrap:true,


                    physics:
                    const NeverScrollableScrollPhysics(),



                    itemCount:
                    cortes.length,



                    itemBuilder:(context,index){


                      final corte =
                      cortes[index];



                      return Container(


                        margin:
                        const EdgeInsets.only(
                            bottom:15),



                        decoration:
                        BoxDecoration(

                          color:
                          const Color(
                              0xffF8F1C7),


                          borderRadius:
                          BorderRadius.circular(22),



                          boxShadow:[


                            BoxShadow(

                              color:
                              Colors.black
                                  .withOpacity(.15),

                              blurRadius:15,

                              offset:
                              const Offset(
                                  0,8),

                            )

                          ],


                        ),





                        child:
                        Padding(

                          padding:
                          const EdgeInsets.all(18),


                          child:
                          Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,


                            children:[





                              Row(

                                children:[



                                  Container(

                                    padding:
                                    const EdgeInsets.all(12),


                                    decoration:
                                    BoxDecoration(

                                      color:
                                      const Color(
                                          0xffD6CC8F),


                                      borderRadius:
                                      BorderRadius.circular(15),

                                    ),


                                    child:
                                    const Icon(

                                      Icons.content_cut,

                                      color:
                                      Color(
                                          0xff423D2A),

                                    ),

                                  ),





                                  const SizedBox(
                                      width:15),





                                  Expanded(

                                    child:
                                    Text(

                                      corte["nome"],


                                      style:
                                      GoogleFonts.spaceMono(

                                        fontSize:16,

                                        fontWeight:
                                        FontWeight.bold,

                                      ),

                                    ),

                                  ),


                                ],

                              ),





                              const SizedBox(
                                  height:15),





                              Text(

                                corte["descricao"],


                                style:
                                GoogleFonts.spaceMono(

                                  fontSize:12,

                                ),

                              ),





                              const Divider(),





                              Row(

                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,


                                children:[



                                  _produtoInfo(

                                    Icons.timer,

                                    corte["tempo"],

                                  ),




                                  _produtoInfo(

                                    Icons.attach_money,

                                    corte["preco"],

                                  ),



                                ],


                              )



                            ],

                          ),

                        ),



                      );


                    },

                  ),





                  const SizedBox(
                      height:20),






                  Text(

                    "ACCESS MENU",

                    style:
                    GoogleFonts.spaceMono(

                      fontWeight:
                      FontWeight.bold,

                      letterSpacing:2,

                    ),

                  ),






                  const SizedBox(
                      height:10),







                  _atalho(

                    Icons.history,

                    "Meus Agendamentos",

                    "Consultar seus horários",

                  ),




                  _atalho(

                    Icons.schedule,

                    "Horários",

                    "Ver horários disponíveis",

                  ),




                  _atalho(

                    Icons.groups,

                    "Profissionais",

                    "Conheça nossa equipe",

                  ),




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
            0xffF8F1C7),


        borderRadius:
        BorderRadius.circular(24),


        boxShadow:[


          BoxShadow(

            color:
            Colors.black
                .withOpacity(.15),

            blurRadius:18,

            offset:
            const Offset(
                0,8),

          )


        ],

      ),


      child:
      child,

    );


  }








  Widget _cardInfo(

      IconData icon,

      String titulo,

      String valor,

      ){


    return Container(

      padding:
      const EdgeInsets.all(16),


      decoration:
      BoxDecoration(

        color:
        const Color(
            0xffF8F1C7),


        borderRadius:
        BorderRadius.circular(20),


      ),


      child:
      Column(

        children:[


          Icon(icon),


          const SizedBox(
              height:8),


          Text(

            titulo,

            style:
            GoogleFonts.spaceMono(

              fontSize:10,

            ),

          ),



          Text(

            valor,

            style:
            GoogleFonts.spaceMono(

              fontWeight:
              FontWeight.bold,

            ),

          )


        ],

      ),

    );

  }








  Widget _produtoInfo(

      IconData icon,

      String texto,

      ){


    return Row(

      children:[


        Icon(

          icon,

          size:18,

          color:
          const Color(
              0xff5F583B),

        ),



        const SizedBox(
            width:6),




        Text(

          texto,

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

          ),

        ),


      ],

    );


  }








  Widget _atalho(

      IconData icon,

      String titulo,

      String descricao,

      ){


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
        BorderRadius.circular(18),


      ),



      child:
      ListTile(

        leading:
        CircleAvatar(

          backgroundColor:
          const Color(
              0xffD6CC8F),


          child:
          Icon(

            icon,

            color:
            const Color(
                0xff423D2A),

          ),

        ),



        title:
        Text(

          titulo,

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

          ),

        ),



        subtitle:
        Text(descricao),



        trailing:
        const Icon(

          Icons.arrow_forward_ios,

          size:14,

        ),


      ),

    );


  }



}