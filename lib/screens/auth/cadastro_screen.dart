import 'dart:ui';

import 'package:appklittletits/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório!';
    }

    // Regex para validação
    final regex = RegExp(
      r'^(?=.*[a-z])' // pelo menos 1 letra minúscula
      r'(?=.*[A-Z])' // pelo menos 1 letra maiúscula
      r'(?=.*\d)' // pelo menos 1 número
      r'(?=.*[@$!%*?&\-_#])' // pelo menos 1 caractere especial
      r'[A-Za-z\d@$!%*?&\-_#]{12,}$', // mínimo de 12 caracteres
    );

    if (!regex.hasMatch(value)) {
      return 'A senha deve ter no mínimo 12 caracteres, incluindo maiúsculas, minúsculas, números e caracteres especiais';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8C17A),

      body: Stack(
        children: [
          /////////////////////////////////////////////////////////////
          // FUNDO
          /////////////////////////////////////////////////////////////
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFD9D08C),
                    Color(0xFFC8C17A),
                    Color(0xFFB0A85F),
                    Color(0xFF918844),
                  ],
                ),
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // TEXTURA DA PAREDE
          /////////////////////////////////////////////////////////////
          Positioned.fill(
            child: Opacity(
              opacity: .06,
              child: Image.asset(
                "assets/images/wall_texture.png",
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // RUÍDO CRT
          /////////////////////////////////////////////////////////////
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: .03,
                child: Image.asset(
                  "assets/so/noise.png",
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                ),
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // NÉVOA
          /////////////////////////////////////////////////////////////
          Positioned.fill(
            child: IgnorePointer(
              child: Opacity(
                opacity: .08,
                child: Image.asset(
                  "assets/images/fog.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // DESFOQUE
          /////////////////////////////////////////////////////////////
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // LUZ DO TETO
          /////////////////////////////////////////////////////////////
          Positioned(
            top: 45,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 340,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(.9),
                      blurRadius: 70,
                      spreadRadius: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // PARTÍCULAS
          /////////////////////////////////////////////////////////////
          IgnorePointer(
            child: Stack(
              children: List.generate(
                180,
                (i) => Positioned(
                  left: (i * 53 % 1500).toDouble(),
                  top: (i * 71 % 900).toDouble(),
                  child: Opacity(
                    opacity: .18,
                    child: Container(
                      width: 2,
                      height: 2,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // VINHETA
          /////////////////////////////////////////////////////////////
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.35,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(.15),
                    Colors.black.withOpacity(.45),
                  ],
                ),
              ),
            ),
          ),

          /////////////////////////////////////////////////////////////
          // FORMULÁRIO
          /////////////////////////////////////////////////////////////
          Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 500,
                  maxWidth: 800,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Container(
                    padding: const EdgeInsets.all(32),

                    decoration: BoxDecoration(
                      color: const Color(0xFFE7E0A3).withOpacity(.94),

                      borderRadius: BorderRadius.circular(8),

                      border: Border.all(
                        color: const Color(0xFF6B653A),
                        width: 2,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.45),
                          blurRadius: 35,
                          spreadRadius: 3,
                        ),

                        BoxShadow(
                          color: Colors.yellow.withOpacity(.20),
                          blurRadius: 60,
                          spreadRadius: 10,
                        ),
                      ],
                    ),

                    child: Form(
                      key: formKey,

                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          //////////////////////////////////////////////////////
                          // LOGO M.E.G.
                          //////////////////////////////////////////////////////
                          Container(
                            width: 120,
                            height: 120,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              color: Colors.black,

                              border: Border.all(
                                color: Colors.greenAccent,
                                width: 2,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.greenAccent.withOpacity(.45),
                                  blurRadius: 30,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),

                            padding: const EdgeInsets.all(12),

                            child: Image.asset(
                              "assets/images/meg.png",
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            "M.E.G.",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 6,
                              color: Color(0xFF2B2818),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.black87,

                              borderRadius: BorderRadius.circular(6),

                              border: Border.all(
                                color: Colors.amber,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withOpacity(.25),
                                  blurRadius: 12,
                                ),
                              ],
                            ),

                            child: const Text(
                              "AUTHORIZED PERSONNEL ONLY",
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontFamily: "monospace",
                                letterSpacing: 3,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          Container(
                            width: double.infinity,

                            padding: const EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color: Colors.black,

                              borderRadius: BorderRadius.circular(6),
                            ),

                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "STATUS : ONLINE",
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontFamily: "monospace",
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  "LOCATION : LEVEL 0",
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontFamily: "monospace",
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  "ACCESS : AUTHORIZED",
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontFamily: "monospace",
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 35),

                          //////////////////////////////////////////////////////
                          // CAMPO NOME
                          //////////////////////////////////////////////////////
                          TextFormField(
                            controller: fullNameController,

                            cursorColor: const Color.fromARGB(255, 0, 0, 0),

                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),

                            decoration: InputDecoration(
                              labelText: "Nome completo",

                              floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),

                              prefixIcon: const Icon(
                                Icons.badge_outlined,
                              ),


                              prefixIconColor:
                                  const Color.fromARGB(255, 0, 0, 0),


                              filled: true,

                              fillColor: const Color(0xFFF2EDB5),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),

                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF7C7646),
                                  width: 2,
                                ),
                              ),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF00FF7F),
                                  width: 3,
                                ),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório!";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          //////////////////////////////////////////////////////
                          // CAMPO LOGIN
                          //////////////////////////////////////////////////////
                          TextFormField(
                            controller: loginController,
                            cursorColor: const Color.fromARGB(255, 0, 0, 0),

                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),

                            decoration: InputDecoration(
                              labelText: "Login",

                              floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),

                              prefixIcon: const Icon(Icons.person_outline),


                              prefixIconColor:
                                  const Color.fromARGB(255, 0, 0, 0),


                              filled: true,
                              fillColor: const Color(0xFFF2EDB5),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),

                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF7C7646),
                                  width: 2,
                                ),
                              ),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF00FF7F),
                                  width: 3,
                                ),
                              ),
                            ),

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Campo obrigatório!";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          //////////////////////////////////////////////////////
                          // CAMPO SENHA
                          //////////////////////////////////////////////////////
                          TextFormField(
                            controller: passwordController,
                            obscureText: obscureText,

                            cursorColor: const Color.fromARGB(255, 0, 0, 0),

                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),

                            decoration: InputDecoration(
                              labelText: "Senha",

                              floatingLabelStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),

                              prefixIcon: const Icon(Icons.lock_outline),


                             
                              prefixIconColor:
                                  const Color.fromARGB(255, 0, 0, 0),

                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: Icon(
                                  obscureText ? Icons.visibility : Icons.visibility_off,
                                  color: const Color(0xFF00FF7F),
                                ),
                              ),

                              filled: true,
                              fillColor: const Color(0xFFF2EDB5),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),

                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF7C7646),
                                  width: 2,
                                ),
                              ),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF00FF7F),
                                  width: 3,
                                ),
                              ),
                            ),

                            validator: passwordValidator,
                          ),

                          const SizedBox(height: 35),

                          //////////////////////////////////////////////////////
                          // BOTÃO CADASTRAR
                          //////////////////////////////////////////////////////
                          SizedBox(
                            width: double.infinity,
                            height: 65,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,

                                foregroundColor: const Color(0xFF00FF7F),

                                elevation: 20,

                                shadowColor: const Color(0xFF00FF7F),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),

                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    final supabase = Supabase.instance.client;

                                    await supabase.from('user').insert({
                                      'full_name': fullNameController.text,
                                      'login': loginController.text,
                                      'password': Utils.gerarMd5(
                                        passwordController.text,
                                      ),
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Cadastro realizado com sucesso!",
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );

                                    Navigator.of(context).pop();
                                  } on PostgrestException catch (e) {
                                    if (e.code == "23505") {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Login já está em uso",
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } catch (_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Falha ao realizar cadastro",
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },

                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                  Icon(
                                    Icons.login_rounded,
                                    size: 26,
                                  ),

                                  SizedBox(width: 12),

                                  Text(
                                    "CADASTRAR-SE",
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3,
                                      shadows: [
                                        Shadow(
                                          color: Color(0xFF00FF7F),
                                          blurRadius: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 25),

                          const Divider(
                            color: Color(0xFF6B653A),
                            thickness: 2,
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            "M.E.G. DATABASE TERMINAL",
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontFamily: "monospace",
                              fontSize: 14,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            "LEVEL 0 • M.E.G CORPORATION",
                            style: TextStyle(
                              color: Color(0xFF4F4A2A),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
