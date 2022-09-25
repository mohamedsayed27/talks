import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talks/core/network/local/cash_helper.dart';
import '../../domain/controllers/user_cubti/user_cubit.dart';
import '../../domain/controllers/user_cubti/user_state.dart';
import 'package:jwt_decode/jwt_decode.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = CacheHelper.getData(key: 'token');
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String id = payload["nameid"];
    return BlocProvider(
      create: (context) => UserCubit()..getUserData(id: id),
      child: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: TextButton(
                  onPressed: () {
                    print(payload);
                    print(token);
                  },
                  child: Text('Click')),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
