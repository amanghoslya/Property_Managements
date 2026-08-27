import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_care/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(440, 855),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            // statusBarColor: Color(0xFFF3F3F3),
            // statusBarIconBrightness: Brightness.dark,
            // statusBarBrightness: Brightness.light,
          ),
          child: SafeArea(
            top: false,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Property Care',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              home: SplashScreen(),
            ),
          ),
        );
      },
    );
  }
}
