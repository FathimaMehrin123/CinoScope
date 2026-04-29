import 'package:cinescope/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:cinescope/features/authentication/presentation/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              Text("SIGNUP INTO THE DIGITAL SCREEINING ROOM"),
              Text("EMAIL ADDRESS"),

              TextFormField(controller: emailController),

              Text(""),

              TextFormField(controller: passwordController, obscureText: true),

              Text.rich(
                TextSpan(
                  text: "New to CineScope? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign Up Now",
                      style: TextStyle(color: Colors.red),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SignupScreen()),
                          );
                        },
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    LoginRequested(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ),
                  );
                },
                child: Text("Login"),
              ),
            ],
          );
        },
      ),
    );
  }
}
