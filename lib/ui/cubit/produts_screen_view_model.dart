
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/ProductResponseEntity.dart';
import '../../../domain/use_case/get_products_use_case.dart';
import 'produts_screen_states.dart';

class ProductsTabViewModel extends Cubit<ProductsScreenStates> {
  GetProductsUseCase getProductsUseCase;

  ProductsTabViewModel(
      {required this.getProductsUseCase})
      : super(ProductsScreenInitialState());

  List<ProductEntity> products = [];
  bool isFavourite = false;

  static ProductsTabViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductsScreenLoadingState('Loading...'));
    var either = await getProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductsScreenErrorState(l));
    }, (response) {
      products = response.products ?? [];
      emit(ProductsScreenSuccessState(response));
    });
  }

  void changeFavouriteIcon() async{
    isFavourite =!isFavourite;
    emit(ChangeFavouriteIcon());
  }

}
