import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TransitionScreen extends StatefulWidget {
  final Widget nextScreen;

  const TransitionScreen({
    super.key,
    required this.nextScreen,
  });

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(
      'assets/videos/backrooms_transition.mp4',
    );

    _videoController.initialize().then((_) {
      if (!mounted) return;

      setState(() {});
      _videoController.play();
    });

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

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_videoController.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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