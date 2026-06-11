import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

/// =======================
/// APP PRINCIPAL
/// =======================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Backrooms System',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF14140D),
      ),
      home: const AuthScreen(),
    );
  }
}

/// =======================
/// LOGIN / CADASTRO
/// =======================
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackroomsBackground(),

          Center(
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1B12).withOpacity(0.85),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFFFF2A6).withOpacity(0.2),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.meeting_room_outlined,
                    size: 60,
                    color: Color(0xFFFFF2A6),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    isLogin ? "LOGIN" : "CADASTRO",
                    style: const TextStyle(
                      color: Color(0xFFFFF2A6),
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _input("Email", emailController),
                  const SizedBox(height: 10),
                  _input("Senha", passController, obscure: true),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2B2B1A),
                      foregroundColor: const Color(0xFFFFF2A6),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    },
                    child: Text(isLogin ? "Entrar" : "Criar conta"),
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin
                          ? "Criar uma conta"
                          : "Já tenho uma conta",
                      style: const TextStyle(
                        color: Color(0xFFFFF2A6),
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

  Widget _input(String hint, TextEditingController c,
      {bool obscure = false}) {
    return TextField(
      controller: c,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF2A2A1A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

/// =======================
/// HOME (APÓS LOGIN)
/// =======================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackroomsBackground(),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.warning_amber, size: 80,
                    color: Color(0xFFFFF2A6)),
                SizedBox(height: 10),
                Text(
                  "LEVEL 0",
                  style: TextStyle(
                    color: Color(0xFFFFF2A6),
                    fontSize: 22,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Humid Hallways • Reality Unstable",
                  style: TextStyle(color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// BACKGROUND (REDUZIDO / MAIS SUAVE)
/// =======================
class BackroomsBackground extends StatefulWidget {
  const BackroomsBackground({super.key});

  @override
  State<BackroomsBackground> createState() => _BackroomsBackgroundState();
}

class _BackroomsBackgroundState extends State<BackroomsBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double noise = 50;

  @override
  void initState() {
    super.initState();

    /// 🔻 MAIS LENTO = MENOS “CADÊNCIA”
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;

        return Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 1.4,
              center: Alignment(
                (t - 0.5) * 0.2, // 🔻 movimento reduzido
                (t - 0.5) * 0.2,
              ),
              colors: [
                const Color(0xFFFFF2A6).withOpacity(0.10), // 🔻 menos brilho
                const Color(0xFF2A2A1A),
                const Color(0xFF0F0F0A),
              ],
            ),
          ),
          child: Opacity(
            opacity: 0.03, // 🔻 ruído quase imperceptível
            child: Container(color: Colors.white),
          ),
        );
      },
    );
  }
}