import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);
  // final String videoUrl;
  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  // final String videoUrl = '"https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"'
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=cUraBWFuwyU');
    _controller.addListener(() {
      if (_controller.value.isPlaying != _isPlaying) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width:size.width,
                  height: 230,
                  child: Image.network("https://img.attacker.tv/resize/1284x773/b7/67/b7672c148127d5f9041a1dc9feb33f15/b7672c148127d5f9041a1dc9feb33f15.jpg")),
              SizedBox(
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: size.width,
                    height: 230,
                    // width: _controller.value.size.width,
                    // height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50, color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: IconButton(
                  onPressed: () {
                    // TODO: Handle download button pressed
                  },
                  icon: const Icon(Icons.download),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 40,
                child: IconButton(
                  onPressed: () {
                    // TODO: Handle share button pressed
                  },
                  icon: Icon(Icons.share),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down "
                "a mysterious pipe and wander into a magical new world. But when the "
                "brothers are separated, Mario embarks on an epic quest to find Luigi.",textAlign: TextAlign.justify,style: TextStyle(
              fontSize: 18,
              color: Color(0xff0C090A),
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',

            ),),
          ),
        ],
      ),
    );
  }
}
