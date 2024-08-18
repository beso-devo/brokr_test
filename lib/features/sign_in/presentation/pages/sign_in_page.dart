import 'package:brokr/features/sign_in/presentation/provider/sign_in_logic.dart';
import 'package:brokr/features/sign_in/presentation/provider/sign_in_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with FlushBarMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        SignInState state = ref.watch(signInLogicProvider);

        if (state.userSignedIn) {
          Navigator.pushNamedAndRemoveUntil(
              context, GeneralScreens.MAIN_PAGE, (route) => false);
        }
        if (state.errorSignIn) {
          exceptionFlushBar(
              title: "Error!",
              context: context,
              message: "The account is not exists!",
              duration: const Duration(milliseconds: 1750),
              onChangeStatus: (status) {},
              onHidden: () {
                ref.read(signInLogicProvider.notifier).clearData();
              });
        }
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: AppBar(
                  backgroundColor: const Color(0xffF8F7F7),
                  elevation: 0.0,
                )),
            body: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                bool isPortrait =
                    orientation.toString() == 'Orientation.portrait';
                if (MediaQuery.of(context).orientation ==
                    Orientation.landscape) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 10,
                          height: MediaQuery.of(context).size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: headerLogin(context),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 10,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12.0,
                                ),
                                formLogin(state, ref),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                // createAnAccount(context)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: Column(
                          children: [
                            headerLogin(context),
                            const SizedBox(
                              height: 50.0,
                            ),
                            formLogin(state, ref),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ));
      },
    );
  }

  Widget headerLogin(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Image.asset(
                  'assets/images/waving-hand.png',
                  width: 30.0,
                )
              ],
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: TEXT_FIELD_COLOR),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 6.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
            "I am happy to see you again. You can check your subscribe requests to your company after sign in.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
          ),
        )
      ],
    );
  }

  Widget formLogin(SignInState state, WidgetRef ref) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Username",
            inputType: TextInputType.name,
            onSubmit: (val) {},
            onChanged: (val) =>
                ref.read(signInLogicProvider.notifier).changeEmail(val),
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
                ref.read(signInLogicProvider.notifier).changePassword(val),
            controller: passwordController,
            showError: state.errorPasswordValidation,
            errorText: "Invalid input!",
            obscureText: state.isSecureText,
            suffixIcon: GestureDetector(
              onTap: () =>
                  ref.read(signInLogicProvider.notifier).changeSecureText(),
              child: Icon(
                state.isSecureText
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 65,
            color: WHITE,
            child: SubmitButtonWidget(
              color: MAIN1,
              title: "Submit",
              onTap: () => ref.read(signInLogicProvider.notifier).submit(),
              isLoading: state.isSigningIn,
            ),
          ),
        ),
      ],
    );
  }
}
