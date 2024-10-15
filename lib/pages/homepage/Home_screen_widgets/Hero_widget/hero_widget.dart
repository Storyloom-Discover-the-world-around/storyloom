import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  HeroSectionState createState() => HeroSectionState();
}

class HeroSectionState extends State<HeroSection> {
  late VideoPlayerController _controller;
  bool _hasInteracted = true;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/images/WithNightFilterSlow.mp4')
          ..initialize().then((_) {
            setState(() {
              _controller.setLooping(true);
              if (_hasInteracted) {
                _controller.play(); // Play if user has already interacted
              }
            });
          }).catchError((error) {
            debugPrint("Error initializing video: $error"); // Error handling
          });
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is removed
    super.dispose();
  }

  void _onUserInteraction() {
    if (!_hasInteracted) {
      setState(() {
        _hasInteracted = true; // Mark interaction
      });
      _controller.play(); // Start playing on interaction
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onUserInteraction, // Trigger video play on tap
      child: Stack(
        children: <Widget>[
          // Video background covering full screen
          _controller.value.isInitialized
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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

          // Overlay text and content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Discover, Read,\nand Learn Across Cultures.',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.9),
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.9),
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Explore captivating stories and dive into magical worlds.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                      shadows: [
                        Shadow(
                          blurRadius: 8.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
