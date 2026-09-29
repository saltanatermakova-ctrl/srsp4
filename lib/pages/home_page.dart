import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale.toString(); // перестраиваться при смене языка

    return Scaffold(
      appBar: AppBar(title: Text('home'.tr())),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          // Приветственный блок
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome_title'.tr(),
                        style: AppTextStyles.title
                            .copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'welcome_text'.tr(),
                        style: AppTextStyles.body
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(Icons.storefront, size: 56.sp, color: AppColors.white),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // Три адаптивные плитки
          Row(
            children: [
              const _StatTile(
                icon: Icons.local_shipping,
                labelKey: 'stat_delivery',
                color: AppColors.orange,
              ),
              SizedBox(width: 12.w),
              const _StatTile(
                icon: Icons.verified,
                labelKey: 'stat_quality',
                color: AppColors.green,
              ),
              SizedBox(width: 12.w),
              const _StatTile(
                icon: Icons.support_agent,
                labelKey: 'stat_support',
                color: AppColors.purple,
              ),
            ],
          ),
          SizedBox(height: 24.h),

          Text('featured'.tr(), style: AppTextStyles.subtitle),
          SizedBox(height: 12.h),

          const _FeatureCard(
            icon: Icons.new_releases,
            titleKey: 'card1_title',
            textKey: 'card1_text',
            color: AppColors.primary,
          ),
          SizedBox(height: 12.h),
          const _FeatureCard(
            icon: Icons.local_offer,
            titleKey: 'card2_title',
            textKey: 'card2_text',
            color: AppColors.pink,
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String labelKey;
  final Color color;

  const _StatTile({
    required this.icon,
    required this.labelKey,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: AppColors.cardColor(context),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32.sp, color: color),
            SizedBox(height: 8.h),
            Text(
              labelKey.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String textKey;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.titleKey,
    required this.textKey,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor(context),
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(icon, size: 30.sp, color: AppColors.white),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleKey.tr(),
                    style: AppTextStyles.body
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.h),
                  Text(textKey.tr(), style: AppTextStyles.caption),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
