import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/feature/editPersonalDetail/bloc/edit_profile_bloc.dart';
import 'package:groomely_seller/feature/profile/bloc/user_profile_bloc.dart';
import 'package:groomely_seller/utils/APi/api_calling.dart';
import 'package:groomely_seller/widgets/custom_button.dart';
import 'package:groomely_seller/widgets/custom_text_form_field%202.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/app_style.dart';
import '../../../utils/Toast/app_toast.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/size_utils.dart';
import '../../../utils/storage/local_storage.dart';
import '../../../widgets/custom_appbar.dart';

class EditPersonalDetailsScreen extends StatefulWidget {
  EditPersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EditPersonalDetailsScreen> createState() =>
      _EditPersonalDetailsScreen();
}

class _EditPersonalDetailsScreen extends State<EditPersonalDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? image;

  Future pickImage({fromCamera = false}) async {
    try {
      final image = await ImagePicker().pickImage(
          source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserProfileBloc>(context).add(FetchProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    LocalStorageService localStorageService = LocalStorageService();
    final TextEditingController shopOwnerNameController =
        TextEditingController();
    final TextEditingController shopNameController = TextEditingController();
    final TextEditingController shopAddressController = TextEditingController();
    final TextEditingController shopEmailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Edit Profile'),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoadingState) {
              return Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: Colors.white.withOpacity(0.3),
                child: Container(
                  color: const Color(0xFF244661),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              );
            } else if (state is UserProfileErrorState) {
              return Center(child: Text(state.errorMsg.toString()));
            } else if (state is UserProfileLoadedState) {
              shopOwnerNameController.text =
                  state.profileModel.data!.details!.name!;
              shopNameController.text =
                  state.profileModel.data!.details!.shopName!;
              shopAddressController.text =
                  state.profileModel.data!.details!.shopAddress!;
              shopEmailController.text =
                  state.profileModel.data!.details!.email!;
              phoneController.text = state.profileModel.data!.details!.phone!;
              passwordController.text = "";
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      child: Container(
                        width: getHorizontalSize(384),
                        margin: EdgeInsets.all(14),
                        padding: getPadding(
                            left: 26, top: 15, right: 26, bottom: 15),
                        decoration: AppDecoration.fillGray200.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder6),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              inputField(
                                title: "SHOP NAME",
                                controller: shopNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter shop name";
                                  }
                                  return null;
                                },
                              ),
                              inputField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter shop owner name";
                                  }
                                  return null;
                                },
                                title: "shop owner name",
                                controller: shopOwnerNameController,
                              ),
                              // inputField(
                              //   title: "EMAIL",
                              //   controller: shopEmailController,
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return "Please enter email";
                              //     }
                              //     return null;
                              //   },
                              // ),
                              inputField(
                                title: "Phone Number",
                                controller: phoneController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter phone number";
                                  }
                                  return null;
                                },
                              ),
                              inputField(
                                title: "Address",
                                controller: shopAddressController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter phone number";
                                  }
                                  return null;
                                },
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocProvider(
                      create: (context) => EditProfileBloc(),
                      child: BlocConsumer<EditProfileBloc, EditProfileState>(
                        listener: (context, state) {
                          if (state is EditProfileStateLoaded) {
                            ToastMessage(
                                '${state.editProfileResponseModel.message}');
                            Navigator.pop(context);
                          }

                          if (state is EditProfileStateFailed) {
                            ToastMessage('${state.errorMessage}');
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<EditProfileBloc>().add(
                                    EditProfileSubmittedEvent(
                                        shopNameController.text,
                                        shopOwnerNameController.text,
                                        phoneController.text,
                                        shopAddressController.text));
                              }
                            },
                            height: getVerticalSize(
                              55,
                            ),
                            text: "SAVE",
                            margin: getMargin(
                              left: 60,
                              top: 0,
                              right: 61,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget inputField(
      {required String title,
      required TextEditingController controller,
      required String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: getPadding(top: 11),
            child: Text(title.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterBold12)),
        CustomTextFormField(
          controller: controller,
          validator: validator,
        )
      ],
    );
  }

  Widget contentField({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: getPadding(top: 11),
            child: Text(title.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterBold12)),
        Padding(
            padding: getPadding(top: 2),
            child: Text(subTitle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterLight16)),
      ],
    );
  }
}
