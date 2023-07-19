import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/manage_services_container1_screen/manage_services_container1_screen.dart';
import '../../../theme/app_style.dart';
import '../../../utils/Toast/app_toast.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/storage/local_storage.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_text_form_field.dart';

import '../../signup/bloc/seller_signup_bloc.dart';
import '../../login/presentation/login_screen.dart';
import '../../../utils/validate/validation.dart';
import '../../../utils/validate/validation_regx.dart';
import '../bloc/seller_signup_bloc.dart';
// import '../bloc/login_bloc.dart';

class SignUPScreen extends StatefulWidget {

  SignUPScreen({Key? key}) : super(key: key);

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  LocalStorageService localStorageService = LocalStorageService();

  bool isTextObscurePassword = true;
  bool isTextObscureConfrmPassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfPasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: BlocProvider(
          create: (context) => SellerSignupBloc(),
          child: BlocConsumer<SellerSignupBloc, SellerSignupState>(
            listener: (context, state) {
              if (state is SellerSignupStateLoaded) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManageServicesContainer1Screen()),
                        (route) => false);
                ToastMessage.toast(
                    context: context,
                    message: state.sellerSignupModel.message.toString(),
                    messageColor: Colors.white,
                    background: Colors.green);

              }
              if (state is SellerSignupStateFailed) {
                ToastMessage.toast(
                    duration: 5000,
                    context: context,
                    message: 'Something went wrong----',
                    messageColor: Colors.white,
                    background: Colors.redAccent);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManageServicesContainer1Screen()),
                        (route) => false);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(height: 30),
                    Text(
                      "Signup to Explore More",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtInterMedium24,
                    ),
                    CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: firstNameController,
                      hintText: "First Name",
                      validator: (input) =>
                          customValidation.validateFirstName(input ?? ' '),
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
                      autofocus: true,
                      controller: lastNameController,
                      hintText: "Last Name",
                      validator: (input) =>
                          customValidation.validateLastName(input ?? ' '),
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
                      autofocus: true,
                      controller: emailController,
                      hintText: "Please Enter Email id",
                      validator: (input) => EmailValidator.validate(input!)
                          ? null
                          : "Please enter valid email id",
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
                      autofocus: true,
                      controller: phoneController,
                      hintText: "Phone number",
                      validator: (input) =>
                          customValidation.validatePhoneNumber(input ?? ' '),
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
                      isObscureText: isTextObscurePassword,
                      autofocus: true,
                      controller: passwordController,
                      hintText: "Password",
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTextObscurePassword = !isTextObscurePassword;
                          });
                        },
                        child: isTextObscurePassword
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
                      validator: (input) =>
                          customValidation.validatePassword(input ?? ' '),
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
                      isObscureText: isTextObscureConfrmPassword,
                      autofocus: true,
                      controller: cnfPasswordController,
                      hintText: "Confirm Password",
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            isTextObscureConfrmPassword =
                                !isTextObscureConfrmPassword;
                          });
                        },
                        child: isTextObscureConfrmPassword
                            ? const Icon(
                                Icons.visibility_off_rounded,
                              )
                            : const Icon(
                                Icons.visibility_rounded,
                              ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please re-enter password';
                        }
                        print(passwordController.text);
                        print(cnfPasswordController.text);
                        if (passwordController.text !=
                            cnfPasswordController.text) {
                          return "Password does not match";
                        }
                        return null;
                      },
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
                      autofocus: true,
                      controller: zipCodeController,
                      hintText: "Zip Code",
                      validator: (input) =>
                          customValidation.validateZip(input ?? ' '),
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
                    CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SellerSignupBloc>().add(
                              SellerSignupSubmittedEvent(
                                  firstNameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  zipCodeController.text,
                                  passwordController.text,
                                  cnfPasswordController.text));
                        }
                      },
                      height: getVerticalSize(
                        55,
                      ),
                      text: "SIGN UP",
                      margin: getMargin(
                        left: 60,
                        top: 40,
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
                                text: "Have an  account?  ",
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
                                text: "LOGIN NOW",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
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
                    SizedBox(height: 20)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

//
