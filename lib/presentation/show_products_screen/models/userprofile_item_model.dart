// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.exampleText,
    this.numberText,
    this.currencyText,
    this.storeName,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgRectangle39);
    exampleText = exampleText ?? Rx("this is example ");
    numberText = numberText ?? Rx("120");
    currencyText = currencyText ?? Rx("SAR");
    storeName = storeName ?? Rx("Store name");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? exampleText;

  Rx<String>? numberText;

  Rx<String>? currencyText;

  Rx<String>? storeName;

  Rx<String>? id;
}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  String? image;
  String? title;
  double? price;
  String? store;

  Products({
    this.image,
    this.title,
    this.price,
    this.store,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        image: json["image"],
        title: json["title"],
        price: json["price"],
        store: json["store"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
        "store": store,
      };
}
