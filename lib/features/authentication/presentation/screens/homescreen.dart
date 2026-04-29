import 'package:cinescope/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              children: [
                IconButton(
                  onPressed: () {
                   context.read<AuthBloc>().add(LogoutRequested());
                  },
                  icon: Icon(Icons.logout),
                ),
                Row(
                  children: [
                    Text("Trending Now"),
                    InkWell(child: Text("View All"), onTap: () {}),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
