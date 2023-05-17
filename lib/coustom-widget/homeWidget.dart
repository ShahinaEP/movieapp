import 'package:flutter/material.dart';

import '../AppRouteName/app_route_name.dart';
import '../Const/ConstantValue.dart';
import '../Model/HomePageModel.dart';
import '../pages/details_page.dart';

Widget homeWidget(
    {required String catName,
      required List<MovieDatum> data,
      required BuildContext context,
      required String baseUrl}) {

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(catName,
                  style:  TextStyle(
                    color: ConstantColor.category,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Container(
                  height: 5,
                  width: 50,
                  color: Colors.red,
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ConstantColor.arrowBg,
                    shape: BoxShape.circle,
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: ConstantColor.arrow,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    color:ConstantColor.arrowBg,
                    shape: BoxShape.circle,
                  ),
                  child:  Padding(
                    padding:const EdgeInsets.all(4.0),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:  ConstantColor.arrow,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              itemCount: data.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Details(data[index].id.toString())));
                    Navigator.pushNamed(context,AppRouteName.details,

                        arguments:
                        {

                          "id":"${data[index].id}",
                          "movieName":"${data[index].videoTitle}"

                        }
                        // {

                          //  "MovieId":"${data[index].id}",
                          // "MovieName":'${data[index].videoTitle}'
                         // }
                    );
                    print("data--- ${ data}");
                  },

                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    // height: 100,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        color: ConstantColor.textBg,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width * .3,
                          decoration: BoxDecoration(
                              // color: ConstantColor.titleTxt,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage('$baseUrl${data[index].videoImageThumb}'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(fontSize: 10.0),
                              text: TextSpan(
                                  style:  TextStyle(color: ConstantColor.titleTxt, fontSize: 12, fontWeight: FontWeight.w500),
                                  text: data[index].videoTitle!),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        //   child: Text(data[index].videoTitle!,
                        //     style: const TextStyle(fontWeight: FontWeight.w700),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.white.withOpacity(.5),
                                size: 15,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(data[index].duration!,
                                style: TextStyle(fontSize: 12,color: ConstantColor.titleTxt),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    ),
  );
}