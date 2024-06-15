import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/auth/presentation/pages/sign_up_page.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_field.dart';
import 'package:gym8/features/auth/presentation/widgets/pass_field.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_header.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_button.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_divider.dart';
import 'package:gym8/features/auth/presentation/widgets/auth_google_button.dart';
import 'package:gym8/features/exercise/presentation/pages/main_wrapper.dart';

class SignInPage extends StatefulWidget {
  static route(
    BuildContext context,
  ) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/SignIn',
        (route) => false,
      );

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
              MainWrapper.route(context);
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
                  const Image(
                    height: 32,
                    image: AssetImage('assets/my_icon.png'),
                  ),
                  const SizedBox(height: 16),
                  const AuthHeader(
                    title: "Welcome to Gym 8",
                    description: "Sign in to get started!",
                  ),
                  const SizedBox(height: 24),
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
                    buttonText: "Sign in",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignIn(
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
                    buttonText: "Sign in with Google",
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthSignInGoogle(),
                          );
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => SignUpPage.route(context),
                    child: RichText(
                      text: const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign up!",
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
