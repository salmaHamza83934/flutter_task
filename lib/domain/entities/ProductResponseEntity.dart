class ProductResponseEntity {
  ProductResponseEntity({
      this.products, 
      this.total, 
      this.skip, 
      this.limit,});


  List<ProductEntity>? products;
  num? total;
  num? skip;
  num? limit;


}

class ProductEntity {
  ProductEntity({
      this.id, 
      this.title, 
      this.description, 
      this.category, 
      this.price, 
      this.discountPercentage, 
      this.rating, 
      this.stock, 
      this.tags, 
      this.brand, 
      this.sku, 
      this.weight, 
      this.warrantyInformation,
      this.shippingInformation, 
      this.availabilityStatus, 
      this.returnPolicy,
      this.minimumOrderQuantity, 
      this.images,
      this.thumbnail,});

  num? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  num? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  String? returnPolicy;
  num? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;


}

