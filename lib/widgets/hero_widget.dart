import 'package:flutter/material.dart';
import 'package:storyloom/widgets/topbar_widget.dart';
import 'package:video_player/video_player.dart';

class HeroComponent extends StatefulWidget {
  const HeroComponent({super.key});

  @override
  _HeroComponentState createState() => _HeroComponentState();
}

class _HeroComponentState extends State<HeroComponent> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/images/WithNightFilterSlow.mp4')
          ..initialize().then((_) {
            setState(() {
              print("Video initialized successfully"); // Debugging
            });
            _controller.setLooping(true);
            _controller.play();
          }).catchError((error) {
            print("Error initializing video: $error"); // Error handling
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
        Center(
          child: Text(
            'Storyloom - Discover the World Around',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const TopBarWidget(),
      ],
    );
  }
}
