import 'package:awabtest/core/app_export.dart';
import 'package:flutter/material.dart';

import '../controller/show_products_controller.dart';
import '../models/userprofile_item_model.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<ShowProductsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => CustomImageView(
            imagePath: userprofileItemModelObj.userImage!.value,
            height: 115.v,
            width: 114.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  userprofileItemModelObj.exampleText!.value,
                  style: CustomTextStyles.bodyLarge18,
                ),
              ),
              SizedBox(height: 14.v),
              Row(
                children: [
                  Obx(
                    () => Text(
                      userprofileItemModelObj.numberText!.value,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                    child: Obx(
                      () => Text(
                        userprofileItemModelObj.currencyText!.value,
                        style: CustomTextStyles.bodySmallBluegray800,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.v),
              Container(
                width: 65.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 1.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.fillGray200.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Obx(
                  () => Center(
                    child: Text(
                      userprofileItemModelObj.storeName!.value,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
