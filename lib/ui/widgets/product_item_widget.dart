import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/Colors.dart';
import '../../../domain/entities/ProductResponseEntity.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity product;
  bool isFavourite=false;

  ProductItemWidget({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(children: [
            Container(
              height: 160.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: NetworkImage(product.images![0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  product.images![0],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(color: AppColors.primaryColor,),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50.w,
                      ),
                    );
                  },
                ),),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 180.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? '',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "EGP ${product.price.toString()}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Text(
                            "Rating (${product.rating.toString()})",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 3.h),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.add_circle,
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ),
              ],
            ),
          ]),
          Container(
            margin: EdgeInsets.all(8.r),
            width: 40.w,
            height: 40.h,
            decoration: ShapeDecoration(
              shadows: [BoxShadow(color: Colors.black)],
              color: Colors.white,
              shape: OvalBorder(),
            ),
            child: Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

