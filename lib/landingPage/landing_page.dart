import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:web_portfolio/model/sliderModel.dart';


class LandingPage extends StatelessWidget {

  List<SliderModel> sliderItems = [


    SliderModel(image: "assets/images/ss3.png"),
    SliderModel(image: "assets/images/ss4.png"),
    SliderModel(
      image: "assets/images/ss5.png",
    ),
    SliderModel(image: "assets/images/ss6.png"),
    SliderModel(image: "assets/images/ss7.png"),
    SliderModel(
      image: "assets/images/ss8.png",
    ),
    SliderModel(image: "assets/images/ss9.png"),
    SliderModel(image: "assets/images/ss10.png"),
    SliderModel(
      image: "assets/images/ss11.png",
    ),
    SliderModel(image: "assets/images/ss12.png"),
    SliderModel(image: "assets/images/ss13.png"),
    SliderModel(
      image: "assets/images/ss14.png",
    ),
    SliderModel(image: "assets/images/ss15.png"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pageChildren(double width) {
      return <Widget>[
        Container(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flutter Developer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "‘Motivated Young Professional with an exemplary academic record\n and passion to progress with in an IT industry’\n\n",
                      style: TextStyle(fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),Text(
                      "Skilled Flutter Developer with 1+ year of strong experience in Mobile App Development with willingness to learn and master Front End Development.",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),

                    // Text(
                    //   "Having acheived excellent grades at BS Computer Science, along with an active involvement in a number of clubs and society. I am keen to pursue a career in the IT industry. ",
                    //   style: TextStyle(fontSize: 16.0, color: Colors.white),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  showDialog(
                    context: context,

                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text('Swipe Left or Right')),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(
                                Radius.circular(10.0))),
                        content: Builder(
                          builder: (context) {
                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                            var height = MediaQuery
                                .of(context)
                                .size
                                .height;
                            var width = MediaQuery
                                .of(context)
                                .size
                                .width;

                            return Container(
                              height: height * 0.5,
                              width: width * 0.3,
                              child:
                              CarouselSlider.builder(

                                itemCount: sliderItems.length,
                                itemBuilder: (context, itemIndex, pageIndex) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        "${sliderItems[itemIndex].image}",
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.35,
                                  autoPlay: true,


                                ),
                              ),
                            );
                          },
                        ),

                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children : <Widget>[
                        //
                        //     CustomButton(text: "Individual Account",onTap: (){}),
                        //     SizedBox(height: 50,),
                        //     CustomButton(text: "Corporate Account",onTap: (){})
                        //   ],
                        // ),


                      );
                    },
                  );
                },
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Text(
                    "Portfolio",
                    style:
                    TextStyle(color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 300,
              child: ClipRRect(

                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(
                    "assets/images/uk.png",
                    width: width,
                  ))),
        )
      ];
    }
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pageChildren(constraints.biggest.width / 2),
        );
      } else {
        return Column(
          children: pageChildren(constraints.biggest.width),
        );
      }
    });
  }

  downloadFile(url) {
    AnchorElement anchorElement = new AnchorElement(href: url);
    anchorElement.download = "Usman Resume";
    anchorElement.click();
  }
}
