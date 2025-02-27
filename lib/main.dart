import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:supakids/utils/app_colors.dart';
import 'package:supakids/utils/app_strings.dart';
import 'package:supakids/utils/app_styles.dart';
import 'package:supakids/utils/route_generator.dart';
import 'package:supakids/utils/screen_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kWhiteColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: kWhiteColor,),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(color: kWhiteColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppStyles.interStyle(kGreyColor, 16, FontWeight.w400),
        iconColor: kBlackColor,
        enabledBorder: UnderlineInputBorder(
          borderSide:  const BorderSide(color: kFieldBorderColor),
          borderRadius: AppStyles.customBorderAll8,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: AppStyles.customBorderAll8,
          borderSide:  const BorderSide(color: kPrimaryColor),
        ),

      ),
      textTheme: TextTheme(
        titleMedium: TextStyle(color: kWhiteColor, fontSize: 14.sp) ,
        bodyLarge: TextStyle(color: kWhiteColor, fontSize: 14.sp),
        bodyMedium: TextStyle(color: kWhiteColor, fontSize: 14.sp),
      ),
      colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
            theme: _buildTheme(Brightness.light),
            title: kAppName,
            debugShowCheckedModeBanner: false,
            initialBinding: ScreenBindings(),
            initialRoute: kHome,
            getPages: RouteGenerator.getPages(),
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(MediaQuery.of(context)
                          .textScaleFactor
                          .clamp(1.0, 1.0))),
                  child: child!);
            });
      },
    );
  }
}
