import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:miuzik/app/modules/auth/controllers/auth_controller.dart';
import 'package:miuzik/app/routes/app_pages.dart';
import 'package:miuzik/base_view.dart';
import 'package:miuzik/extensions.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) => BaseView(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: GlassButton(
            onPressed: () => Get.toNamed(Routes.SIGN_IN),
            child: 'Already have an account?'.text.make(),
          ),
          body: Center(
            child: Form(
              key: controller.signUpKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GlassContainer(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          validator: controller.emailValidator,
                          decoration: const InputDecoration(
                            hintText: 'Email...',
                            prefixIcon: Icon(Icons.mail_outline),
                          ),
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          validator: controller.passwordValidator,
                          obscureText: true,
                          obscuringCharacter: '*',
                          enableInteractiveSelection: false,
                          decoration: const InputDecoration(
                            hintText: 'Password...',
                            prefixIcon: Icon(LineIcons.userLock),
                          ),
                        ).paddingY(20.h),
                        TextFormField(
                          controller: controller.confirmPasswordController,
                          validator: controller.confirmPasswordValidator,
                          obscureText: true,
                          obscuringCharacter: '*',
                          enableInteractiveSelection: false,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password...',
                            prefixIcon: Icon(LineIcons.userLock),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GlassContainer(
                    constraints: const BoxConstraints(
                      maxWidth: 700,
                    ),
                    child: 'Signup'
                        .text
                        .fontSize(20.sp)
                        .bold
                        .makeCentered()
                        .paddingY(10),
                  ).onClick(controller.onSignUpPressed).paddingY(20.h),
                ],
              ).paddingX(10.w),
            ),
          ),
        ),
      );
}
