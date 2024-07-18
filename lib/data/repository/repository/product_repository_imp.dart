import 'package:dartz/dartz.dart';
import 'package:flutter_task/data/api/base_error.dart';
import 'package:flutter_task/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_task/domain/repository/data_source/product_remote_data_source.dart';
import 'package:flutter_task/domain/repository/repository/product_repository_contract.dart';

class ProductsRepositoryImp extends ProductsRepositoryContract{
  ProductsRemoteDataSource productRemoteDataSource;

  ProductsRepositoryImp(this.productRemoteDataSource);

  @override
  Future<Either<BaseError, ProductResponseEntity>> getProducts() {
    return productRemoteDataSource.getProducts();
  }
}