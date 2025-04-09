import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SuperBaseSignInRepo {
  Future<void> signInWithEmailPassword({required String email, required String password});
  Future<void> signUpWithEmailPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<User?> checkUserSession();
  Future<void> deleteUser();
}

final superbaseSignInRepoProvider = Provider<SuperBaseSignInRepo>((ref) {
  return SuperBaseSignInRepoImpl();
});

class SuperBaseSignInRepoImpl implements SuperBaseSignInRepo {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<User?> checkUserSession() async {
    return _supabase.auth.currentUser;
  }

  @override
  Future<void> signInWithEmailPassword({
    required String email,
    required String password
  }) async {
    await _supabase.auth.signInWithPassword(
      email: email,
      password: password
    );
  }

  @override
  Future<void> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user != null) {
    }
  }

  @override
  Future<void> deleteUser() async {
    await _supabase.auth.admin.deleteUser(_supabase.auth.currentUser!.id);
  }

  @override
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }
}
