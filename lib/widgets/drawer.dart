import 'package:appklittletits/screens/cliente/horarios_screen.dart';
import 'package:appklittletits/screens/cliente/meus_agendamentos_screen.dart';
import 'package:appklittletits/screens/cliente/novo_agendamento_screen.dart';
import 'package:appklittletits/screens/cliente/profissionais_screen.dart';
import 'package:appklittletits/screens/cliente/servicos_screen.dart';
import 'package:flutter/material.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({super.key});

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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NovoAgendamentoScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Histórico de Agendamentos'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return MyAgendaScreen(dia: '', barbeiro: '', horario: '', servico: '',);
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
                    return AvailableAgenda(servico: '',);
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
                    return AvailableServicesScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Profissionais'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProfessionalsScreen();
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
