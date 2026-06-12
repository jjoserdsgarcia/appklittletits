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
  final isEmployeeController = TextEditingController();
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
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFD9D08C),
                Color(0xFFC8C17A),
                Color(0xFFB0A85F),
              ],
            ),
          ),
        ),

        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 300,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 50,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),

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
                    color: const Color(0xFFE7E0A3).withOpacity(0.95),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xFF6B653A),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 25,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          child: const Icon(
                            Icons.vpn_key,
                            size: 45,
                            color: Color(0xFF4F4A2A),
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Liminal Barber Shop",
                          style: TextStyle(
                            color: Color(0xFF2B2818),
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          "AUTHORIZED PERSONNEL ONLY",
                          style: TextStyle(
                            color: Colors.black54,
                            letterSpacing: 3,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(height: 30),

                        TextFormField(
                          controller: fullNameController,
                          style: const TextStyle(
                            color: Color(0xFF2B2818),
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            labelText: "Nome completo",
                            labelStyle: const TextStyle(
                              color: Color(0xFF4F4A2A),
                            ),
                            prefixIcon: const Icon(
                              Icons.badge_outlined,
                              color: Color(0xFF4F4A2A),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF2EDB5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7C7646),
                                width: 2,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4F4A2A),
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

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: loginController,
                          style: const TextStyle(
                            color: Color(0xFF2B2818),
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            labelText: "Login",
                            labelStyle: const TextStyle(
                              color: Color(0xFF4F4A2A),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xFF4F4A2A),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF2EDB5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7C7646),
                                width: 2,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4F4A2A),
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

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: passwordController,
                          obscureText: obscureText,
                          style: const TextStyle(
                            color: Color(0xFF2B2818),
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: const TextStyle(
                              color: Color(0xFF4F4A2A),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF4F4A2A),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF4F4A2A),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF2EDB5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7C7646),
                                width: 2,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4F4A2A),
                                width: 3,
                              ),
                            ),
                          ),
                          validator: passwordValidator,
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F4A2A),
                              foregroundColor: const Color(0xFFF2EDB5),
                              elevation: 15,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            onPressed: () async {
                              // MANTÉM EXATAMENTE SEU CÓDIGO AQUI
                            },
                            child: const Text(
                              "ACESSAR SISTEMA",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
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