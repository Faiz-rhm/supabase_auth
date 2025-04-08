import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../onboarding/onboarding_screen.dart';


/// Switches between Auth & non-auth state
class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingScreen();
    // final initializationState = ref.watch(rootProvider);
    // return initializationState.maybeWhen(
    //   data: (_) {
    //     return Consumer(builder: (_, ref, __) {
    //       final user = ref.watch(profileController);
    //       final bool isLoggedIn = user != null;
    //       return isLoggedIn ? HomeScreen() : OnboardingScreen();
    //     });
    //   },
    //   orElse: () => Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   ),
    // );
  }
}
