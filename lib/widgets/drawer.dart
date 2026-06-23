import 'package:appklittletits/screens/cliente/horarios_screen.dart';
import 'package:appklittletits/screens/cliente/meus_agendamentos_screen.dart';
import 'package:appklittletits/screens/cliente/novo_agendamento_screen.dart';
import 'package:appklittletits/screens/cliente/profissionais_screen.dart';
import 'package:appklittletits/screens/cliente/servicos_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LateralMenu extends StatelessWidget {

  const LateralMenu({
    super.key,
  });



  void abrir(BuildContext context, Widget tela){

    Navigator.of(context).push(

      MaterialPageRoute(

        builder: (_) => tela,

      ),

    );

  }



  @override
  Widget build(BuildContext context) {


    return Drawer(


      backgroundColor:
      const Color(0xffE5DBA8),



      child:
      Stack(


        children:[



          // Fundo estilo parede

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
            ListView(

              padding:
              EdgeInsets.zero,


              children:[





                Container(

                  height:210,


                  padding:
                  const EdgeInsets.all(22),


                  decoration:
                  BoxDecoration(

                    color:
                    const Color(
                        0xff5F583B),


                    borderRadius:
                    const BorderRadius.only(

                      bottomLeft:
                      Radius.circular(35),

                      bottomRight:
                      Radius.circular(35),

                    ),


                    boxShadow:[

                      BoxShadow(

                        color:
                        Colors.black
                            .withOpacity(.35),

                        blurRadius:20,

                        offset:
                        const Offset(
                            0,10),

                      ),

                    ],


                  ),



                  child:
                  Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,


                    children:[


                      const SizedBox(
                          height:20),



                      Icon(

                        Icons
                            .meeting_room_outlined,

                        size:50,

                        color:
                        Colors.white,

                      ),



                      const SizedBox(
                          height:15),



                      Text(

                        "LEVEL 0",

                        style:
                        GoogleFonts.spaceMono(

                          color:
                          Colors.white,

                          fontSize:28,

                          fontWeight:
                          FontWeight.bold,

                          letterSpacing:4,

                        ),

                      ),




                      Text(

                        "CLIENT CONTROL SYSTEM",

                        style:
                        GoogleFonts.spaceMono(

                          color:
                          Colors.white70,

                          fontSize:12,

                          letterSpacing:2,

                        ),

                      ),



                    ],

                  ),

                ),






                const SizedBox(
                    height:20),





                _item(

                  context,

                  Icons.home_outlined,

                  "Painel Inicial",

                  null,

                ),





                _item(

                  context,

                  Icons.calendar_month,

                  "Novo Agendamento",

                  (){

                    abrir(
                      context,
                      NovoAgendamentoScreen(),
                    );

                  },

                ),






                _item(

                  context,

                  Icons.history,

                  "Meus Agendamentos",

                  (){

                    abrir(
                      context,
                      MyAgendaScreen(),
                    );

                  },

                ),






                _item(

                  context,

                  Icons.access_time,

                  "Horários Disponíveis",

                  (){

                    abrir(
                      context,
                      AvailableAgenda(),
                    );

                  },

                ),





                _item(

                  context,

                  Icons.content_cut,

                  "Serviços",

                  (){

                    abrir(
                      context,
                      AvailableServicesScreen(),
                    );

                  },

                ),





                _item(

                  context,

                  Icons.groups,

                  "Profissionais",

                  (){

                    abrir(
                      context,
                      ProfessionalsScreen(),
                    );

                  },

                ),






                const SizedBox(
                    height:30),





                Padding(

                  padding:
                  const EdgeInsets.symmetric(
                      horizontal:22),


                  child:
                  Text(

                    "SYSTEM STATUS: ONLINE",

                    style:
                    GoogleFonts.spaceMono(

                      color:
                      Colors.green.shade800,

                      fontSize:11,

                      fontWeight:
                      FontWeight.bold,

                    ),

                  ),

                )



              ],

            ),

          ),


        ],

      ),


    );


  }








  Widget _item(

      BuildContext context,

      IconData icon,

      String texto,

      VoidCallback? acao,

      ){



    return Container(

      margin:
      const EdgeInsets.symmetric(

        horizontal:14,

        vertical:6,

      ),



      decoration:
      BoxDecoration(

        color:
        const Color(
            0xffF8F1C7)
            .withOpacity(.9),



        borderRadius:
        BorderRadius.circular(18),



        boxShadow:[


          BoxShadow(

            color:
            Colors.black
                .withOpacity(.12),

            blurRadius:10,

            offset:
            const Offset(
                0,5),

          ),


        ],


      ),




      child:
      ListTile(


        onTap:(){

          if(acao != null){

            acao();

          }

        },



        leading:
        Container(

          padding:
          const EdgeInsets.all(10),


          decoration:
          BoxDecoration(

            color:
            const Color(
                0xffD6CC8F),


            borderRadius:
            BorderRadius.circular(12),

          ),



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

          texto,

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

            color:
            const Color(
                0xff423D2A),

          ),

        ),



        trailing:
        const Icon(

          Icons.arrow_forward_ios,

          size:14,

        ),



      ),


    );


  }


}