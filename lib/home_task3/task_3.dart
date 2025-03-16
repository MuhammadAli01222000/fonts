import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fonts/home_task1/companents/button.dart';
import 'package:fonts/home_task1/companents/text_field.dart';
import 'package:fonts/home_task1/theme/colors.dart';
import 'package:fonts/home_task1/theme/dimens.dart';
import 'package:fonts/home_task1/theme/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_autofill/sms_autofill.dart';

const pathAnimatsiya3 = "assets/animatsiya/v3.json";

class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  final controller = ScrollController();
  late final SmsAutoFill smsController;
  String _code = "";
  String signature = "{{ app signature }}";
  @override
  void initState() {
    super.initState();
  }

  void initsmsController() async {
    smsController = SmsAutoFill();
  }

  Future<void> getAppSignatureID() async {
    var appSignatureID = await smsController.getAppSignature;
  }

  Future<void> listenOtp() async {
    smsController.listenForCode();

    smsController.code.listen((code) {});
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.d14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Lottie.asset(pathAnimatsiya3, width: 200, height: 200),
                ),
                Text(
                  AppStrings.enter,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                ),
                const InputOtpCodeForm(),
                const SizedBox(height: AppDimens.d8),
                RichText(
                  text: TextSpan(
                    text: AppStrings.didnt,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey2,
                    ),
                    children: [TextSpan(
                        text: AppStrings.resent,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: AppColors.iconColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              const   SizedBox(height: AppDimens.d14),
              const  VerifyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//custom button
class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Center(
          child: Text(
            AppStrings.verify,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
        ),
      ),
      width: AppDimens.d150,
      height: AppDimens.d40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.d24),
        ),
        gradient: LinearGradient(
          colors: [AppColors.blue3, AppColors.blue2],
          stops: [1, 2],
        ),
      ),
    );
  }
}
/// custom containeer for otp code input
class InputOtpCodeForm extends StatelessWidget {
  const InputOtpCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 4; i++)
          SizedBox(
            width: 60,
            height: 40,
            child: Input(
              maxLength: 1,
              text: "",
              errorText: "",
              textInputFormatter: FilteringTextInputFormatter.digitsOnly,
            ),
          ),
      ],
    );
  }
}

class CodeOtp extends StatefulWidget {
  const CodeOtp({Key? key}) : super(key: key);
  @override
  State<CodeOtp> createState() => _CodeOtpState();
}

class _CodeOtpState extends State<CodeOtp> {
  String? appSignature;
  String? otpCode;
  void codeUpdated() {
    setState(() {
      otpCode = "";
    });
  }

  @override
  void initState() {
    super.initState();

    SmsAutoFill().getAppSignature.then((signature) {
      setState(() {
        appSignature = signature;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
