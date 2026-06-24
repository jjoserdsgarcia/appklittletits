import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ProfessionalsScreen extends StatefulWidget {

  const ProfessionalsScreen({
    super.key,
  });


  @override
  State<ProfessionalsScreen> createState() =>
      _ProfessionalsScreenState();

}





class _ProfessionalsScreenState
    extends State<ProfessionalsScreen> {



  final List<Map<String,dynamic>> profissionais = [


    {


      "nome":
      "João Silva",


      "cargo":
      "Barbeiro Master",


      "especialidade":
      "Cortes modernos e barba",


      "tempo":
      "8 anos de experiência",


      "disponivel":
      true,


    },





    {


      "nome":
      "Carlos Mendes",


      "cargo":
      "Especialista Fade",


      "especialidade":
      "Degradê e cortes atuais",


      "tempo":
      "5 anos de experiência",


      "disponivel":
      true,


    },





    {


      "nome":
      "Lucas Oliveira",


      "cargo":
      "Barbeiro",


      "especialidade":
      "Cortes clássicos",


      "tempo":
      "3 anos de experiência",


      "disponivel":
      false,


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


          "PROFISSIONAIS",



          style:

          GoogleFonts.spaceMono(



            color:

            Colors.white,



            fontWeight:

            FontWeight.bold,



            letterSpacing:

            2,



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





                Text(



                  "EQUIPE DISPONÍVEL",



                  style:

                  GoogleFonts.spaceMono(



                    fontWeight:

                    FontWeight.bold,



                    letterSpacing:

                    2,



                  ),



                ),






                const SizedBox(
                    height:10),






                Text(



                  "Conheça nossos profissionais antes de agendar.",



                  style:

                  GoogleFonts.spaceMono(



                    fontSize:

                    12,



                  ),



                ),







                const SizedBox(
                    height:20),







                Expanded(



                  child:


                  ListView.builder(



                    itemCount:

                    profissionais.length,




                    itemBuilder:(context,index){



                      final item =

                      profissionais[index];







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



                              blurRadius:

                              15,



                              offset:

                              const Offset(0,8),



                            )



                          ],



                        ),







                        child:


                        Row(



                          children:[





                            CircleAvatar(



                              radius:

                              32,




                              backgroundColor:

                              const Color(0xffD6CC8F),




                              child:

                              const Icon(



                                Icons.person,



                                size:

                                35,



                                color:

                                Color(0xff4E492F),



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



                                      fontSize:

                                      15,



                                    ),



                                  ),







                                  const SizedBox(
                                      height:5),







                                  Text(



                                    item["cargo"],



                                    style:

                                    const TextStyle(

                                      fontWeight:

                                      FontWeight.bold,

                                    ),



                                  ),








                                  const SizedBox(
                                      height:8),








                                  Text(



                                    item["especialidade"],



                                    style:

                                    const TextStyle(

                                      fontSize:

                                      12,

                                    ),



                                  ),







                                  const SizedBox(
                                      height:5),







                                  Text(



                                    item["tempo"],



                                    style:

                                    const TextStyle(

                                      fontSize:

                                      12,

                                      color:

                                      Colors.black54,

                                    ),



                                  ),







                                  const SizedBox(
                                      height:12),







                                  Container(



                                    padding:

                                    const EdgeInsets.symmetric(

                                      horizontal:

                                      12,


                                      vertical:

                                      6,


                                    ),




                                    decoration:

                                    BoxDecoration(



                                      color:

                                      item["disponivel"]

                                      ?

                                      Colors.green.withOpacity(.15)

                                      :

                                      Colors.red.withOpacity(.15),




                                      borderRadius:

                                      BorderRadius.circular(20),



                                    ),





                                    child:


                                    Text(



                                      item["disponivel"]

                                      ?

                                      "DISPONÍVEL"

                                      :

                                      "OCUPADO",




                                      style:

                                      TextStyle(



                                        color:

                                        item["disponivel"]

                                        ?

                                        Colors.green

                                        :

                                        Colors.red,



                                        fontWeight:

                                        FontWeight.bold,



                                        fontSize:

                                        11,



                                      ),



                                    ),



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



}