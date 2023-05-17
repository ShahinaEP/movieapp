import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../Bloc/moveDetails/details_bloc.dart';
import '../Model/HomePageModel.dart';
import '../Model/MovieDetails.dart';
import '../coustom-widget/homeWidget.dart';
import '../httpService/MovieDetails.dart';

class Details extends StatefulWidget {
  // List<MovieDatum> data;
  // String id;
  Details({Key? key}) : super(key: key); //this.data,this.id,

  @override
  State<Details> createState() => _DetailsState(); //data
}

class _DetailsState extends State<Details> {
  // String id;
  // _DetailsState(this.id);
  late VideoPlayerController _controller;
  bool _isPlaying = false;

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

    final argument = (ModalRoute.of(context)!.settings.arguments??<String, dynamic>{}) as Map;
    // print(argument["MovieId"]);
    var movieName;
    return Scaffold(
      appBar: AppBar(
        title: Text("${argument['movieName']}"),
        centerTitle: true,
      ),
      body: blocBody(argument['id']),
    );
  }
}
Widget blocBody(id) {
  return BlocProvider(
    create: (context) => DetailsBloc(id
    )..add(GetDetailsEvent()),
    child: BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        if (state is MovieLoading) {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieError) {
          return const Center(child:  Text("Error"));
        }
        if (state is MovieLoaded) {
          MovieDetailsModel movieData = state.movie;
          Size size = MediaQuery.of(context).size;
          return Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: size.width,
                      height: 230,
                      child: Image.network("${movieData.videoStreamingApp?.movieImage}")),
                  SizedBox(
                    width: size.width,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: size.width,
                        height: 230,
                        // width: _controller.value.size.width,
                        // height: _controller.value.size.height,
                        // child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (_isPlaying) {
                          //   _controller.pause();
                          // } else {
                          //   _controller.play();
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Icon(
                            // _isPlaying ?
                            // Icons.pause ,
                                // :
                            Icons.play_arrow,
                            size: 50,
                            color: Colors.black,
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
              const SizedBox(
                height: 15,
              ),
              // Text("${argument}"),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${movieData.videoStreamingApp?.description}",
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff0C090A),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Row(
                      children:  [
                        const Text("Duration :"),
                         Text("${movieData.videoStreamingApp?.movieDuration}")
                      ],
                    ),
                    Row(
                      children:  [
                        const Text("Release :"),
                        Text("${movieData.videoStreamingApp?.releaseDate}")
                      ],
                    ),
                    // homeWidget(catName: 'Related Movies', data: movieData!.videoStreamingApp!.relatedMovies!, context: null, baseUrl: '',)
                  ],
                ),
              ),
            ],
          );

        }

        return Container();
      },
    ),
  );
}