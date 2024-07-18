import 'package:dartz/dartz.dart';
import 'package:flutter_task/data/api/base_error.dart';
import 'package:flutter_task/domain/entities/ProductResponseEntity.dart';

abstract class ProductsRepositoryContract{
  Future<Either<BaseError,ProductResponseEntity>> getProducts();
}