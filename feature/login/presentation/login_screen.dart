import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/manage_services_container1_screen/manage_services_container1_screen.dart';
import '../../../theme/app_style.dart';
import '../../../utils/Toast/app_toast.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/size_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../forgetPassword/presentation/forgetPassword.dart';
import '../../signup/presentaion/signup_screen.dart';
import '../bloc/seller_login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textFieldFocusNode = FocusNode();
  bool isTextObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String radioGroup = "";
  final List<String> radioList = ["lbl_seller", "lbl_customer"];
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
                "Make Your Next Grooming Appointment.",
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtInterMedium24,
              ),
              CustomTextFormField(
                focusNode: FocusNode(),
                autofocus: true,
                controller: emailController,
                hintText: "User Name",
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
              CustomTextFormField(
                focusNode: FocusNode(),
                isObscureText: isTextObscure,
                autofocus: true,
                controller: passwordController,
                hintText: "password",
                suffix: GestureDetector(
                  onTap: () {
                    setState(() {
                      isTextObscure = !isTextObscure;
                    });
                  },
                  child: isTextObscure
                      ? const Icon(
                          Icons.visibility_off_rounded,
                        )
                      : const Icon(
                          Icons.visibility_rounded,
                        ),
                ),
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
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Your Password?",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterRegular14OrangeA200,
                  ),
                ),
              ),
              BlocListener<SellerLoginBloc, SellerLoginState>(
                listener: (context, state) {
                  // print("state --> $state");
                  if (state is SellerLoginLoadedState) {
                    ToastMessage.toast(
                        context: context,
                        message: state.responseModel.message.toString(),
                        messageColor: Colors.white,
                        background: Colors.green);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ManageServicesContainer1Screen()),
                        (route) => false);
                  } else if (state is SellerLoginErrorState) {
                    ToastMessage.toast(
                        duration: 5000,
                        context: context,
                        message: state.errorMsg.toString(),
                        messageColor: Colors.white,
                        background: Colors.redAccent);
                  }
                },
                child: CustomButton(
                  onTap: () {
                    BlocProvider.of<SellerLoginBloc>(context).add(
                        SellerLoginEvents(
                            userName: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            user_type: 'seller'));
                  },
                  height: getVerticalSize(
                    55,
                  ),
                  text: "LOGIN",
                  margin: getMargin(
                    left: 60,
                    top: 60,
                    right: 61,
                  ),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUPScreen()),
                                 );
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
}
