import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superbase_auth/src/constants/app_assets.dart';

import '../../../shared/widgets/label.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textfield.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';

import '../../../theme/app_fonts.dart';

import 'login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpLogin = ref.watch(loginController);

    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');

    ref.listen(loginController, (previous, authState) {
      authState.maybeMap(
        data: (_) => context.pop(),
        error: (e) {
          final errorMessage = e.error.toString();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              title: 'Welcome Back',
              subTitle: 'Please sign in to continue.'
            ),

            gapH48,

            CustomTextField(
              hintText: 'Email Address',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            gapH10,

            CustomTextField(
              hintText: 'Password',
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
            ),

            gapH48,

            CustomButton.primary(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ref.read(loginController.notifier).signIn(
                  emailController.text,
                  passwordController.text
                );
              },
              child: otpLogin.maybeWhen(
                loading: () => const CircularProgressIndicator(),
                orElse: () => Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.radioCanadaBig,
                  ), textAlign: TextAlign.center,
                ),
              ),
            ),

            gapH20,

            CustomButton.secondary(
              onPressed: () => ref.read(loginController.notifier).signInWithGoogle(),
              child: otpLogin.maybeWhen(
                loading: () => const CircularProgressIndicator(),
                orElse: () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.google),

                    gapW8,

                    Text(
                      'Login with Google',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.radioCanadaBig,
                      ), textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
