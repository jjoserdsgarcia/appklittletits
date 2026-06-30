// ===============================================================
// IMPORTAÇÕES
// ===============================================================

// Importa o menu lateral personalizado da aplicação.
import 'package:appklittletits/widgets/drawer.dart';

// Biblioteca principal do Flutter.
import 'package:flutter/material.dart';



// ===============================================================
// TELA INICIAL DO FUNCIONÁRIO
// ===============================================================
//
// Tela principal exibida após o login do funcionário.
//
// Atualmente ela contém:
//
// • Menu lateral (Drawer)
// • Barra superior (AppBar)
//
// Como a tela pode receber futuras atualizações,
// foi criada utilizando um StatefulWidget.
class HomeEmployeeScreen extends StatefulWidget {
  const HomeEmployeeScreen({super.key});

  @override
  State<HomeEmployeeScreen> createState() => _HomeEmployeeScreenState();
}



// ===============================================================
// ESTADO DA TELA
// ===============================================================
//
// Nesta classe ficará toda a lógica e interface
// da tela inicial do funcionário.
class _HomeEmployeeScreenState extends State<HomeEmployeeScreen> {

  // =============================================================
  // BUILD
  // =============================================================
  //
  // Método responsável por construir
  // toda a interface da tela.
  @override
  Widget build(BuildContext context) {

    // ===========================================================
    // SCAFFOLD
    // ===========================================================
    //
    // Estrutura principal da tela.
    return Scaffold(

      // =========================================================
      // MENU LATERAL
      // =========================================================
      //
      // Drawer exibido ao deslizar a tela
      // ou tocar no botão do menu.
      drawer: LateralMenu(),

      // =========================================================
      // APPBAR
      // =========================================================
      //
      // Barra superior da aplicação.
      appBar: AppBar(),

    );
  }
}