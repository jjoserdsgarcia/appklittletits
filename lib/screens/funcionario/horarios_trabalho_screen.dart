import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HorariosTrabalhoScreen extends StatefulWidget {

  const HorariosTrabalhoScreen({super.key});


  @override
  State<HorariosTrabalhoScreen> createState() =>
      _HorariosTrabalhoScreenState();

}



class _HorariosTrabalhoScreenState
    extends State<HorariosTrabalhoScreen> {



  final List<Map<String,dynamic>> semana = [

    {
      "dia":"SEGUNDA",
      "entrada":"08:00",
      "saida":"18:00",
      "ativo":true,
    },

    {
      "dia":"TERÇA",
      "entrada":"08:00",
      "saida":"18:00",
      "ativo":true,
    },

    {
      "dia":"QUARTA",
      "entrada":"09:00",
      "saida":"19:00",
      "ativo":true,
    },

    {
      "dia":"QUINTA",
      "entrada":"08:00",
      "saida":"18:00",
      "ativo":true,
    },

    {
      "dia":"SEXTA",
      "entrada":"08:00",
      "saida":"20:00",
      "ativo":true,
    },


    {
      "dia":"SÁBADO",
      "entrada":"09:00",
      "saida":"15:00",
      "ativo":false,
    },


    {
      "dia":"DOMINGO",
      "entrada":"--:--",
      "saida":"--:--",
      "ativo":false,
    },


  ];





  void salvar(){


    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(

        content:
        Text(
          "ESCALA ATUALIZADA NO SISTEMA",
        ),

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

          "LEVEL 0 // ESCALA",

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

                          "EMPLOYEE WORK CONTROL",

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



                        Text(

                          "HORÁRIO DE FUNCIONAMENTO",

                          style:
                          GoogleFonts.spaceMono(),

                        ),



                      ],

                    ),

                  ),






                  const SizedBox(
                      height:20),






                  ListView.builder(

                    shrinkWrap:true,

                    physics:
                    const NeverScrollableScrollPhysics(),


                    itemCount:
                    semana.length,


                    itemBuilder:
                    (context,index){


                      final item =
                      semana[index];



                      return Container(

                        margin:
                        const EdgeInsets.only(
                            bottom:14),



                        padding:
                        const EdgeInsets.all(18),



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
                                  0,7),

                            ),


                          ],


                        ),




                        child:
                        Column(

                          children:[



                            Row(

                              children:[


                                CircleAvatar(

                                  backgroundColor:
                                  item["ativo"]

                                  ?

                                  const Color(
                                      0xff5F583B)

                                  :

                                  const Color(
                                      0xffB5A875),


                                  child:
                                  Icon(

                                    item["ativo"]

                                    ?

                                    Icons.check

                                    :

                                    Icons.close,


                                    color:
                                    Colors.white,

                                  ),

                                ),




                                const SizedBox(
                                    width:15),





                                Expanded(

                                  child:
                                  Text(

                                    item["dia"],


                                    style:
                                    GoogleFonts.spaceMono(

                                      fontWeight:
                                      FontWeight.bold,

                                      fontSize:15,

                                    ),

                                  ),

                                ),




                                Switch(

                                  value:
                                  item["ativo"],


                                  activeColor:
                                  const Color(
                                      0xff5F583B),


                                  onChanged:(v){


                                    setState((){


                                      item["ativo"]=v;


                                    });


                                  },

                                )



                              ],

                            ),





                            const Divider(),





                            Row(

                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,


                              children:[



                                _hora(

                                  Icons.login,

                                  "ENTRADA",

                                  item["entrada"],

                                ),





                                _hora(

                                  Icons.logout,

                                  "SAÍDA",

                                  item["saida"],

                                ),




                              ],

                            )



                          ],

                        ),



                      );



                    },

                  ),






                  const SizedBox(
                      height:20),






                  SizedBox(

                    width:
                    double.infinity,


                    height:
                    55,


                    child:
                    ElevatedButton(

                      onPressed:
                      salvar,


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

                        "SALVAR ESCALA",

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
            Colors.black
                .withOpacity(.15),

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







  Widget _hora(

      IconData icon,

      String titulo,

      String hora,

      ){


    return Column(

      children:[


        Icon(
          icon,
          size:20,
        ),


        const SizedBox(
            height:5),


        Text(

          titulo,

          style:
          GoogleFonts.spaceMono(

            fontSize:10,

          ),

        ),


        Text(

          hora,

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

          ),

        ),


      ],

    );

  }



}