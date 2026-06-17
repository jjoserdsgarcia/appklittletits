import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterServicesScreen extends StatefulWidget {
  const RegisterServicesScreen({super.key});

  @override
  State<RegisterServicesScreen> createState() => _RegisterServicesScreenState();
}

class _RegisterServicesScreenState extends State<RegisterServicesScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar Serviço"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nome do Serviço"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, insira o nome do serviço";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: "Preço"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, insira o preço";
                  }
                  if (double.tryParse(value) == null) {
                    return "Por favor, insira um número válido";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Descrição"),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      final supabase = Supabase.instance.client;
                      await supabase.from('service').insert({
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'price': priceController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Cadastro de serviço realizado com sucesso!",
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.of(context).pop();
                    } on PostgrestException catch (e) {
                      if (e.code != null && e.code == "23505") {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          SnackBar(
                            content: Text("Serviço já cadastrado"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Falha ao realizar cadastro de serviço",
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
