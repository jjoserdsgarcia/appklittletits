import 'package:appklittletits/screens/cliente/horarios_screen.dart';
import 'package:appklittletits/screens/cliente/meus_agendamentos_screen.dart';
import 'package:appklittletits/screens/cliente/novo_agendamento_screen.dart';
import 'package:appklittletits/screens/cliente/profissionais_screen.dart';
import 'package:appklittletits/screens/cliente/servicos_screen.dart';
import 'package:appklittletits/screens/funcionario/home_funcionario_screen.dart';
import 'package:appklittletits/screens/funcionario/horarios_trabalho_screen.dart';
import 'package:appklittletits/screens/funcionario/services_screen.dart';
import 'package:flutter/material.dart';

class LateralMenuEmployee extends StatelessWidget {
  const LateralMenuEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu do Funcionário',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HomeEmployeeScreen();
                  },
                ),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.history),
            title: Text('Horários Disponíveis'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HorariosTrabalhoScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Serviços'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ServicesScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
