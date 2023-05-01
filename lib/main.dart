import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talks/core/app_router/app_router.dart';
import 'package:talks/core/app_router/route_names.dart';
import 'package:talks/core/constants/app_strings.dart';
import 'package:talks/core/network/dio_helper.dart';
import 'package:talks/presentation/screens/app_layout_screen.dart';
import 'core/cache/cache_helper.dart';
import 'bloc_observer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: AppStrings.appName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: ScreenName.splashScreen,
          home: const MainAppLayout(),
        );
      },
    );
  }
}
