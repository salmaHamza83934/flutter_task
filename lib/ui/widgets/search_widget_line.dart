
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/assets_data/my_assets.dart';
import '../../core/theme/theme.dart';
import '../../data/di.dart';

class CustomSearch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Container(
      width: 345.w,
      height: 50.h,
      child: TextField(
        cursorColor: AppTheme.primaryColor,
        decoration: InputDecoration(
          hintText: 'What do you search for?',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(6, 0, 79, 0.6),
          ),
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              size: 32.sp,
              color: AppTheme.primaryColor.withOpacity(0.75),
            ),
            onPressed: () {},
          ),
          border: buildBaseBorder(),
          enabledBorder: buildBaseBorder(),
          focusedBorder: buildBaseBorder()!.copyWith(
            borderSide: BorderSide(width: 2),
          ),
        ),
      ),
    ),
        SizedBox(
          width: 15.w,
        ),
        Image.asset(
          MyAssets.shoppingCart,
          height: 35.h,
          width: 35.w,
        ),
      ],
    );
  }

  OutlineInputBorder buildBaseBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1),
    );
  }
}
