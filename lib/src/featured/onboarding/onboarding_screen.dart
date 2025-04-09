import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/custom_button.dart';

import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';

import '../../theme/app_fonts.dart';

import '../../routes/routes.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Spacer(),

            Image.asset(AppAssets.icon, height: 100, width: 100,),

            const Text(
              'MeowMeow',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.radioCanadaBig,
              ),
            ),

            gapH4,

            Text(
              'No texts, no waiting-just quick video calls with real people.',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.black.withOpacity(0.6),
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.radioCanadaBig,
              ), textAlign: TextAlign.center,
            ),

            Spacer(),

            CustomButton.primary(
              onPressed: () => context.pushNamed(Routes.RegisterScreenRoute),
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.radioCanadaBig,
                ), textAlign: TextAlign.center,
              ),
            ),

            gapH16,

            CustomButton.secondary(
              onPressed: () => context.pushNamed(Routes.LoginScreenRoute),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.radioCanadaBig,
                ), textAlign: TextAlign.center,
              ),
            ),

            gapH16,

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By tapping ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.radioCanadaBig,
                ),
                children: [
                  TextSpan(
                    text: '"Create account"',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.radioCanadaBig,
                    ),
                  ),
                  TextSpan(
                    text: ' or ',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.radioCanadaBig,
                    ),
                  ),
                  TextSpan(
                    text: '"Sign In"',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.radioCanadaBig,
                    ),
                  ),
                  TextSpan(
                    text: ', you agree to our ',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.radioCanadaBig,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.radioCanadaBig,
                      decoration:  TextDecoration.underline
                    ),
                  ),
                  TextSpan(
                    text: ' & ',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: AppFonts.radioCanadaBig,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    onEnter: (_) => context.pushNamed(Routes.AppRootScreenRoute),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.radioCanadaBig,
                      decoration:  TextDecoration.underline
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
