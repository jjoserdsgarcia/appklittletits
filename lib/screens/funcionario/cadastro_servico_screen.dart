import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CadastroServicoScreen extends StatefulWidget {
  const CadastroServicoScreen({super.key});

  @override
  State<CadastroServicoScreen> createState() =>
      _CadastroServicoScreenState();
}


class _CadastroServicoScreenState
    extends State<CadastroServicoScreen> {


  final nomeController =
      TextEditingController();

  final precoController =
      TextEditingController();

  final duracaoController =
      TextEditingController();


  bool ativo = true;



  void salvarServico(){

    if(nomeController.text.isEmpty ||
        precoController.text.isEmpty ||
        duracaoController.text.isEmpty){

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
          Text(
            "DADOS INCOMPLETOS NO SISTEMA",
          ),
        ),

      );

      return;
    }


    ScaffoldMessenger.of(context)
        .showSnackBar(

      const SnackBar(
        content:
        Text(
          "SERVIÇO REGISTRADO COM SUCESSO",
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


        title:Text(

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



      body: Stack(

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

                          "CADASTRO DE PROCEDIMENTO",

                          style:
                          GoogleFonts.spaceMono(

                            fontSize:13,

                          ),

                        ),


                      ],

                    ),

                  ),





                  const SizedBox(
                      height:20),





                  _painel(

                    Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children:[


                        _titulo(
                            "NOME DO SERVIÇO"),


                        _campo(

                          controller:
                          nomeController,

                          hint:
                          "Ex: Corte Degradê",

                          icon:
                          Icons.content_cut,

                        ),



                        const SizedBox(
                            height:18),



                        _titulo(
                            "DURAÇÃO"),


                        _campo(

                          controller:
                          duracaoController,

                          hint:
                          "Ex: 40 minutos",

                          icon:
                          Icons.timer,

                        ),




                        const SizedBox(
                            height:18),





                        _titulo(
                            "VALOR"),


                        _campo(

                          controller:
                          precoController,

                          hint:
                          "Ex: 35.00",

                          icon:
                          Icons.attach_money,

                        ),



                      ],

                    ),

                  ),





                  const SizedBox(
                      height:20),






                  _painel(

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children:[



                        Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children:[


                            Text(

                              "STATUS",

                              style:
                              GoogleFonts.spaceMono(

                                fontWeight:
                                FontWeight.bold,

                              ),

                            ),


                            const SizedBox(
                                height:5),


                            Text(

                              ativo
                              ?
                              "SERVIÇO DISPONÍVEL"

                              :

                              "SERVIÇO OCULTO",

                              style:
                              GoogleFonts.spaceMono(

                                fontSize:12,

                              ),

                            ),

                          ],

                        ),





                        Switch(

                          value:
                          ativo,

                          activeColor:
                          const Color(
                              0xff5F583B),


                          onChanged:(v){

                            setState((){

                              ativo=v;

                            });

                          },

                        ),



                      ],

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
                      salvarServico,


                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        const Color(
                            0xff5F583B),


                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(
                              15),

                        ),

                      ),


                      child:
                      Text(

                        "SALVAR SERVIÇO",

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

          ),

        ],


      ),


      child:child,

    );

  }





  Widget _titulo(String texto){

    return Text(

      texto,

      style:
      GoogleFonts.spaceMono(

        fontWeight:
        FontWeight.bold,

        letterSpacing:1,

      ),

    );

  }





  Widget _campo({

    required TextEditingController controller,

    required String hint,

    required IconData icon,

  }){


    return TextField(

      controller:
      controller,


      decoration:
      InputDecoration(

        hintText:
        hint,


        prefixIcon:
        Icon(icon),


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

    );


  }


}