import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:spotlas/app/main_screen/models/post_object.dart';

import '../../cores/color_constant.dart';
import '../../cores/constants.dart';
import '../../cores/size_utils.dart';
import '../../main.dart';
import '../widgets/image_slider.dart';
import 'controller/main_controller.dart';
import 'package:flutter/material.dart';

import 'models/main_model.dart';

class MainScreen extends GetWidget<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed",
        style: TextStyle(color: Colors.black),


        ),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Obx(() => controller.loading.value
          ?  Align(
          alignment: Alignment.center,
          child: SizedBox(
              height: Get.height,

              child: const Center(
                child: SizedBox(
                    height: 40,
                    child: CircularProgressIndicator(color: Colors.black,)),
              )))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allPostsList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.57,
                      width: Get.width,
                      child: mainScreenModel(allPostsList[index], index),
                    ),
                    actionButtons(allPostsList[index], index),
                  ],
                );
              },
            )),
    ));
  }

  Widget mainScreenModel(Post post, int index) {
    List images = [];

    for (int i = 0; i < post.media!.length; i++) {
      images.add(post.media![i].url);
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(width: Get.width, child: imageSlider(images,index)),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getPaddingSize("s"),
                      bottom: getPaddingSize("s"),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  40.00,
                                ),
                              ),
                              child: CachedNetworkImage(
                                  imageUrl: post.spot!.logo!.url!,
                                  height: getSize(
                                    70.00,
                                  ),
                                  width: getSize(
                                    70.00,
                                  ),
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          user_image,
                                          height: getSize(
                                            70.00,
                                          ),
                                          width: getSize(
                                            70.00,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: getPaddingSize("s"),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.spot!.name!,
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: getPaddingSize("xxxs")),
                                    child: Text(
                                      post.author!.username!,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: getPaddingSize("l"),
                              left: getPaddingSize("s")),
                          child: GestureDetector(
                            onTap: () {
                              controller.save[index] = !controller.save[index];
                            },
                            child: Obx(() => SvgPicture.asset(
                                  !controller.save[index]
                                      ? "assets/img/Star Border.svg"
                                      : "assets/img/Star.svg",
                                  semanticsLabel: 'Acme Logo',
                                  color: !controller.save[index]
                                      ? Colors.white
                                      : Colors.yellow,
                                  height: getFontSize(30),
                                  width: getFontSize(30),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getPaddingSize("s"),
                  top: getPaddingSize("s"),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              40.00,
                            ),
                          ),
                          child: CachedNetworkImage(
                              imageUrl: post.url!,
                              height: getSize(
                                70.00,
                              ),
                              width: getSize(
                                70.00,
                              ),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      user_image,
                                      height: getSize(
                                        70.00,
                                      ),
                                      width: getSize(
                                        70.00,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: getPaddingSize("s")),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                post.author!.fullName!,
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: getPaddingSize("xxxs")),
                                child: Text(
                                  post.author!.username!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: getPaddingSize("l"),
                          left: getPaddingSize("s")),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.ellipsis,
                            color: Colors.white,
                            size: getFontSize(30),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget actionButtons(Post post, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: getPaddingSize("m"),
              bottom: getPaddingSize("m"),
              right: getPaddingSize("xxl"),
              left: getPaddingSize("xxl")),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/img/Map Border.svg",
                  semanticsLabel: 'Acme Logo',
                  color: Colors.black,
                  height: getFontSize(30),
                  width: getFontSize(30),
                ),
                SvgPicture.asset(
                  "assets/img/Speech Bubble Border.svg",
                  semanticsLabel: 'Acme Logo',
                  height: getFontSize(30),
                  width: getFontSize(30),
                ),
              GestureDetector(
                onTap: () {
                  controller.like[index]=!controller.like[index];
                  // controller.doubleClick[index]=! controller.doubleClick[index];
                },
                child: Obx(()=>
                    SvgPicture.asset(
                      !controller.like[index]?
                      "assets/img/Like.svg":
                      "assets/img/Heart.svg",
                      semanticsLabel: 'Acme Logo',
                      height: getFontSize(30),
                      color:  !controller.like[index]?
                      Colors.black:
                      Colors.red,
                      width: getFontSize(30),
                    )
                ),
              ),
                SvgPicture.asset(
                  "assets/img/Paper Plane Border.svg",
                  semanticsLabel: 'Acme Logo',
                  height: getFontSize(30),
                  width: getFontSize(30),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getPaddingSize("s"),
              right: getPaddingSize("s"),
              bottom: getPaddingSize("xs")),
          child: InkWell(
            onTap: () {
              controller.captionsMore[index] = !controller.captionsMore[index];
            },
            child: Obx(() => RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "${post.author!.username!} ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: !controller.captionsMore[index] &&
                                post.caption!.text!.toString().length > 100
                            ? post.caption!.text.toString().substring(0, 90)
                            : post.caption!.text.toString(),
                      ),
                    if(
                        post.caption!.text!.toString().length >
                            100)
                      TextSpan(
                          text: !controller.captionsMore[index] &&
                                  post.caption!.text!.toString().length >
                                      100
                              ? "  more"
                              : "  less",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(
              right: getPaddingSize("s"),
              left: getPaddingSize("s")),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              post.tags != null
                  ? Container(
                height: 30,
                    alignment: Alignment.center,
                    child: ListView.builder(

                shrinkWrap: true,
                        itemCount: post.tags!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:  EdgeInsets.only(right: getPaddingSize("xxs")),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.whiteA700,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    10.00,
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: getHorizontalSize(
                                      1.00,
                                    ),
                                    blurRadius: getHorizontalSize(
                                      1.00,
                                    ),
                                    offset: const Offset(
                                      0,
                                      1,
                                    ),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(post.tags![index]["display_text"]!,
                                style:  TextStyle(
                                    fontSize: getFontSize(18),
                                    fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  )
                  : Container()
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: getPaddingSize("s"),
              left: getPaddingSize("s"),
              top: getPaddingSize("s"),
              bottom: getPaddingSize("l")),
          child: Text(
            helpers.getTime(
              post.createdAt.toString(),
            ),
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }
}
