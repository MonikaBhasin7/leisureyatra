import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_yatra/controller/HomeController.dart';
import 'package:travel_yatra/model/IntroImagesResponse.dart';
import 'package:travel_yatra/screens/form/FormScreen.dart';
import 'package:travel_yatra/utils/ColorConstants.dart';
import 'package:travel_yatra/utils/LocationUtils.dart';
import 'package:travel_yatra/utils/TextStyles.dart';

import '../../utils/GlobalWidgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _homeController = Get.put(HomeController(LocationUtils()));

  @override
  void initState() {
    super.initState();
    _homeController.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              IntroHomeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroHomeWidget extends StatelessWidget {

  var introResponse = json.encode({"domestic_tour":[{"image":"https://images.unsplash.com/photo-1616787671803-e660b92c0d25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWF0aHVyYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60","place_name":"Varindavan Tour","place_cost":"INR 3,999"},{"image":"https://images.unsplash.com/photo-1590050752117-238cb0fb12b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8a2VyYWxhfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60","place_name":"Kerala Tour","place_cost":"INR 12,999"},{"image":"https://images.unsplash.com/photo-1605649487212-47bdab064df7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGltYWNoYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","place_name":"Himachal Tour","place_cost":"INR 7,999"},{"image":"https://images.unsplash.com/photo-1587295656906-b06dca8f2340?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFqYXN0aGFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60","place_name":"Rajasthan Tour","place_cost":"INR 8,499"},{"image":"https://images.unsplash.com/photo-1587922546307-776227941871?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z29hfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60","place_name":"Goa Tour","place_cost":"INR 4,999"}],"international_tour":[{"image":"https://images.unsplash.com/photo-1533682805518-48d1f5b8cd3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aG9uZ2tvbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","place_name":"Hongkong Tour","place_cost":null},{"image":"https://images.unsplash.com/flagged/photo-1562503542-2a1e6f03b16b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2luZ2Fwb3JlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60","place_name":"Singapore Tour","place_cost":null},{"image":"https://images.unsplash.com/photo-1573843981267-be1999ff37cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWFsZGl2ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","place_name":"Maldives Tour","place_cost":null},{"image":"https://images.unsplash.com/photo-1512453979798-5ea266f8880c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZHViYWl8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60","place_name":"Dubai Tour","place_cost":null}]});
  @override
  Widget build(BuildContext context) {
    List<TourData>? domesticTourList = IntroImagesResponse.fromJson(json.decode(introResponse)).domesticTour;
    List<TourData>? internationalTourList = IntroImagesResponse.fromJson(json.decode(introResponse)).internationalTour;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8,),
        Padding(padding: EdgeInsets.only(left: 16),child: Text("Hi Stranger,", style: textStyleWithSizeColorWeight(20.0, tvHeadingColor, FontWeight.w500),)),
        const SizedBox(height: 12,),
        Padding(padding: EdgeInsets.only(left: 16), child: Text("Where do you\nwanna go?", style: textStyleWithSizeColorWeight(26.0, tvHeadingColor, FontWeight.w800),)),
        const SizedBox(height: 24,),
        Padding(padding: EdgeInsets.only(left: 8),child: Text("Domestic Tours", style: textStyleWithSizeColorWeight(20.0, tvHeadingColor, FontWeight.w600),)),
        const SizedBox(height: 8,),
        getCarouselWidget(domesticTourList ?? []),
        const SizedBox(height: 24,),
        Padding(padding: EdgeInsets.only(left: 8),child: Text("International Tours", style: textStyleWithSizeColorWeight(20.0, tvHeadingColor, FontWeight.w600),)),
        const SizedBox(height: 8,),
        getCarouselWidget(internationalTourList ?? []),
        const SizedBox(height: 24,),
      ],
    );
  }

  Widget getCarouselWidget(List<TourData> tourList) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction:0.92,
        autoPlay: true,
        height: 200.0,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: tourList?.map((e) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                       FormScreen(e.placeName)));
                  },
                  child: Stack(
                    children: [
                      Image.network(
                        e.image ?? "",
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Container(
                          padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: purple_1
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.placeName ?? "",
                                style: textStyleWithSizeColorWeight(
                                    18.0, Colors.white, FontWeight.w700),
                              ),
                              Visibility(
                                visible: e.placeCost != null,
                                child: Text(
                                  e.placeCost ?? "",
                                  style: textStyleWithSizeColorWeight(
                                      16.0, Colors.white, FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(child: Icon(Icons.subject, size: 28,), padding: EdgeInsets.all(16),),
        CurrentLocationWidget(),
        Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatar(
            child: Image.asset("assets/image/img_avatar.png"),
          ),
        )
      ],
    );
  }

}

class CurrentLocationWidget extends StatelessWidget{
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (_homeController.currentPosition.value == "")
          ? Lottie.asset("assets/lottie/dot_loader.json", width: 30, height: 20, repeat: true)
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: primary_color,
                ),
                Text(
                  _homeController.currentPosition.value ?? "",
                  style: textStyleWithSizeColorWeight(
                      16.0, tvHeadingColor, FontWeight.w500),
                )
              ],
            );
    });
  }
}