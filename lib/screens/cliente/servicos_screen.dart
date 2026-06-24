import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AvailableServicesScreen extends StatefulWidget {

  const AvailableServicesScreen({
    super.key,
  });


  @override
  State<AvailableServicesScreen> createState() =>
      _AvailableServicesScreenState();

}





class _AvailableServicesScreenState
    extends State<AvailableServicesScreen> {



  final List<Map<String,dynamic>> servicos = [


    {

      "nome":"Corte Masculino",

      "descricao":
      "Corte tradicional ou moderno feito pelo profissional.",

      "tempo":"30 min",

      "preco":"R\$ 35,00",

      "icone":Icons.content_cut,

    },



    {

      "nome":"Corte + Barba",

      "descricao":
      "Corte completo acompanhado de acabamento na barba.",

      "tempo":"50 min",

      "preco":"R\$ 60,00",

      "icone":Icons.face,

    },



    {

      "nome":"Barba Completa",

      "descricao":
      "Modelagem, limpeza e acabamento profissional.",

      "tempo":"25 min",

      "preco":"R\$ 30,00",

      "icone":Icons.person,

    },



    {

      "nome":"Acabamento",

      "descricao":
      "Ajustes rápidos no cabelo e detalhes.",

      "tempo":"15 min",

      "preco":"R\$ 20,00",

      "icone":Icons.auto_fix_high,

    },


  ];







  @override
  Widget build(BuildContext context) {


    return Scaffold(



      drawer:
      const LateralMenu(),




      backgroundColor:
      const Color(0xffD9CB8B),





      appBar:

      AppBar(


        backgroundColor:
        const Color(0xff4E492F),


        iconTheme:
        const IconThemeData(

          color:Colors.white,

        ),



        title:

        Text(

          "SERVIÇOS",

          style:
          GoogleFonts.spaceMono(

            color:
            Colors.white,


            fontWeight:
            FontWeight.bold,


            letterSpacing:3,

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

                  Color(0xffCDBB79),

                ],


                begin:
                Alignment.topCenter,


                end:
                Alignment.bottomCenter,


              ),

            ),

          ),






          Padding(

            padding:
            const EdgeInsets.all(18),



            child:

            Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,


              children:[





                _titulo(

                    "CATÁLOGO DISPONÍVEL"),




                const SizedBox(
                    height:10),





                Text(

                  "Escolha o serviço antes de realizar o agendamento.",


                  style:
                  GoogleFonts.spaceMono(

                    fontSize:12,

                  ),

                ),






                const SizedBox(
                    height:20),







                Expanded(

                  child:

                  ListView.builder(

                    itemCount:
                    servicos.length,


                    itemBuilder:(context,index){



                      final item =
                      servicos[index];



                      return Container(

                        margin:
                        const EdgeInsets.only(
                            bottom:15),




                        padding:
                        const EdgeInsets.all(18),




                        decoration:
                        BoxDecoration(

                          color:
                          const Color(0xffF8F1C7),


                          borderRadius:
                          BorderRadius.circular(25),



                          boxShadow:[


                            BoxShadow(

                              color:
                              Colors.black.withOpacity(.15),


                              blurRadius:15,


                              offset:
                              const Offset(0,8),


                            )

                          ],


                        ),





                        child:

                        Row(

                          children:[





                            Container(

                              padding:
                              const EdgeInsets.all(15),



                              decoration:
                              BoxDecoration(

                                color:
                                const Color(0xffD6CC8F),


                                borderRadius:
                                BorderRadius.circular(18),

                              ),



                              child:

                              Icon(

                                item["icone"],


                                size:32,


                                color:
                                const Color(0xff4E492F),


                              ),


                            ),





                            const SizedBox(
                                width:15),





                            Expanded(

                              child:

                              Column(

                                crossAxisAlignment:
                                CrossAxisAlignment.start,


                                children:[





                                  Text(

                                    item["nome"],


                                    style:
                                    GoogleFonts.spaceMono(

                                      fontWeight:
                                      FontWeight.bold,


                                      fontSize:15,


                                    ),

                                  ),





                                  const SizedBox(
                                      height:8),





                                  Text(

                                    item["descricao"],


                                    style:
                                    const TextStyle(

                                      fontSize:12,

                                    ),

                                  ),





                                  const SizedBox(
                                      height:10),





                                  Row(

                                    children:[



                                      _tag(

                                        Icons.timer,

                                        item["tempo"],

                                      ),




                                      const SizedBox(
                                          width:8),




                                      _tag(

                                        Icons.attach_money,

                                        item["preco"],

                                      ),



                                    ],

                                  )



                                ],


                              ),


                            )




                          ],

                        ),



                      );


                    },

                  ),


                )


              ],

            ),

          )


        ],

      ),


    );


  }








  Widget _tag(
      IconData icon,
      String texto
      ){


    return Container(

      padding:
      const EdgeInsets.symmetric(

        horizontal:10,

        vertical:6,

      ),



      decoration:
      BoxDecoration(

        color:
        const Color(0xffD6CC8F),


        borderRadius:
        BorderRadius.circular(20),


      ),



      child:

      Row(

        children:[


          Icon(

            icon,

            size:14,

          ),



          const SizedBox(
              width:5),



          Text(

            texto,

            style:
            const TextStyle(

              fontSize:11,

              fontWeight:
              FontWeight.bold,

            ),

          )

        ],

      ),

    );


  }






  Widget _titulo(String texto){


    return Text(

      texto,

      style:
      GoogleFonts.spaceMono(

        fontWeight:
        FontWeight.bold,


        letterSpacing:2,


        fontSize:16,


      ),

    );


  }



}