import 'dart:convert';

import 'package:awabtest/core/app_export.dart';
import 'package:awabtest/core/utils/validation_functions.dart';
import 'package:awabtest/presentation/show_products_screen/models/userprofile_item_model.dart';
import 'package:awabtest/widgets/app_bar/appbar_subtitle.dart';
import 'package:awabtest/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:awabtest/widgets/app_bar/custom_app_bar.dart';
import 'package:awabtest/widgets/custom_drop_down.dart';
import 'package:awabtest/widgets/custom_elevated_button.dart';
import 'package:awabtest/widgets/custom_text_form_field.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../add_product_screen/widgets/addproductlist_item_widget.dart';
import 'controller/add_product_controller.dart';
import 'models/addproductlist_item_model.dart';

// ignore_for_file: must_be_immutable
class AddProductScreen extends GetWidget<AddProductController> {
  AddProductScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(14.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("msg_product_pictures".tr,
                                    style: theme.textTheme.bodyLarge)),
                            SizedBox(height: 14.v),
                            _buildAddProductList(),
                            SizedBox(height: 14.v),
                            _buildPressToAddPictureButton(),
                            SizedBox(height: 28.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("lbl_product_name".tr,
                                    style: theme.textTheme.bodyLarge)),
                            SizedBox(height: 6.v),
                            _buildProductNameEditText(),
                            SizedBox(height: 22.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("lbl_store_name".tr,
                                    style: theme.textTheme.bodyLarge)),
                            SizedBox(height: 7.v),
                            _buildStoreNameEditText(),
                            SizedBox(height: 30.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("lbl_price".tr,
                                    textAlign: TextAlign.right,
                                    style: theme.textTheme.bodyLarge)),
                            SizedBox(height: 6.v),
                            _buildPriceEditText(),
                            SizedBox(height: 36.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Text("lbl_category".tr,
                                    style: theme.textTheme.bodyLarge)),
                            SizedBox(height: 5.v),
                            Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: CustomDropDown(
                                    icon: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            30.h, 18.v, 24.h, 18.v),
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgIconsaxOutlineArrowcircledown,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize)),
                                    hintText: "lbl_category_name".tr,
                                    items: controller.addProductModelObj.value
                                        .dropdownItemList!.value,
                                    onChanged: (value) {
                                      controller.onSelected(value);
                                    })),
                            SizedBox(height: 10.v),
                            _buildAddProductButton()
                          ]))))),
    ));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_add_product".tr),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgArrowRight,
              onTap: () {
                Get.toNamed(
                  AppRoutes.showProductsScreen,
                );
              },
              margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 3.v))
        ]);
  }

  /// Section Widget
  Widget _buildAddProductList() {
    return SizedBox(
        height: 99.v,
        child: GetBuilder<AddProductController>(builder: (logic) {
          return ListView.separated(
              padding: EdgeInsets.only(left: 1.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 2.h);
              },
              itemCount: controller
                  .addProductModelObj.value.addproductlistItemList.value.length,
              itemBuilder: (context, index) {
                AddproductlistItemModel model = controller.addProductModelObj
                    .value.addproductlistItemList.value[index];
                return AddproductlistItemWidget(model);
              });
          // : const Center(
          //     child: Text(
          //     "Please select images",
          //     style: TextStyle(color: Colors.black),
          //   ));
        }));
  }

  /// Section Widget
  Widget _buildPressToAddPictureButton() {
    return CustomElevatedButton(
        text: "msg_press_to_add_picture".tr,
        margin: EdgeInsets.only(left: 1.h),
        onPressed: () async {
          controller.addProductModelObj.value.addproductlistItemList.value
              .clear();
          final List<XFile> pickedFileList = await _picker.pickMultiImage(
            maxWidth: 100,
            maxHeight: 100,
            imageQuality: 100,
          );
          for (var image in pickedFileList) {
            controller.addProductModelObj.value.addproductlistItemList.value
                .add(AddproductlistItemModel(
                    image: Rx(image.path), id: Rx(image.name)));
            controller.update();
          }
        },
        leftIcon: Container(
            margin: EdgeInsets.only(right: 14.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgIconsaxBoldAddsquare,
                height: 24.adaptSize,
                width: 24.adaptSize)));
  }

  /// Section Widget
  Widget _buildProductNameEditText() {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: CustomTextFormField(
            controller: controller.productNameEditTextController,
            hintText: "lbl_product_name2".tr,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildStoreNameEditText() {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: CustomTextFormField(
            controller: controller.storeNameEditTextController,
            hintText: "lbl_store_name2".tr,
            validator: (value) {
              if (!isText(value)) {
                return "err_msg_please_enter_valid_text".tr;
              }
              return null;
            },
            contentPadding:
                EdgeInsets.symmetric(horizontal: 11.h, vertical: 18.v)));
  }

  /// Section Widget
  Widget _buildPriceEditText() {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: CustomTextFormField(
            controller: controller.priceEditTextController,
            hintText: "lbl_price".tr,
            textInputType: TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.done,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.h, vertical: 21.v)));
  }

  /// Section Widget
  Widget _buildAddProductButton() {
    return CustomElevatedButton(
        height: 64.v,
        onPressed: () {
          if (controller
              .addProductModelObj.value.addproductlistItemList.value.isEmpty) {
            BotToast.showText(text: 'Please select pictures');
          } else if (controller.productNameEditTextController.text.isEmpty) {
            BotToast.showText(text: 'Please enter title');
          } else if (controller.priceEditTextController.text.isEmpty) {
            BotToast.showText(text: 'Please enter price');
          } else if (controller.storeNameEditTextController.text.isEmpty) {
            BotToast.showText(text: 'Please enter store name');
          } else {
            if (controller.box.read("products") == null) {
              controller.box.write(
                  "products",
                  jsonEncode([
                    Products(
                        image: controller.addProductModelObj.value
                            .addproductlistItemList.value.first.image!.value,
                        title: controller.productNameEditTextController.text,
                        price: double.parse(
                            controller.priceEditTextController.text),
                        store: controller.storeNameEditTextController.text)
                  ]));
            } else {
              var jsonText = controller.box.read("products");
              var decodedText = jsonDecode(jsonText);
              decodedText.add(Products(
                  image: controller.addProductModelObj.value
                      .addproductlistItemList.value.first.image!.value,
                  title: controller.productNameEditTextController.text,
                  price: double.parse(controller.priceEditTextController.text),
                  store: controller.storeNameEditTextController.text));
              controller.box.write("products", jsonEncode(decodedText));
            }
            controller.addProductModelObj.value.addproductlistItemList.value
                .clear();
            controller.productNameEditTextController.clear();
            controller.priceEditTextController.clear();
            controller.storeNameEditTextController.clear();
            controller.update();
            BotToast.showText(text: 'Product Added');
          }
          // controller.box.write("product",[] )
        },
        text: "lbl_add_product2".tr,
        margin: EdgeInsets.only(left: 17.h, right: 15.h, bottom: 37.v),
        buttonTextStyle: CustomTextStyles.bodyLargeWhiteA700);
  }
}
