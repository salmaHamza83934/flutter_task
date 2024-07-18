import 'package:flutter_task/data/api/api_manager.dart';
import 'package:flutter_task/data/repository/data_source/product_remote_data_source_imp.dart';
import 'package:flutter_task/data/repository/repository/product_repository_imp.dart';
import 'package:flutter_task/domain/repository/data_source/product_remote_data_source.dart';
import 'package:flutter_task/domain/repository/repository/product_repository_contract.dart';
import 'package:flutter_task/domain/use_case/get_products_use_case.dart';

GetProductsUseCase injectGetProductsUseCase(){
  return GetProductsUseCase(injectProductsRepositoryContract());
}
ProductsRepositoryContract injectProductsRepositoryContract(){
  return ProductsRepositoryImp(injectProductsRemoteDataSource());
}
ProductsRemoteDataSource injectProductsRemoteDataSource(){
  return ProductsRemoteDataSourceImp(ApiManager.getInstance());
}