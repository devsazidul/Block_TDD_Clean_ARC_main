import 'package:bloc_tdd_arc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/core_utils/core_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: emailController,
              decoration: InputDecoration(hintText: 'Email')),

          SizedBox(height: 20),

          TextField(controller: passwordController,
              decoration: InputDecoration(hintText: 'Password')),

          SizedBox(height: 20),


          // example of using bloc with ui and custom logic
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Error) {
                CoreUtils.showSnackBar(
                  context: context,
                  message: state.message,
                  statusCode: state.statusCode,
                  backgroundColor: Colors.red,
                );
              } else if (state is LoggedIn) {
                CoreUtils.showSnackBar(
                  context: context,
                  message: 'Login successfully',
                  statusCode: 206,
                  backgroundColor: Colors.purple,
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child: Text('Login'),
              );
            },
          ),

          // example of using bloc with changing ui based on data
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if(state is LoggedIn) {
                return Text('The token is: ${state.user.token.toString()}');
              }
              return Text('Nothing to display');
            }
          )

        ],
      ),
    );
  }
}
