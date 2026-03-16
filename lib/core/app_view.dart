import 'package:cinescope/core/bloc/app_bloc.dart';
import 'package:cinescope/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        if (state is AppInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if(state is AppAuthenticated){
         // return homesc
        }
        return LoginScreen();
      },
    );
  }
}
