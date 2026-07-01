import 'package:appklittletits/models/service.dart';
import 'package:appklittletits/screens/cliente/novo_agendamento_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeClientScreen extends StatefulWidget {
  const HomeClientScreen({
    super.key,
  });

  @override
  State<HomeClientScreen> createState() => _HomeClientScreenState();
}

class _HomeClientScreenState extends State<HomeClientScreen> {
  List<Service> cortes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchServices();
  }

  void searchServices() async {
    final supabase = Supabase.instance.client;
    final servicesSupabase = await supabase
        .from("service") //
        .select();
    setState(() {
      cortes = servicesSupabase.map(
        (e) {
          return Service(
            id: e["id"],
            name: e["name"],
            description: e["description"],
            price: (e["price"] / 100),
          );
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: ListView.builder(
            itemCount: cortes.length,
            itemBuilder: (context, index) {
              final Service currentService = cortes[index];
              return Card(
                elevation: 8.0,
                child: ListTile(
                  leading: Icon(Icons.sports_basketball),
                  title: Text(currentService.description),
                  subtitle: Text("Preço: ${currentService.price}"),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) {
                    return NovoAgendamentoScreen();
                  },
                ),
              )
              .then(
                (value) {
                  if (value != null) {
                    print("value: $value");
                  }
                  NovoAgendamentoScreen();
                },
              );
        },
      ),
    );
  }
}
