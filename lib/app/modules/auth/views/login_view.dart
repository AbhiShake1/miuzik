import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:miuzik/app/modules/auth/controllers/auth_controller.dart';
import 'package:miuzik/app/routes/app_pages.dart';
import 'package:miuzik/base_view.dart';
import 'package:miuzik/extensions.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) => BaseView(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: GlassButton(
            onPressed: () => Get.toNamed(Routes.SIGN_UP),
            child: "Don't have an account yet?".text.make(),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlassContainer(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: Form(
                    key: controller.signInKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        20.h.heightBox,
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
                        ),
                      ],
                    ),
                  ),
                ),
                GlassContainer(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: 'Login'
                      .text
                      .fontSize(20.sp)
                      .bold
                      .makeCentered()
                      .paddingY(10),
                ).onClick(controller.onSignInPressed).paddingY(20.h),
                GlassContainer(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  blur: 5,
                  child: 'Forgot Password?'
                      .text
                      .fontSize(16.sp)
                      .make()
                      .paddingSymmetric(vertical: 5.h, horizontal: 30.h),
                ).onClick(controller.onForgotPasswordPressed),
              ],
            ).paddingX(10.w),
          ),
        ),
      );
}
