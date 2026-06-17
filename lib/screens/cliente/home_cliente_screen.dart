import 'package:flutter/material.dart';

class HomeClientScreen extends StatefulWidget {
  const HomeClientScreen({super.key});

  @override
  State<HomeClientScreen> createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home do Cliente"),
      ),
      body: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu do Cliente',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Agendar Serviço'),
              onTap: () {
                // Navegar para a tela de Agendamento
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Histórico de Agendamentos'),
              onTap: () {
                // Navegar para a tela de Histórico
              },
            ),
          ],
        ),
      ),
    );
  }
}
