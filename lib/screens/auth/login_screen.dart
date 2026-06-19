import 'package:appklittletits/models/utils.dart';
import 'package:appklittletits/screens/auth/cadastro_screen.dart';
import 'package:appklittletits/screens/cliente/home_cliente_screen.dart';
import 'package:appklittletits/screens/funcionario/home_funcionario_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFB7A44B),

    appBar: AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF6E5B17),
      centerTitle: true,
      title: const Text(
        "LEVEL 0 TERMINAL",
        style: TextStyle(
          letterSpacing: 4,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    body: Stack(
      children: [

        // Luz superior
        Positioned(
          top: -80,
          left: -80,
          right: -80,
          child: Center(
            child: Container(
              width: 700,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(.45),
                    blurRadius: 150,
                    spreadRadius: 50,
                  ),
                ],
              ),
            ),
          ),
        ),

        // Vinheta
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1.4,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(.15),
                  Colors.black.withOpacity(.45),
                ],
              ),
            ),
          ),
        ),

        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),

            child: Container(

              constraints: const BoxConstraints(maxWidth: 430),

              padding: const EdgeInsets.all(30),

              decoration: BoxDecoration(

                color: const Color(0xFFE7DA91),

                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color: const Color(0xFF6D5B17),
                  width: 3,
                ),

                boxShadow: [

                  BoxShadow(
                    color: Colors.black.withOpacity(.35),
                    blurRadius: 20,
                  ),

                  BoxShadow(
                    color: Colors.yellow.withOpacity(.35),
                    blurRadius: 45,
                    spreadRadius: 5,
                  ),

                ],

              ),

              child: Form(
                key: formKey,
                child: Column(
                  children: [

// LOGO M.E.G  
Container(
  width: 170,
  height: 170,

  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(22),

    

    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 117, 116, 56).withOpacity(.4),
        blurRadius: 50,
        spreadRadius: 4,
      ),
    ],
  ),

  clipBehavior: Clip.antiAlias,

  child: Image.asset(
    "assets/images/meg.png",
    fit: BoxFit.cover,
  ),
),
                    const SizedBox(height: 20),

                    const Text(
                      "M.E.G",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 8,
                        color: Color(0xFF5C470F),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "LEVEL 0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        fontSize: 17,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "TERMINAL • ONLINE",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: "monospace",
                          letterSpacing: 2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    TextFormField(
                      controller: loginController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF8F3C5),

                        labelText: "Usuário",

                        prefixIcon: const Icon(Icons.person),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
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

                    TextFormField(
                      controller: passwordController,
                      obscureText: hidePassword,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF8F3C5),

                        labelText: "Senha",

                        prefixIcon: const Icon(Icons.lock),

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório!";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6D5B17),
                          foregroundColor: Colors.white,
                          elevation: 10,
                        ),

                        onPressed: () async {

                          // COLE AQUI O SEU onPressed ATUAL

                        },

                        child: const Text(
                          "ACESSAR LEVEL 1",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const CadastroScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "CRIAR NOVO REGISTRO",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),

                  ],
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