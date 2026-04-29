import 'package:cinescope/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: "enter email"),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: "enter password"),
                obscureText: true,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "enter name"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    SignupRequested(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      nameController.text.trim(),
                    ),
                  );
                },
                child: Text("signin"),
              ),
              Text.rich(
                TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
