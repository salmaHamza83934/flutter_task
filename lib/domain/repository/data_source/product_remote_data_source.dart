import 'package:dartz/dartz.dart';

import '../../../data/api/base_error.dart';
import '../../entities/ProductResponseEntity.dart';

abstract class ProductsRemoteDataSource{
  Future<Either<BaseError,ProductResponseEntity>> getProducts();

}