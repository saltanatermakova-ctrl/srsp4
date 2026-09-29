import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/theme/theme_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _notifications = true;

  static const _languages = <String, String>{
    'ru': 'lang_ru',
    'en': 'lang_en',
    'kk': 'lang_kk',
  };

  @override
  Widget build(BuildContext context) {
    final currentLang = context.locale.languageCode;

    return Scaffold(
      appBar: AppBar(title: Text('profile'.tr())),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Center(
            child: CircleAvatar(
              radius: 48.r,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, size: 52.sp, color: AppColors.white),
            ),
          ),
          SizedBox(height: 12.h),
          Center(child: Text('user_name'.tr(), style: AppTextStyles.title)),
          SizedBox(height: 4.h),
          Center(child: Text('user_email'.tr(), style: AppTextStyles.caption)),
          SizedBox(height: 24.h),

          Card(
            color: AppColors.cardColor(context),
            elevation: 2,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  // Переключатель языка
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language,
                                size: 24.sp, color: AppColors.primary),
                            SizedBox(width: 12.w),
                            Text('language'.tr(), style: AppTextStyles.body),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: _languages.entries.map((entry) {
                            return ChoiceChip(
                              label: Text(entry.value.tr()),
                              selected: currentLang == entry.key,
                              onSelected: (_) =>
                                  context.setLocale(Locale(entry.key)),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),

                  // Тёмная тема
                  ValueListenableBuilder<ThemeMode>(
                    valueListenable: ThemeController.instance.mode,
                    builder: (context, mode, _) {
                      return SwitchListTile(
                        secondary: const Icon(Icons.dark_mode,
                            color: AppColors.primary),
                        title: Text('dark_theme'.tr(),
                            style: AppTextStyles.body),
                        value: mode == ThemeMode.dark,
                        onChanged: (value) =>
                            ThemeController.instance.setDark(value),
                      );
                    },
                  ),

                  // Уведомления
                  SwitchListTile(
                    secondary: const Icon(Icons.notifications,
                        color: AppColors.primary),
                    title:
                        Text('notifications'.tr(), style: AppTextStyles.body),
                    value: _notifications,
                    onChanged: (value) =>
                        setState(() => _notifications = value),
                  ),

                  // О приложении
                  ListTile(
                    leading:
                        const Icon(Icons.info, color: AppColors.primary),
                    title: Text('about_app'.tr(), style: AppTextStyles.body),
                    subtitle:
                        Text('version'.tr(), style: AppTextStyles.caption),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showAboutDialog(
                        context: context,
                        applicationName: 'app_title'.tr(),
                        applicationVersion: '1.0.0',
                        applicationIcon: Icon(Icons.storefront,
                            size: 40.sp, color: AppColors.primary),
                        children: [Text('about_text'.tr())],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
