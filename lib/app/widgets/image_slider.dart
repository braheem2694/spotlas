import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:spotlas/app/main_screen/controller/main_controller.dart';

import '../../cores/color_constant.dart';
import '../../cores/constants.dart';
import '../../cores/size_utils.dart';

Widget imageSlider(List images, int index) {
  MainScreenController controller = Get.put(MainScreenController());
  return SizedBox(
      width: Get.width,
      child: CarouselSlider.builder(
          options: CarouselOptions(
              height: Get.height * 0.57,
              scrollPhysics: ScrollPhysics(),
              initialPage: 0,
              autoPlay: false,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (i, reason) {}),
          itemCount: images.length,
          itemBuilder: (context, i, realIndex) {
            return InkWell(
              onDoubleTap: () {
                controller.like[index] = !controller.like[index];
                controller.doubleClick[index] = true;

                try{
                  controller.timer.cancel();

                }catch(e){
                  if (kDebugMode) {
                    print(e);
                  }
                }

                controller.timer=Timer.periodic( Duration(milliseconds: controller.duration.value), (timer) {
                  controller.doubleClick[index] = false;
                  controller.timer.cancel();
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorConstant.whiteA700,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            width: Get.width,
                            height: Get.height,
                            fit: BoxFit.cover,
                            imageUrl: images[i],
                            errorWidget: (context, s, a) {
                              return const Center(
                                child: Icon(FontAwesomeIcons.image),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(() => controller.doubleClick[index]
                      ? AnimatedContainer(
                          width: controller.like[index] ? 200.0 : 0,
                          height: controller.like[index] ? 100.0 : 0.0,
                          alignment: controller.like[index]
                              ? Alignment.center
                              : AlignmentDirectional.centerEnd,
                          duration:
                               Duration(milliseconds: controller.duration.value),
                          curve: Curves.fastOutSlowIn,
                          onEnd: () {
                            controller.doubleClick[index] = false;

                          },
                          child: Obx(() => controller.doubleClick[index]
                              ? SvgPicture.asset(
                                  !controller.like[index]
                                      ? "assets/img/Like.svg"
                                      : "assets/img/Heart.svg",
                                  semanticsLabel: 'Acme Logo',
                                  height: getFontSize(100),
                                  color: !controller.like[index]
                                      ? Colors.black
                                      : Colors.red,
                                  width: getFontSize(100),
                                )
                              : Container()),
                        )
                      : Container())
                ],
              ),
            );
          }));
}
