// ignore_for_file:  deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:fixit/routes/app_router.dart';
import 'package:fixit/core/assets.dart';
import 'package:fixit/core/constants.dart';
import 'package:fixit/core/widgets/app_bar.dart';
import 'package:fixit/core/widgets/fixit_button.dart';
import 'package:fixit/core/widgets/fixit_statusbar.dart';
import 'package:fixit/core/widgets/fixit_text_button.dart';
import 'package:fixit/core/widgets/fixit_text_field.dart';
import 'package:fixit/core/widgets/item_selection.dart';
import 'package:fixit/core/widgets/martial_status_selection.dart';
import 'package:fixit/features/auth/data/dto/complete_registration.dart';
import 'package:fixit/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/accept_terms_and_privacy.dart';
import 'complete_registration_cubit.dart';
import 'complete_registration_state.dart';

class CompleteProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const CompleteProfilePage({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider<CompleteRegistrationCubit>(
        create: (ctx) => sl<CompleteRegistrationCubit>(),
        child: this,
      );

  @override
  _CompleteProfilePageState createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  late CompleteRegistrationCubit completeRegistrationCubit;

  TextEditingController city = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController referralCode = TextEditingController();
  int selectGender = -1;
  int selectMartial = -1;
  int? acceptTerms;
  int cityId = -1;
  int countryId = -1;
  String? mart;
  String? martialSelection;
  bool isNameFilled = false;
  String countryCode = "";
  TextEditingController country = TextEditingController();
  bool showCityFiled = false;

  @override
  void initState() {
    completeRegistrationCubit =
        BlocProvider.of<CompleteRegistrationCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    completeRegistrationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FixitStatusBar(
      child: BlocConsumer<CompleteRegistrationCubit, CompleteRegistrationState>(
          listener: _listenerCompleteReg,
          builder: (BuildContext context, CompleteRegistrationState state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: getAppbar(context, Strings.completeProfile, true),
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: 8,
                    bottom: 100,
                    right: 0,
                    left: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          FixitTextFieldWidget(
                              onChanged: onNameFilled,
                              onActiveTyping: () {
                                completeRegistrationCubit.hideError('name');
                              },
                              controller: name,
                              label: Strings.nameLabel,
                              svgIcon: "assets/images/pin.svg",
                              type: FixitTextType.email,
                              errorString:
                                  completeRegistrationCubit.getError("name")),
                          const SizedBox(height: 8),
                          FixitTextFieldWidget(
                            // onChanged: refreshSendButtonEnable,
                            onActiveTyping: () {
                              completeRegistrationCubit
                                  .hideError('referral_code');
                            },
                            controller: referralCode,
                            errorString: completeRegistrationCubit
                                .getError("referral_code"),
                            label: Strings.referralCodeLabel,
                            svgIcon: "assets/images/couponInvitation.svg",
                            type: FixitTextType.normal,
                            onChanged: (String value) {},
                          ),
                          const SizedBox(height: 8),
                          ItemSelection(
                            onChange: onGenderChange,
                            icon: Assets.gender,
                            label: Strings.genderLabel,
                            items: Constant.listNamesGender(),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                            ),
                            height: 2,
                            color: Constant.greyColorRegular,
                          ),
                          MartialStateSelection(onChange: onMartialChange),
                          Container(
                            margin: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                            ),
                            height: 2,
                            color: Constant.greyColorRegular,
                          ),
                          FixitTextButton(
                            controller: dob,
                            label: Strings.dobLabel,
                            svgPadding: 3,
                            errorString:
                                completeRegistrationCubit.getError("dob") ?? '',
                            onActiveTyping: () {
                              completeRegistrationCubit.hideError('dob');
                            },
                            onSubmitAction: (selectedDate) {
                              setState(() {
                                dob.text = selectedDate;
                                hasRealDB = true;
                              });
                            },
                            svgIcon: Assets.dob,
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            children: <Widget>[
                              FixitTextFieldWidget(
                                errorString: completeRegistrationCubit
                                    .getError("country"),
                                onActiveTyping: () {
                                  completeRegistrationCubit.getError('country');
                                },
                                controller: country,
                                label: Strings.countryLabel,
                                enabled: true,
                                svgIcon: Assets.location,
                                action: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Constant.navyColorExtraDark,
                                  size: 32,
                                ),
                                onChanged: (String value) {},
                              ),
                              GestureDetector(
                                onTap: onSelectCountry,
                                child: Container(
                                  color: Colors.white.withOpacity(0),
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.centerLeft,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Visibility(
                            visible: showCityFiled || countryId == 1,
                            child: Stack(
                              children: <Widget>[
                                FixitTextFieldWidget(
                                  errorString: completeRegistrationCubit
                                      .getError("city"),
                                  onActiveTyping: () {
                                    completeRegistrationCubit.getError('city');
                                  },
                                  controller: city,
                                  label: Strings.cityLabel,
                                  enabled: true,
                                  svgIcon: Assets.building,
                                  action: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Constant.navyColorExtraDark,
                                    size: 32,
                                  ),
                                  onChanged: (String value) {},
                                ),
                                GestureDetector(
                                  onTap: onSearch,
                                  child: Container(
                                    color: Colors.white.withOpacity(0.0),
                                    height: 80,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.centerLeft,
                                    child: Container(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          AcceptTermsAndPrivacy(
                            onChange: onAcceptTermChanged,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: SafeArea(
                      child: FixitButton(
                        loading: state is CompleteRegistrationLoading,
                        label: Strings.create,
                        enable: hasAcceptTerms &&
                            (selectMartial != -1) &&
                            hasRealDB &&
                            isNameFilled &&
                            isShowCity(),
                        background: Constant.violetColorDark,
                        labelColor: Colors.white,
                        onTab: onConfirm,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  void onSearch() {
    // AppRouter.navigator.pushNamed(AppRouter.searchCitiesDialog,
    //     arguments: SearchCitiesDialogArguments(
    //         selectedCityId: cityId.toString(),
    //         countryId: countryId,
    //         selectedCity: (selectedCity) {
    //           setState(() {
    //             city.text = selectedCity.label.ar;
    //             cityId = selectedCity.id;
    //           });
    //         }));
  }

  bool isShowCity() {
    if (countryId == 1) {
      if (cityId != -1) {
        return true;
      }
    } else if (countryId != -1) {
      return true;
    }
    return false;
  }

  void onSelectCountry() {
    // AppRouter.navigator
    //     .pushNamed(AppRouter.selectCountryPage,
    //         arguments: SelectCountryPageArguments(
    //             selectedCountryId: countryId.toString()))
    //     .then((value) {
    //   if (value != null) {
    //     setState(() {
    //       var result = jsonDecode(value);
    //       country.text = result["name"];
    //       countryCode = result["code"];
    //       countryId = int.tryParse(result["id"]);
    //       showCityFiled = result["hasCities"];
    //     });
    //   }
    // });
  }

  onGenderChange(gender) {
    setState(() {
      selectGender = gender;
    });
  }

  onMartialChange(martial) {
    setState(() {
      selectMartial = martial;
    });
    conditionClassification(martial);
  }

  onNameFilled(String txt) {
    setState(() {
      isNameFilled = name.text.isNotEmpty;
    });
  }

  onAcceptTermChanged(acceptTerms) {
    setState(() {
      this.acceptTerms = acceptTerms;
    });
  }

  conditionClassification(int index) {
    if (index == 0) {
      martialSelection = Strings.unmarried;
    } else if (index == 1) {
      martialSelection = Strings.married;
    } else if (index == 2) {
      martialSelection = Strings.absolute;
    } else if (index == 3) {
      martialSelection = Strings.widower;
    }
  }

  bool get hasAcceptTerms => acceptTerms == 1;
  bool hasRealDB = false;

  onConfirm() {
    if (hasAcceptTerms && hasRealDB && isNameFilled && countryId != -1) {
      completeRegistrationCubit.confirmPressed(
          completeRegistrationData: CompleteRegistration(
              name: name.text,
              referralCode: referralCode.text.trim(),
              city: (countryId == 1 && cityId != -1) ? cityId.toString() : null,
              cityName: city.text,
              dob: dob.text.toString(),
              countryId: countryId.toString(),
              countryName: country.text.toString(),
              gender: selectGender,
              martial: martialSelection ?? ''));
    }
  }

  void _listenerCompleteReg(
      BuildContext context, CompleteRegistrationState state) {
    if (state is CompleteRegistrationSuccess) {
      context.router.popAndPush(const HomeRoute());
    }
  }
}
