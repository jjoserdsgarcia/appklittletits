import 'package:appklittletits/models/service.dart';
import 'package:appklittletits/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AvailableServicesScreen extends StatefulWidget {
  const AvailableServicesScreen({
    super.key,
  });

  @override
  State<AvailableServicesScreen> createState() => _AvailableServicesScreenState();
}

class _AvailableServicesScreenState extends State<AvailableServicesScreen> {
  List<Service> services = [];

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
      services = servicesSupabase.map(
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
      drawer: LateralMenu(),
      appBar: AppBar(
        title: Text("Tela Esportes"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final Service currentService = services[index];
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
    );
  }
}
