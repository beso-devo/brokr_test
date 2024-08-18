import 'package:brokr/features/sign_up/presentation/provider/sign_up_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import '../provider/sign_up_state.dart';
import '../widgets/header_widget.dart';

class ContinueAsGuestPage extends StatefulWidget {
  const ContinueAsGuestPage({super.key});

  @override
  State<ContinueAsGuestPage> createState() => _ContinueAsGuestPageState();
}

class _ContinueAsGuestPageState extends State<ContinueAsGuestPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController phoneNumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        SignUpState state = ref.watch(signUpLogicProvider);
        if (state.userSignedUp) {
          Navigator.pushNamedAndRemoveUntil(
              context, GeneralScreens.MAIN_PAGE, (route) => false);
        }
        return Scaffold(
            key: scaffoldState,
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: AppBar(
                  backgroundColor: const Color(0xffF8F7F7),
                  elevation: 0.0,
                )),
            body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if (MediaQuery.of(context).orientation ==
                    Orientation.portrait) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Column(children: [
                          const HeaderSignUpWidget(
                            withBackBtn: true,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          formSignUp(state, ref)
                        ]),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width / 2) - 10,
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const HeaderSignUpWidget(
                                  withBackBtn: true,
                                ),
                                formSignUp(state, ref)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width / 2) - 10,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12.0,
                                ),
                                formSignUp(state, ref),
                                const SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ));
      },
    );
  }

  Widget formSignUp(SignUpState state, WidgetRef ref) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Phone number",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: (val) =>
                ref.read(signUpLogicProvider.notifier).changePhoneNumber(val),
            controller: phoneNumberController,
            showError: state.errorPhoneNumberValidation,
            errorText: "Invalid input!",
            prefixIcon: const Icon(
              Icons.phone,
              size: 20.0,
            )),
        const SizedBox(
          height: 12.0,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            color: WHITE,
            child: SubmitButtonWidget(
              color: MAIN1,
              title: "Continue",
              onTap: () =>
                  ref.read(signUpLogicProvider.notifier).continueAsGuest(),
              isLoading: state.isSigningUp,
            ),
          ),
        ),
      ],
    );
  }
}
