import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/auth/presentation/pages/sign_in_page.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_field.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_header.dart';
import 'package:gym8/features/auth/presentation/widgets/pass_field.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_button.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_divider.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_google_button.dart';
import 'package:gym8/features/exercise/presentation/widgets/main_wrapper.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 64,
          horizontal: 16,
        ),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            } else if (state is AuthSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MainWrapper.route(),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }

            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                        height: 32,
                        image: AssetImage('assets/my_icon.png'),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(context, SignInPage.route()),
                        },
                        child: const Image(
                          height: 20,
                          image: AssetImage("assets/cross_icon.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const AuthHeader(
                    title: "Create New Account",
                    description: "Sign up to get started!",
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    label: "Full Name",
                    hintText: "Your beautiful name",
                    controller: nameController,
                  ),
                  const SizedBox(height: 16),
                  AuthField(
                    label: "Email Address",
                    hintText: "youlooknicetoday@example.com",
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  PassField(
                    label: "Password",
                    hintText: "Ssst!",
                    controller: passwordController,
                  ),
                  const SizedBox(height: 16),
                  AuthButton(
                    buttonText: "Sign up",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignUp(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  const AuthDivider(),
                  const SizedBox(height: 8),
                  AuthGoogleButton(
                    buttonText: "Sign up with Google",
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthSignInGoogle(),
                          );
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(context, SignInPage.route()),
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign in!",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppPallete.purpleColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
