

import 'dart:convert';

List<ProdectModel> prodectModelFromJson(String str) => List<ProdectModel>.from(
    json.decode(str).map((x) => ProdectModel.fromJson(x)));


class ProdectModel {
  ProdectModel({
    required this.id,
    required this.name,
    this.shortDescription,
    this.fullDescription,
    required this.price,
    required this.productPictures,
    required this.productFullSizePictures,
    required this.productCategories,
    required this.discountAmount,
  });

  final int id;
  final String name;
  final String? shortDescription;
  final String? fullDescription;

  final double price;

  final List<ProductPicture> productPictures;
  final List<ProductPicture> productFullSizePictures;
  final String productCategories;

  final double discountAmount;

  factory ProdectModel.fromJson(Map<String, dynamic> json) => ProdectModel(
        id: json["Id"],
        name: json["Name"],
        shortDescription: json["ShortDescription"],
        fullDescription: json["FullDescription"],
        price: json["Price"]?.toDouble(),
        productPictures: List<ProductPicture>.from(
            json["ProductPictures"].map((x) => ProductPicture.fromJson(x))),
        productFullSizePictures: List<ProductPicture>.from(
            json["ProductFullSizePictures"]
                .map((x) => ProductPicture.fromJson(x))),
        productCategories: json["ProductCategories"],
        discountAmount: json["DiscountAmount"]?.toDouble(),
      );
}

class ProductPicture {
  ProductPicture({
    required this.pictureUrl,
    required this.displayOrder,
  });

  String pictureUrl;
  int displayOrder;

  factory ProductPicture.fromJson(Map<String, dynamic> json) => ProductPicture(
        pictureUrl: json["PictureUrl"],
        displayOrder: json["DisplayOrder"],
      );

  Map<String, dynamic> toJson() => {
        "PictureUrl": pictureUrl,
        "DisplayOrder": displayOrder,
      };
}
