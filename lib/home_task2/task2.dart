import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:fonts/home_task1/companents/button.dart';
import 'package:fonts/home_task1/companents/text_field.dart';
import 'package:fonts/home_task1/theme/colors.dart';
import 'package:fonts/home_task1/theme/dimens.dart';
import 'package:fonts/home_task1/theme/icons.dart';
import 'package:fonts/home_task1/theme/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTask2 extends StatefulWidget {
  const HomeTask2({super.key});

  @override
  State<HomeTask2> createState() => _Task2State();
}

class _Task2State extends State<HomeTask2> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPassword2 = TextEditingController();
  bool password1 = false;
  bool password2 = false;
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(AppDimens.d14),
              child: Form(
                child: Column(
                  children: [
                    Input(
                      text: AppStrings.name,
                      errorText: AppStrings.error,
                      icon: AppIcons.user,
                    ),

                    Input(
                      text: AppStrings.email,
                      errorText: AppStrings.error,
                      icon: AppIcons.email,
                    ),
                    Input(
                      text: AppStrings.pasword,
                      errorText: AppStrings.error,
                      icon: AppIcons.lock,
                      suffixIcon: IconButton(
                        onPressed: () {
                          password1 = !password1;
                          setState(() {});
                        },
                        icon: password1 ? AppIcons.visibility : AppIcons.eyes,
                      ),
                    ),
                    Input(
                      text: AppStrings.password2,
                      errorText: AppStrings.error,
                      icon: AppIcons.lock,
                      suffixIcon: IconButton(
                        onPressed: () {
                          password2 = !password2;
                          setState(() {});
                        },
                        icon: password2 ? AppIcons.visibility : AppIcons.eyes,
                      ),
                    ),
                    const SizedBox(height: AppDimens.d24),
                    const AppButton(
                      shape: RoundedRectangleBorder(),
                      color: AppColors.iconColor,
                      msg: AppStrings.create,
                      height: AppDimens.d64,
                      colorText: AppColors.white,
                    ),

                    SizedBox(height: AppDimens.d24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.allready,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        ///url berib on tap orqali linkga o'tkazish uchun
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            AppStrings.login,
                            style: GoogleFonts.raleway(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.iconColor,
                              decorationThickness: 2,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Column(
        children: [
          SizedBox(height: AppDimens.d16),
          Text(
            AppStrings.create,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.d24,
            ),
          ),
          Text(
            AppStrings.start,
            style: GoogleFonts.raleway(
              fontWeight: FontWeight.w400,
              fontSize: AppDimens.d16,
            ),
          ),
          SizedBox(height: AppDimens.d14),
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }
}
