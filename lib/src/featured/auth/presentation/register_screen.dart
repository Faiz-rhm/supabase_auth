import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textfield.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';

import '../../../shared/widgets/label.dart';

import '../../../theme/app_fonts.dart';

import 'login_controller.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginController);
    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final confirmPasswordController = TextEditingController(text: '');

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

    void signUp() {
      FocusScope.of(context).unfocus();
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match'))
        );
        return;
      }

      ref.read(loginController.notifier).signUp(
        emailController.text,
        passwordController.text,
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              title: 'Create an Account',
              subTitle: 'Welcome! Let’s set up your account.'
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

            gapH10,

            CustomTextField(
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
            ),

            gapH48,

            CustomButton.primary(
              onPressed: signUp,
              child: login.maybeWhen(
                loading: () => const CircularProgressIndicator(),
                orElse: () => Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.radioCanadaBig,
                  ), textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
