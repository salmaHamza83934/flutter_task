import 'package:dartz/dartz.dart';
import 'package:flutter_task/data/api/api_manager.dart';
import 'package:flutter_task/data/api/base_error.dart';
import 'package:flutter_task/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_task/domain/repository/data_source/product_remote_data_source.dart';

class ProductsRemoteDataSourceImp extends ProductsRemoteDataSource{
  ApiManager apiManager;

  ProductsRemoteDataSourceImp(this.apiManager);

  @override
  Future<Either<BaseError, ProductResponseEntity>> getProducts() async{
    var either= await apiManager.getProducts();
    return either.fold((l) {
      return Left(BaseError(errMsg: l.errMsg));
    }, (r){
      return Right(r);
    });
  }

}