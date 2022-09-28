import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../../core/network/local/cash_helper.dart';
import '../../domain/controllers/user_cubti/user_cubit.dart';
import '../../domain/controllers/user_cubti/user_state.dart';
import '../widgets/custom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              const EdgeInsets.only(left: 90, right: 90, bottom: 15),
              child: CustomPaint(
                size: const Size(double.infinity, 40),
                painter: CustomNavigationBar(),
              ),
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 50,
                width: 50,
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
