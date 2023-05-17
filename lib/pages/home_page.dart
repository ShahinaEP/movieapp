import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Movie/movie_bloc.dart';
import '../Model/HomePageModel.dart';
import '../coustom-widget/homeWidget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColor.scaffoldBg,
        appBar: AppBar(
          // backgroundColor: AppColor.scaffoldBg,
          elevation: 0,
          centerTitle: true,
          title:   const Text("BongoFlixBd",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),
          ),
        ),
        body: blocBody()
    );
  }
}
Widget blocBody() {
  return BlocProvider(
    create: (context) => MovieBloc(
    )..add(LoadMovieEvent()),
    child: BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MovieError) {
          return const Center(child:  Text("Error"));
        }
        if (state is MovieLoaded) {
          HomePageModel home = state.movie;
          return
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                         "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an "
                         "unknown printer took a galley it.",
                       textAlign: TextAlign.justify,style: TextStyle(
                         fontSize: 17,
                         color: Color(0xff0C090A),
                         // color: Colors.black54,
                         fontWeight: FontWeight.normal,
                         fontFamily: 'Roboto',

                       ),
                     ),
                   ),
                  const SizedBox(height: 25,),
                  homeWidget(catName: 'Drama', data:home.videoStreamingApp!.drama!.data! , context: context, baseUrl: home.videoStreamingApp!.imgVideoUrl!),
                  const SizedBox(height: 25,),
                  homeWidget(catName: 'Web Series', data:home.videoStreamingApp!.webSeries!.data! , context: context, baseUrl: home.videoStreamingApp!.imgVideoUrl!),
                  const SizedBox(height: 25,),
                  homeWidget(catName: 'Comedy show', data:home.videoStreamingApp!.comedyShow!.data! , context: context, baseUrl: home.videoStreamingApp!.imgVideoUrl!),
                  const SizedBox(height: 25,),
                  homeWidget(catName: 'Jokes', data:home.videoStreamingApp!.jokesAndStandUpComedy!.data! , context: context, baseUrl: home.videoStreamingApp!.imgVideoUrl!),
                  const SizedBox(height: 25,),
                ],
              ),
            );
        }

        return Container();
      },
    ),
  );
}