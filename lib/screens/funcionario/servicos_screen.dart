import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ServicosScreen extends StatefulWidget {

  const ServicosScreen({super.key});

  @override
  State<ServicosScreen> createState() =>
      _ServicosScreenState();

}



class _ServicosScreenState
    extends State<ServicosScreen> {



  final List<Map<String,dynamic>> servicos = [

    {
      "nome":"Corte Masculino",
      "duracao":"40 minutos",
      "valor":35.00,
      "ativo":true,
    },


    {
      "nome":"Barba Completa",
      "duracao":"30 minutos",
      "valor":25.00,
      "ativo":true,
    },


    {
      "nome":"Corte + Barba",
      "duracao":"60 minutos",
      "valor":55.00,
      "ativo":true,
    },


    {
      "nome":"Sobrancelha",
      "duracao":"15 minutos",
      "valor":15.00,
      "ativo":false,
    },


  ];






  void excluir(int index){


    showDialog(

      context: context,

      builder:(context)=>AlertDialog(

        backgroundColor:
        const Color(0xffF8F1C7),


        title:
        Text(

          "REMOVER REGISTRO",

          style:
          GoogleFonts.spaceMono(

            fontWeight:
            FontWeight.bold,

          ),

        ),


        content:
        const Text(
            "Deseja apagar este serviço?"),


        actions:[


          TextButton(

            onPressed:(){

              Navigator.pop(context);

            },

            child:
            const Text("CANCELAR"),

          ),




          TextButton(

            onPressed:(){

              setState((){

                servicos.removeAt(index);

              });


              Navigator.pop(context);


            },

            child:
            const Text(
                "REMOVER"),

          ),


        ],


      ),


    );


  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor:
      const Color(0xffE5DBA8),



      floatingActionButton:
      FloatingActionButton.extended(


        backgroundColor:
        const Color(0xff5F583B),


        onPressed:(){},


        icon:
        const Icon(Icons.add),


        label:
        Text(

          "NOVO SERVIÇO",

          style:
          GoogleFonts.spaceMono(

            color:
            Colors.white,

          ),

        ),


      ),





      appBar:AppBar(


        backgroundColor:
        const Color(0xffD6CC8F),


        elevation:0,


        title:
        Text(

          "LEVEL 0 // SERVIÇOS",

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

                          "EMPLOYEE SERVICE DATABASE",

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

                          "${servicos.length} SERVIÇOS REGISTRADOS",

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
                    servicos.length,


                    itemBuilder:
                    (context,index){



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

                            )


                          ],


                        ),




                        child:
                        Column(

                          children:[





                            Row(

                              children:[



                                CircleAvatar(

                                  backgroundColor:
                                  const Color(
                                      0xffD6CC8F),


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

                                    item["nome"],


                                    style:
                                    GoogleFonts.spaceMono(

                                      fontWeight:
                                      FontWeight.bold,

                                      fontSize:15,

                                    ),

                                  ),

                                ),



                                PopupMenuButton(


                                  itemBuilder:
                                  (context)=>[


                                    const PopupMenuItem(

                                      value:"editar",

                                      child:
                                      Text(
                                          "Editar"),

                                    ),



                                    const PopupMenuItem(

                                      value:"excluir",

                                      child:
                                      Text(
                                          "Excluir"),

                                    ),


                                  ],


                                  onSelected:(v){


                                    if(v=="excluir"){

                                      excluir(index);

                                    }


                                  },


                                )



                              ],

                            ),






                            const Divider(),





                            Row(

                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,


                              children:[




                                _info(

                                  Icons.timer,

                                  "DURAÇÃO",

                                  item["duracao"],

                                ),





                                _info(

                                  Icons.attach_money,

                                  "VALOR",

                                  "R\$ ${item["valor"]}",

                                ),




                                _status(

                                  item["ativo"],

                                  index,

                                ),




                              ],

                            )



                          ],

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


      child:
      child,


    );


  }






  Widget _info(

      IconData icon,

      String titulo,

      String valor,

      ){


    return Column(

      children:[


        Icon(icon,size:20),


        const SizedBox(
            height:5),


        Text(

          titulo,

          style:
          GoogleFonts.spaceMono(

            fontSize:9,

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

    );


  }






  Widget _status(

      bool ativo,

      int index,

      ){


    return Column(

      children:[


        Switch(

          value:
          ativo,


          activeColor:
          const Color(
              0xff5F583B),



          onChanged:(v){

            setState((){

              servicos[index]["ativo"]=v;

            });


          },


        ),



        Text(

          ativo
          ?
          "ATIVO"
          :
          "OFF",


          style:
          GoogleFonts.spaceMono(

            fontSize:10,

          ),


        )


      ],

    );


  }



}