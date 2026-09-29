import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/data/favorites_controller.dart';
import '../core/data/products.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale.toString();

    return Scaffold(
      appBar: AppBar(title: Text('favorites'.tr())),
      body: ValueListenableBuilder<Set<int>>(
        valueListenable: FavoritesController.instance.ids,
        builder: (context, ids, _) {
          final items = products.where((p) => ids.contains(p.id)).toList();

          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border,
                        size: 72.sp, color: AppColors.textSecondary),
                    SizedBox(height: 16.h),
                    Text('favorites_empty'.tr(), style: AppTextStyles.subtitle),
                    SizedBox(height: 8.h),
                    Text(
                      'favorites_hint'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16.w),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final product = items[index];
              return Card(
                color: AppColors.cardColor(context),
                elevation: 2,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  leading: Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(product.icon,
                        size: 28.sp, color: AppColors.white),
                  ),
                  title: Text(
                    product.nameKey.tr(),
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'price'.tr(args: [formatPrice(product.price)]),
                    style: AppTextStyles.price,
                  ),
                  trailing: IconButton(
                    iconSize: 24.sp,
                    icon: const Icon(Icons.favorite, color: AppColors.favorite),
                    onPressed: () =>
                        FavoritesController.instance.toggle(product.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
