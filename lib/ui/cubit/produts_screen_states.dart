import 'package:flutter_task/domain/entities/ProductResponseEntity.dart';

import '../../../data/api/base_error.dart';

abstract class ProductsScreenStates{}

class ProductsScreenInitialState extends ProductsScreenStates{}

class ProductsScreenLoadingState extends ProductsScreenStates {
  String loadingMsg;

  ProductsScreenLoadingState(this.loadingMsg);
}

class ProductsScreenErrorState extends ProductsScreenStates {
  BaseError error;

  ProductsScreenErrorState(this.error);
}

class ProductsScreenSuccessState extends ProductsScreenStates {
  ProductResponseEntity productResponseEntity;

  ProductsScreenSuccessState(this.productResponseEntity);
}

class ChangeFavouriteIcon extends ProductsScreenStates{}
