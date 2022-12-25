import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:talks/core/utils/svg_path.dart';
import '../../core/network/local/cash_helper.dart';
import '../../domain/controllers/user_cubti/user_cubit.dart';
import '../../domain/controllers/user_cubti/user_state.dart';
import '../reusable_components/widgets/custom_nav_bar.dart';

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
               EdgeInsets.only(left: 124.w,right: 124.w, bottom: 30.h),
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(250.w, 66.h),
                    painter: CustomNavigationBar(),
                  ),
                  Positioned(left: 30.w,top: 18.h,child: SvgPicture.asset(SvgPath.addFriendIcon,width: 44.w,height: 30.h,color: Colors.green,),),
                  Positioned(right: 30.w,top: 18.h,child: SvgPicture.asset(SvgPath.notificationIcon,width: 30.w,height: 34.7.h,color: Colors.white),)
                ],
              ),
            ),
            floatingActionButton: Padding(
              padding:  EdgeInsets.only(bottom: 35.h),
              child: Container(
                height: 60.h,
                width: 60.w,
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
