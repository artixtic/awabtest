import 'package:awabtest/core/app_export.dart';
import 'package:awabtest/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../controller/add_product_controller.dart';
import '../models/addproductlist_item_model.dart';

// ignore: must_be_immutable
class AddproductlistItemWidget extends StatelessWidget {
  AddproductlistItemWidget(
    this.addproductlistItemModelObj, {
    this.test = true,
    Key? key,
  }) : super(
          key: key,
        );
  bool? test;
  AddproductlistItemModel addproductlistItemModelObj;

  var controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 99.v,
      width: 96.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: addproductlistItemModelObj.image!.value,
              height: 99.v,
              width: 96.h,
              radius: BorderRadius.circular(
                5.h,
              ),
              alignment: Alignment.center,
            ),
          ),
          test!
              ? Padding(
                  padding: EdgeInsets.only(
                    left: 5.h,
                    top: 6.v,
                  ),
                  child: CustomIconButton(
                    height: 23.adaptSize,
                    width: 23.adaptSize,
                    padding: EdgeInsets.all(1.h),
                    alignment: Alignment.topLeft,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconsaxBulkForbidden2,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
