import 'package:appklittletits/screens/cliente/meus_agendamentos_screen.dart';
import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AvailableAgenda extends StatefulWidget {


  final String servico;



  const AvailableAgenda({

    super.key,

    required this.servico,

  });



  @override
  State<AvailableAgenda> createState() =>
      _AvailableAgendaState();

}






class _AvailableAgendaState
    extends State<AvailableAgenda> {



  String diaSelecionado = "SEX";


  String horarioSelecionado = "";





  final List<String> dias = [


    "SEG",

    "TER",

    "QUA",

    "QUI",

    "SEX",

    "SAB",


  ];







  final List<String> horarios = [


    "08:00",

    "09:00",

    "10:30",

    "12:00",

    "14:00",

    "15:30",

    "17:00",


  ];







  void confirmar(){


    if(horarioSelecionado.isEmpty){

      return;

    }





    Navigator.push(


      context,


      MaterialPageRoute(


        builder: (_) => MyAgendaScreen(


          dia:
          diaSelecionado,



          barbeiro:
          "João Silva",




          horario:
          horarioSelecionado,



          servico:
          widget.servico,



        ),


      ),


    );



  }









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

          color: Colors.white,

        ),




        title:

        Text(



          "LEVEL 0 // AGENDA",



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







          SingleChildScrollView(



            padding:

            const EdgeInsets.all(18),




            child:


            Column(



              crossAxisAlignment:

              CrossAxisAlignment.start,




              children:[





                _card(



                  Column(

                    children:[



                      const Icon(



                        Icons.calendar_month,



                        size:

                        55,



                        color:

                        Color(0xff4E492F),



                      ),




                      const SizedBox(
                          height:10),




                      Text(



                        "AGENDAMENTO",



                        style:

                        GoogleFonts.spaceMono(



                          fontWeight:

                          FontWeight.bold,



                          fontSize:

                          20,



                          letterSpacing:

                          3,



                        ),



                      ),





                      const SizedBox(
                          height:8),





                      Text(



                        widget.servico,



                        style:

                        GoogleFonts.spaceMono(



                          fontSize:

                          13,



                        ),



                      )



                    ],



                  ),



                ),








                const SizedBox(
                    height:25),





                _titulo(
                    "ESCOLHA O DIA"),





                const SizedBox(
                    height:12),





                Wrap(



                  spacing:

                  10,




                  children:

                  dias.map((dia){



                    bool ativo =

                    dia == diaSelecionado;






                    return GestureDetector(



                      onTap:(){



                        setState((){



                          diaSelecionado =

                          dia;



                          horarioSelecionado =

                          "";



                        });



                      },




                      child:

                      AnimatedContainer(



                        duration:

                        const Duration(
                            milliseconds:200),




                        padding:

                        const EdgeInsets.symmetric(

                          horizontal:

                          18,


                          vertical:

                          12,


                        ),




                        decoration:

                        BoxDecoration(



                          color:

                          ativo

                          ?

                          const Color(
                              0xff4E492F)

                          :

                          const Color(
                              0xffF8F1C7),




                          borderRadius:

                          BorderRadius.circular(15),



                        ),




                        child:

                        Text(



                          dia,



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




                  }).toList(),




                ),









                const SizedBox(
                    height:30),








                _titulo(
                    "HORÁRIOS DISPONÍVEIS"),








                const SizedBox(
                    height:15),









                GridView.builder(



                  shrinkWrap:

                  true,



                  physics:

                  const NeverScrollableScrollPhysics(),





                  itemCount:

                  horarios.length,





                  gridDelegate:

                  const SliverGridDelegateWithFixedCrossAxisCount(



                    crossAxisCount:

                    3,



                    crossAxisSpacing:

                    12,



                    mainAxisSpacing:

                    12,



                    childAspectRatio:

                    1.5,



                  ),






                  itemBuilder:(context,index){



                    final hora =

                    horarios[index];





                    bool selecionado =

                    hora == horarioSelecionado;







                    return GestureDetector(



                      onTap:(){



                        setState((){



                          horarioSelecionado =

                          hora;



                        });



                      },




                      child:

                      Container(



                        decoration:

                        BoxDecoration(



                          color:

                          selecionado

                          ?

                          const Color(
                              0xff4E492F)

                          :

                          const Color(
                              0xffF8F1C7),




                          borderRadius:

                          BorderRadius.circular(18),




                        ),




                        child:

                        Center(



                          child:

                          Text(



                            hora,



                            style:

                            TextStyle(



                              color:

                              selecionado

                              ?

                              Colors.white

                              :

                              Colors.black,



                              fontWeight:

                              FontWeight.bold,



                            ),



                          ),



                        ),



                      ),



                    );



                  },



                ),







                const SizedBox(
                    height:25),









                _card(



                  Column(



                    crossAxisAlignment:

                    CrossAxisAlignment.start,



                    children:[



                      _titulo(
                          "RESUMO"),




                      const SizedBox(
                          height:10),





                      Text(

                        "Serviço: ${widget.servico}",

                      ),





                      Text(

                        "Dia: $diaSelecionado",

                      ),





                      Text(

                        horarioSelecionado.isEmpty

                        ?

                        "Horário: Escolha um horário"

                        :

                        "Horário: $horarioSelecionado",

                      ),





                      const Text(

                          "Barbeiro: João Silva"),



                    ],



                  ),



                ),







                const SizedBox(
                    height:25),









                SizedBox(



                  width:

                  double.infinity,




                  height:

                  55,





                  child:

                  ElevatedButton(




                    onPressed:

                    horarioSelecionado.isEmpty

                    ?

                    null

                    :

                    confirmar,






                    style:

                    ElevatedButton.styleFrom(



                      backgroundColor:

                      const Color(
                          0xff4E492F),




                      disabledBackgroundColor:

                      Colors.grey,






                      shape:

                      RoundedRectangleBorder(



                        borderRadius:

                        BorderRadius.circular(18),



                      ),



                    ),







                    child:

                    Text(



                      horarioSelecionado.isEmpty

                      ?

                      "ESCOLHA UM HORÁRIO"

                      :

                      "CONFIRMAR AGENDAMENTO",





                      style:

                      const TextStyle(



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



        ],



      ),



    );



  }









  Widget _card(Widget child){



    return Container(



      width:

      double.infinity,



      padding:

      const EdgeInsets.all(20),




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

      child,



    );



  }








  Widget _titulo(String texto){



    return Text(



      texto,



      style:

      GoogleFonts.spaceMono(



        fontWeight:

        FontWeight.bold,



        letterSpacing:

        2,



      ),



    );



  }





}