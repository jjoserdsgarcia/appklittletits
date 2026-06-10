import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  bool esconderSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Barbearia"),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),

            child: Column(
              children: [

                const Icon(
                  Icons.content_cut,
                  size: 100,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Bem-vindo",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Faça login para continuar",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: senhaController,
                  obscureText: esconderSenha,

                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: const OutlineInputBorder(),

                    prefixIcon: const Icon(Icons.lock),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          esconderSenha = !esconderSenha;
                        });
                      },
                      icon: Icon(
                        esconderSenha
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Entrar"),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {},
                  child: const Text("Criar conta"),
                ),

                TextButton(
                  onPressed: () {},
                  child: const Text("Esqueci minha senha"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}