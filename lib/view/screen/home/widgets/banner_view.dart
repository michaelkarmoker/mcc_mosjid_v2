
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qibla_finder/view/base/custom_button.dart';
import 'package:qibla_finder/view/base/shakeWidget.dart';
import 'package:shimmer/shimmer.dart';


import '../../../../controller/home_controller.dart';
import '../../../../util/app_constants.dart';
import '../../../../util/dimensions.dart';
import '../../webViewPage/web_view_screen.dart';

class BannerView extends StatelessWidget {
  final HomeController homeController;
  BannerView({required this.homeController});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: Get.height/3.5,
      padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
      child: homeController.sliders!.length>0 ? Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: 1,
                autoPlayInterval: Duration(seconds: 7),
                onPageChanged: (index, reason) {
                  homeController.setCurrentIndex(index, true);
                },
              ),
              itemCount: homeController.sliders!.length == 0 ? 1 : homeController.sliders!.length,
              itemBuilder: (context, index, _) {
                /*String _baseUrl = bannerController.bannerDataList[index] is BasicCampaignModel ? Get.find<SplashController>()
                    .configModel.baseUrls.campaignImageUrl : Get.find<SplashController>().configModel.baseUrls.bannerImageUrl;*/
               // String _baseUrl = Get.find<SplashController>().configModel.baseUrls.bannerImageUrl;
                return Container(

                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  //  borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                    boxShadow: [BoxShadow(color: Colors.grey[200]!, spreadRadius: 1, blurRadius: 5)],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                       // borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        child: /*CustomImageCached(
                          image: '${homeController.mainSlider![index].slider}',
                          fit: BoxFit.cover,
                        )*/
                        Image.asset(homeController.sliders![index].imageUrl!,fit: BoxFit.fill,width: Get.width,)
                      ),

                      homeController.sliders![index].isButton?Positioned(
                          bottom: 8,
                          left: 0,
                          child: Container(
                            width:Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ShakeWidget(
                                  child: CustomButton(
                                    width: 80,
                      height: 35,
                      fontSize: 11,
                      btnColor:Theme.of(context).primaryColor, onPressed: () {
                                    Get.to(WebViewPage(url: AppConstants.donationLink, title: 'Donation',));

                                  }, buttonText: 'Donate Now',),
                                ),
                              ],
                            ),
                          )):SizedBox(),

                      homeController.sliders![index].subImage!=null?Container(child: Center(child: Image.asset(homeController.sliders![index].subImage!,fit: BoxFit.fill,width: Get.width/2,))):SizedBox()
                    ],
                  ),
                )/* InkWell(
                  onTap: () {
                    if(bannerController.bannerDataList[index] is Product) {
                      Product _product = bannerController.bannerDataList[index];
                      ResponsiveHelper.isMobile(context) ? showModalBottomSheet(
                        context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
                        builder: (con) => ProductBottomSheet(product: _product),
                      ) : showDialog(context: context, builder: (con) => Dialog(
                          child: ProductBottomSheet(product: _product)),
                      );
                    }else if(bannerController.bannerDataList[index] is Restaurant) {
                      Restaurant _restaurant = bannerController.bannerDataList[index];
                      Get.toNamed(
                        RouteHelper.getRestaurantRoute(_restaurant.id),
                        arguments: RestaurantScreen(restaurant: _restaurant),
                      );
                    }else if(bannerController.bannerDataList[index] is BasicCampaignModel) {
                      BasicCampaignModel _campaign = bannerController.bannerDataList[index];
                      Get.toNamed(RouteHelper.getBasicCampaignRoute(_campaign.id, _campaign.title, _campaign.image));
                    }
                  },
                  child: ,
                )*/;
              },
            ),
          ),

          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: homeController.sliders!.map((bnr) {
              int index = homeController.sliders!.indexOf(bnr);
              return TabPageSelectorIndicator(
                backgroundColor: index == homeController.currentIndex ? Theme.of(context).primaryColor
                    : Colors.white70,
                borderColor: Theme.of(context).primaryColor,
                size: index == homeController.currentIndex ? 9 : 7,
              );
            }).toList(),
          ),
        ],
      ) : Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: homeController.sliders == null,
        child: Container(margin: EdgeInsets.symmetric(horizontal: 10), decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
          color: Colors.grey[300],
        )),
      ),
    );
  }

}
