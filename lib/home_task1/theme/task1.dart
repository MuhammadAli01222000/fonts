import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fonts/home_task1/companents/icon_button.dart';
import 'package:fonts/home_task1/theme/colors.dart';
import 'package:fonts/home_task1/theme/dimens.dart';
import 'package:fonts/home_task1/theme/icons.dart';
import 'package:fonts/home_task1/theme/strings.dart';
import 'package:flutter/services.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  final controller = ScrollController();
  void select() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildPreferredSize(),
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            Center(
              child: Container(
                width: AppDimens.d400,
                child: RichText(
                  text: TextSpan(
                    text: AppStrings.bigText,
                    style: GoogleFonts.raleway(
                      fontSize: AppDimens.d16,
                      fontWeight: FontWeight.w400,
                      height: 2,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,

      bottomNavigationBar: _BottomAppBarWidget(),
    );
  }

  PreferredSize _buildPreferredSize() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppDimens.d40),
      child: AppBar(

        backgroundColor: AppColors.white,
        leading: AppIconButton(icon: AppIcons.back, color: AppColors.black),
        actions: [
          AppIconButton(icon: AppIcons.share, color: AppColors.black),
          SizedBox(width: AppDimens.d40),
          AppIconButton(icon: AppIcons.menu, color: AppColors.black),
        ],
      ),
    );
  }
}

class _BottomAppBarWidget extends StatelessWidget {
  const _BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: AppDimens.d83,
      child: ListTile(
        leading: AppIconButton(
          icon: AppIcons.music,
          color: AppColors.iconColor,
        ),
        title: Text(
          AppStrings.page,
          style: GoogleFonts.raleway(fontSize: AppDimens.d14),
        ),
        trailing: AppIconButton(
          icon: AppIcons.list,
          color: AppColors.iconColor,
        ),
      ),
    );
  }
}
