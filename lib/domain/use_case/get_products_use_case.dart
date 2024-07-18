import 'package:dartz/dartz.dart';
import 'package:flutter_task/domain/repository/repository/product_repository_contract.dart';
import '../../data/api/base_error.dart';
import '../entities/ProductResponseEntity.dart';

class GetProductsUseCase{
  ProductsRepositoryContract productRepositoryContract;

  GetProductsUseCase(this.productRepositoryContract);
  Future<Either<BaseError, ProductResponseEntity>> invoke(){
    return productRepositoryContract.getProducts();
  }
}