import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:appklittletits/models/user.dart' as user;

class ProfessionalsScreen extends StatefulWidget {
  const ProfessionalsScreen({
    super.key,
  });

  @override
  State<ProfessionalsScreen> createState() => _ProfessionalsScreenState();
}

class _ProfessionalsScreenState extends State<ProfessionalsScreen> {
  List<user.User> professionals = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProfessionals();
  }

  void searchProfessionals() async {
    final supabase = Supabase.instance.client;
    final professionalsSupabase = await supabase
        .from("user") //
        .select()
        .eq("is_employee", true);
    setState(() {
      professionals = professionalsSupabase.map(
        (e) {
          return user.User(id: e["id"], login: e["login"], isEmployee: e["is_employee"], password: e["password"], fullName: e["full_name"]);
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços Disponíveis"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500,
          ),
          child: ListView.builder(
            itemCount: professionals.length,
            itemBuilder: (context, index) {
              final user.User currentProfessionals = professionals[index];
              return Card(
                elevation: 8.0,
                child: ListTile(
                  leading: Icon(Icons.sports_basketball),
                  title: Text(currentProfessionals.fullName),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
