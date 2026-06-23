import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CadastroHorarioScreen extends StatefulWidget {
  const CadastroHorarioScreen({super.key});

  @override
  State<CadastroHorarioScreen> createState() =>
      _CadastroHorarioScreenState();
}


class _CadastroHorarioScreenState
    extends State<CadastroHorarioScreen> {


  TimeOfDay? entrada;
  TimeOfDay? saida;


  final List<String> dias = [
    "SEG",
    "TER",
    "QUA",
    "QUI",
    "SEX",
    "SAB",
    "DOM",
  ];


  final List<String> selecionados = [];


  Future<void> escolherHora(
      bool inicio) async {

    final hora =
        await showTimePicker(
      context: context,
      initialTime:
          TimeOfDay.now(),
    );


    if(hora != null){

      setState(() {

        if(inicio){
          entrada = hora;
        }else{
          saida = hora;
        }

      });

    }
  }



  void salvar(){

    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content:
        Text(
          "HORÁRIO REGISTRADO NO SISTEMA",
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

        elevation: 0,

        title: Text(

          "LEVEL 0 // HORÁRIO",
          
          style:
          GoogleFonts.spaceMono(

            color:
            const Color(0xff423D2A),

            fontWeight:
            FontWeight.bold,

            letterSpacing: 2,

          ),

        ),

      ),


      body: Stack(

        children: [


          // Fundo textura

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

                children: [



                  _painel(

                    child:
                    Column(

                      children: [


                        Text(

                          "EMPLOYEE SCHEDULE SYSTEM",

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

                          "CADASTRAR NOVO HORÁRIO",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:13,

                          ),

                        ),


                      ],

                    ),

                  ),



                  const SizedBox(height:20),



                  _painel(

                    child:
                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[


                        Text(

                          "INTERVALO DE OPERAÇÃO",

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


                            Expanded(

                              child:
                              _horaCard(

                                "ENTRADA",

                                entrada,

                                ()=>
                                    escolherHora(true),

                              ),

                            ),


                            const SizedBox(
                                width:15),


                            Expanded(

                              child:
                              _horaCard(

                                "SAÍDA",

                                saida,

                                ()=>
                                    escolherHora(false),

                              ),

                            ),


                          ],

                        ),


                      ],

                    ),

                  ),



                  const SizedBox(
                      height:20),




                  _painel(

                    child:
                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[


                        Text(

                          "DIAS AUTORIZADOS",

                          style:
                          GoogleFonts.spaceMono(

                            fontWeight:
                            FontWeight.bold,

                          ),

                        ),


                        const SizedBox(
                            height:15),


                        Wrap(

                          spacing:8,

                          children:

                          dias.map((dia){


                            final ativo =
                            selecionados
                                .contains(dia);


                            return GestureDetector(

                              onTap:(){

                                setState((){

                                  if(ativo){

                                    selecionados
                                        .remove(dia);

                                  }else{

                                    selecionados
                                        .add(dia);

                                  }

                                });

                              },


                              child:
                              Container(

                                padding:
                                const EdgeInsets
                                    .symmetric(

                                  horizontal:18,

                                  vertical:12,

                                ),


                                decoration:
                                BoxDecoration(

                                  color:
                                  ativo

                                  ?

                                  const Color(
                                      0xff6F6642)

                                      :

                                  const Color(
                                      0xffEFE2A8),


                                  borderRadius:
                                  BorderRadius
                                      .circular(10),


                                  border:
                                  Border.all(

                                    color:
                                    const Color(
                                        0xff9D8D52),

                                  ),

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

                      ],

                    ),

                  ),





                  const SizedBox(
                      height:30),





                  SizedBox(

                    width:
                    double.infinity,


                    height:55,


                    child:
                    ElevatedButton(

                      style:
                      ElevatedButton
                          .styleFrom(

                        backgroundColor:
                        const Color(
                            0xff5F583B),

                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius
                              .circular(15),

                        ),

                      ),


                      onPressed:
                      salvar,


                      child:
                      Text(

                        "SALVAR REGISTRO",

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





  Widget _painel(
      {required Widget child}){


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
            .withOpacity(.92),


        borderRadius:
        BorderRadius.circular(22),


        boxShadow:[

          BoxShadow(

            color:
            Colors.black
                .withOpacity(.18),

            blurRadius:20,

            offset:
            const Offset(0,8),

          ),

        ],

      ),


      child:child,

    );


  }





  Widget _horaCard(

      String titulo,

      TimeOfDay? hora,

      VoidCallback abrir){


    return GestureDetector(

      onTap:abrir,


      child:
      Container(

        padding:
        const EdgeInsets.all(15),


        decoration:
        BoxDecoration(

          color:
          const Color(
              0xffEFE2A8),


          borderRadius:
          BorderRadius.circular(15),

        ),


        child:
        Column(

          children:[


            Text(

              titulo,

              style:
              GoogleFonts.spaceMono(

                fontSize:12,

                fontWeight:
                FontWeight.bold,

              ),

            ),


            const SizedBox(
                height:10),


            Text(

              hora == null

              ?

              "--:--"

              :

              hora.format(context),


              style:
              GoogleFonts.spaceMono(

                fontSize:25,

                fontWeight:
                FontWeight.bold,

              ),

            ),


          ],

        ),

      ),

    );


  }

}