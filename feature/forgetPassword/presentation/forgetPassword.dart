import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/api/api_string.dart';
import '../../../theme/app_style.dart';
import '../../../utils/Toast/app_toast.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/size_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../login/presentation/login_screen.dart';
import '../../signup/presentaion/signup_screen.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  var jsonResponse;
  var resMsg;
  final TextEditingController emailController = TextEditingController();
  final textFieldFocusNode = FocusNode();
  // String radioGroup = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgSideviewmang,
                height: getVerticalSize(
                  280,
                ),
                width: getHorizontalSize(
                  414,
                ),
                radius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    getHorizontalSize(
                      200,
                    ),
                  ),
                  bottomRight: Radius.circular(
                    getHorizontalSize(
                      200,
                    ),
                  ),
                ),
              ),
              Text(
                "FORGET YOUR PASSWORD.",
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtInterMedium24,
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: emailController,
                hintText: "Email Address",
                margin: getMargin(
                  left: 60,
                  top: 23,
                  right: 61,
                ),
                variant: TextFormFieldVariant.OutlineOrangeA200,
                fontStyle: TextFormFieldFontStyle.InterRegular14,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
              ),
              Padding(
                padding: getPadding(
                  top: 10,
                ),
              ),
              CustomButton(
                onTap: () {
                  // print("heeeeloooo");
                  forgotPasswordData(
                    context,
                    emailController.text,
                  );
                },
                height: getVerticalSize(
                  55,
                ),
                text: "Send reset password link",
                margin: getMargin(
                  left: 60,
                  top: 60,
                  right: 61,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 98,
                    top: 9,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don’t Have an  account?  ",
                          style: TextStyle(
                            color: ColorConstant.gray900,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: "SIGNUP NOW",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()),
                                  (route) => false);
                            },
                          style: TextStyle(
                            color: ColorConstant.orangeA200,
                            fontSize: getFontSize(
                              12,
                            ),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  forgotPasswordData(BuildContext context, String stEmail) async {
    Map data = {'email': stEmail};
    http.Response response =
        await http.post(Uri.parse(Apis.forgotPasswordApi), body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      String dataStatus = jsonResponse['status'].toString();
      resMsg = jsonResponse['message'];
      ToastMessage('error');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUPScreen()));
    } else {
      ToastMessage('error');
    }
  }
}
