import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository with GetxServiceMixin {
  final _auth = Supabase.instance.client.auth;

  Future<GotrueSessionResponse> signUp(String email, String password) =>
      _auth.signUp(email, password);

  Future<GotrueSessionResponse> signIn(String email, String password) =>
      _auth.signIn(email: email, password: password);

  Future<GotrueJsonResponse> sendPasswordRecoveryEmail(String email) =>
      _auth.api.resetPasswordForEmail(email);
}
