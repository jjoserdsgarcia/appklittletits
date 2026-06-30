import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// =======================================================
/// TELA DE TRANSIÇÃO
/// Responsável por reproduzir um vídeo de introdução
/// antes de abrir a próxima tela do sistema.
/// =======================================================
class TransitionScreen extends StatefulWidget {

  /// Tela que será aberta após o término do vídeo.
  final Widget nextScreen;

  const TransitionScreen({
    super.key,
    required this.nextScreen,
  });

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {

  // =======================================================
  // CONTROLLER DO VÍDEO
  // Responsável por controlar reprodução, pausa e estado
  // do vídeo de transição.
  // =======================================================
  late VideoPlayerController _videoController;

  // =======================================================
  // INICIALIZAÇÃO DA TELA
  // =======================================================
  @override
  void initState() {
    super.initState();

    // =======================================================
    // CARREGA O VÍDEO LOCAL
    // =======================================================
    _videoController = VideoPlayerController.asset(
      'assets/videos/backrooms_transition.mp4',
    );

    // =======================================================
    // INICIALIZA O VÍDEO
    // Após carregar, atualiza a interface e inicia
    // automaticamente a reprodução.
    // =======================================================
    _videoController.initialize().then((_) {

      if (!mounted) return;

      setState(() {});

      _videoController.play();
    });

    // =======================================================
    // MONITORA O FIM DA REPRODUÇÃO
    // Quando o vídeo terminar, abre a próxima tela.
    // =======================================================
    _videoController.addListener(() {

      if (!mounted) return;

      final value = _videoController.value;

      if (value.isInitialized &&
          value.position >= value.duration &&
          !value.isPlaying) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => widget.nextScreen,
          ),
        );
      }
    });
  }

  // =======================================================
  // LIBERAÇÃO DE MEMÓRIA
  // Remove o controller quando a tela é destruída.
  // =======================================================
  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  // =======================================================
  // INTERFACE DA TELA
  // =======================================================
  @override
  Widget build(BuildContext context) {

    // =======================================================
    // TELA DE CARREGAMENTO
    // Exibida enquanto o vídeo ainda está sendo inicializado.
    // =======================================================
    if (!_videoController.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // =======================================================
    // REPRODUÇÃO DO VÍDEO
    // O vídeo ocupa toda a tela mantendo sua proporção.
    // =======================================================
    return Scaffold(
      backgroundColor: Colors.black,

      body: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,

          child: SizedBox(
            width: _videoController.value.size.width,
            height: _videoController.value.size.height,

            child: VideoPlayer(_videoController),
          ),
        ),
      ),
    );
  }
}