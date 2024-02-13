import 'package:awabtest/core/app_export.dart';
import 'package:awabtest/presentation/add_product_screen/models/addproductlist_item_model.dart';
import 'package:awabtest/presentation/add_product_screen/widgets/addproductlist_item_widget.dart';
import 'package:awabtest/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:awabtest/widgets/app_bar/appbar_title.dart';
import 'package:awabtest/widgets/app_bar/custom_app_bar.dart';
import 'package:awabtest/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../show_products_screen/widgets/userprofile_item_widget.dart';
import 'controller/show_products_controller.dart';
import 'models/userprofile_item_model.dart';

// ignore_for_file: must_be_immutable
class ShowProductsScreen extends GetWidget<ShowProductsController> {
  const ShowProductsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 8.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "lbl_categories".tr,
              //   style: CustomTextStyles.bodyLargeBluegray800,
              // ),
              // Spacer(),
              // _buildAddProductList(),
              // Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: CustomButtonStyles.fillWhiteA,
                      child: CustomImageView(
                        imagePath: ImageConstant.imgIconsaxBoldElementequal,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 6.v),
                      ),
                    ),
                    CustomElevatedButton(
                      height: 36.v,
                      width: 210.h,
                      text: "msg_change_the_display".tr,
                      margin: EdgeInsets.only(left: 4.h),
                      buttonStyle: CustomButtonStyles.fillWhiteA,
                      buttonTextStyle: CustomTextStyles.bodySmallRedA200,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.v),
              Expanded(child: _buildUserProfile()),
              // SizedBox(height: 84.v),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddProductList() {
    return SizedBox(
        height: 99.v,
        child: Obx(() => ListView.separated(
            padding: EdgeInsets.only(left: 1.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 2.h);
            },
            itemCount: controller
                .addProductModelObj.value.addproductlistItemList.value.length,
            itemBuilder: (context, index) {
              AddproductlistItemModel model = controller
                  .addProductModelObj.value.addproductlistItemList.value[index];
              return AddproductlistItemWidget(model, test: false);
            })));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 82.h,
      leading: AppbarLeadingIconbutton(
        imagePath: ImageConstant.imgIcBaselinePlus,
        margin: EdgeInsets.only(
          left: 32.h,
          top: 3.v,
          bottom: 3.v,
        ),
        onTap: () {
          Get.back();
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_products".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: GetBuilder<ShowProductsController>(builder: (logic) {
          return ListView.separated(
            // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 10.v,
              );
            },
            itemCount: controller
                .showProductsModelObj.value.userprofileItemList.value.length,
            itemBuilder: (context, index) {
              UserprofileItemModel model = controller
                  .showProductsModelObj.value.userprofileItemList.value[index];
              return UserprofileItemWidget(
                model,
              );
            },
          );
        }));
  }
}
