import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../../core/network/local/cash_helper.dart';
import '../../domain/controllers/user_cubti/user_cubit.dart';
import '../../domain/controllers/user_cubti/user_state.dart';
import '../widgets/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = CacheHelper.getData(key: 'token');
    var id = Jwt.parseJwt(token);
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(id: id['nameid']),
      child: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: TextButton(
                  onPressed: () {}, child: const Text('Click')),
            ),
            bottomNavigationBar: Padding(
              padding:
               EdgeInsets.only(left: 107.4.w, right: 99.w, bottom: 50.h),
              child: CustomPaint(
                size: Size(double.infinity, 40.h),
                painter: CustomNavigationBar(),
              ),
            ),
            floatingActionButton: Padding(
              padding:  EdgeInsets.only(bottom: 40.h),
              child: Container(
                height: 70.h,
                width: 70.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
