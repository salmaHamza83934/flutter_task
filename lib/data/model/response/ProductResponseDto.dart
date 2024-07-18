import 'package:flutter_task/domain/entities/ProductResponseEntity.dart';

class ProductResponseDto extends ProductResponseEntity{
  ProductResponseDto({
      super.products,
      super.total,
      super.skip,
      super.limit,});

  ProductResponseDto.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }



}


class ProductDto extends ProductEntity{
  ProductDto({
      super.id,
      super.title,
      super.description,
      super.category,
      super.price,
      super.discountPercentage,
      super.rating,
      super.stock,
      super.tags,
      super.brand,
      super.sku,
      super.weight,
      this.dimensions, 
      super.warrantyInformation,
      super.shippingInformation,
      super.availabilityStatus,
      this.reviews, 
      super.returnPolicy,
      super.minimumOrderQuantity,
      this.meta,
      super.images,
      super.thumbnail,});

  ProductDto.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    dimensions =
    json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    thumbnail = json['thumbnail'];
  }


  Dimensions? dimensions;
  List<Reviews>? reviews;
  Meta? meta;



}

class Meta {
  Meta({
      this.createdAt, 
      this.updatedAt, 
      this.barcode, 
      this.qrCode,});

  Meta.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;



}


class Reviews {
  Reviews({
      this.rating, 
      this.comment, 
      this.date, 
      this.reviewerName, 
      this.reviewerEmail,});

  Reviews.fromJson(dynamic json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }
  num? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;



}


class Dimensions {
  Dimensions({
      this.width, 
      this.height, 
      this.depth,});

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  num? width;
  num? height;
  num? depth;


}