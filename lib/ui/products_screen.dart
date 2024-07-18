import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/ui/widgets/product_item_widget.dart';
import 'package:flutter_task/ui/widgets/search_widget_line.dart';
import '../core/assets_data/my_assets.dart';
import '../data/di.dart';
import 'cubit/produts_screen_states.dart';
import 'cubit/produts_screen_view_model.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsTabViewModel viewModel = ProductsTabViewModel(
      getProductsUseCase: injectGetProductsUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsTabViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<ProductsTabViewModel, ProductsScreenStates>(
        bloc: viewModel..getAllProducts(),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Image.asset(
                      MyAssets.logo,
                      height: 22.h,
                      width: 66.w,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    CustomSearch(),
                    SizedBox(
                      height: 16.h,
                    ),
                    state is ProductsScreenLoadingState
                        ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                        : Expanded(
                          child: GridView.builder(
                                              physics: const BouncingScrollPhysics(),
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1 /
                              1.26, // Adjust childAspectRatio to control item height
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemBuilder: (context, index) {

                          return ProductItemWidget(
                            product: viewModel.products[index],
                          );
                                              },
                                              itemCount: viewModel.products.length,
                                            ),
                        ),
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
