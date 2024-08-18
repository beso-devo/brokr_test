import 'package:brokr/features/sign_up/presentation/provider/sign_up_logic.dart';
import 'package:brokr/features/sign_up/presentation/provider/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import '../widgets/header_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  final scaffoldState = GlobalKey<ScaffoldState>();

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
                          const HeaderSignUpWidget(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          formSignUp(state, ref),
                          createAnAccount(),
                          continueAsGuestWidget()
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
                                const HeaderSignUpWidget(),
                                createAnAccount()
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
            hintText: "Email",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: (val) =>
                ref.read(signUpLogicProvider.notifier).changeEmail(val),
            controller: emailController,
            showError: state.errorUserNameValidation,
            errorText: "Invalid input!",
            prefixIcon: const Icon(
              Icons.email,
              size: 20.0,
            )),
        const SizedBox(
          height: 12.0,
        ),
        InputTextField(
            title: 'ss',
            hintText: "Password",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: (val) =>
                ref.read(signUpLogicProvider.notifier).changePassword(val),
            controller: passwordController,
            showError: state.errorPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isPasswordSecureText,
            suffixIcon: GestureDetector(
              onTap: () => ref
                  .read(signUpLogicProvider.notifier)
                  .passwordObscureChanged(),
              child: Icon(
                state.isPasswordSecureText
                    ? Icons.remove_red_eye
                    : Icons.panorama_fish_eye,
                color: DARK_OFF_FONT,
              ),
            ),
            prefixIcon: const Icon(
              Icons.lock,
              size: 20.0,
            )),
        const SizedBox(
          height: 12.0,
        ),
        InputTextField(
            title: 'ss',
            hintText: "Confirm password",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: (val) => ref
                .read(signUpLogicProvider.notifier)
                .changeConfirmPassword(val),
            controller: confirmPasswordController,
            showError: state.errorPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isConfirmPasswordSecure,
            suffixIcon: GestureDetector(
              onTap: () => ref
                  .read(signUpLogicProvider.notifier)
                  .confirmPasswordObscureChanged(),
              child: Icon(
                state.isConfirmPasswordSecure
                    ? Icons.remove_red_eye
                    : Icons.panorama_fish_eye,
                color: DARK_OFF_FONT,
              ),
            ),
            prefixIcon: const Icon(
              Icons.lock,
              size: 20.0,
            )),
        const SizedBox(
          height: 12.0,
        ),
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
              title: "Sign Up",
              onTap: () => ref.read(signUpLogicProvider.notifier).submit(),
              isLoading: state.isSigningUp,
            ),
          ),
        ),
      ],
    );
  }

  Widget createAnAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?" + " ",
              style: TextStyle(color: DARK_OFF_FONT, fontSize: 16.0),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, GeneralScreens.SIGN_IN);
              },
              child: const Text(
                "Sign In",
                style: TextStyle(color: MAIN1, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget continueAsGuestWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, GeneralScreens.CONTINUE_AS_GUEST);
        },
        child: const Text(
          "Continue as guest?",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
