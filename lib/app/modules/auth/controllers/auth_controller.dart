import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:miuzik/app/modules/auth/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final _repo = AuthRepository();

  final signInKey = GlobalKey<FormState>(), signUpKey = GlobalKey<FormState>();

  late final TextEditingController emailController,
      passwordController,
      confirmPasswordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? emailValidator(String? email) =>
      email?.isEmail ?? false ? null : 'Invalid email';

  String? passwordValidator(String? password) {
    final validPattern = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
    );
    if (password == null) {
      return 'Required';
    }
    if (!validPattern.hasMatch(password)) {
      return 'Password must contain at least 8 characters, '
          '1 letter, and 1 number';
    }
    return null;
  }

  String? confirmPasswordValidator(String? password) =>
      password != passwordController.text ? "Passwords don't match" : null;

  void _clearControllerTexts() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void handleResponse(
    GotrueResponse response, {
    void Function(String)? onData,
  }) {
    final err = response.error?.message;
    if (err != null) {
      Get.snackbar('', err);
      return;
    }
    onData?.call(response.rawData.toString());
  }

  Future<T> callService<T extends GotrueResponse>(
    Future<T> Function() callback,
  ) async {
    final result = await Get.showOverlay<T>(
      asyncFunction: callback,
      loadingWidget: GlassContainer(
        borderRadius: BorderRadius.zero,
        blur: 5,
        child: Center(
          child: GlassContainer(
            blur: 0,
            width: 150.w,
            height: 100.h,
            child: Lottie.asset(
              'assets/lottie/music_loading.json',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
    return result;
  }

  Future<void> onSignInPressed() async {
    if (!signInKey.currentState!.validate()) {
      return;
    }
    final response = await callService(
      () => _repo.signIn(
        emailController.text,
        passwordController.text,
      ),
    );
    handleResponse(
      response,
      onData: (d) => _clearControllerTexts(),
    );
  }

  Future<void> onSignUpPressed() async {
    if (!signUpKey.currentState!.validate()) {
      return;
    }
    final response = await callService(
      () => _repo.signUp(
        //TODO: Maybe using same controller twice isnt a great idea
        emailController.text,
        passwordController.text,
      ),
    );
    handleResponse(
      response,
      onData: (d) => _clearControllerTexts(),
    );
  }

  Future<void> onForgotPasswordPressed() async {
    final response = await callService(
      () => _repo.sendPasswordRecoveryEmail(
        emailController.text,
      ),
    );
    handleResponse(
      response,
      onData: (d) => Get.snackbar(
        'Password recovery link has been sent in your email',
        'Please be quick. It will expire shortly.',
      ),
    );
  }
}
