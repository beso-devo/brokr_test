import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';
import '../riverpod/add_new_beneficiary_riverpod.dart';
import '../riverpod/add_new_beneficiary_state.dart';

class AddNewBeneficiaryRiverPodPage extends ConsumerWidget with FlushBarMixin {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController nicknameController = new TextEditingController();
  final TextEditingController phoneNumberController =
      new TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddBeneficiaryState refState = ref.watch(addBeneficiaryLogicProvider);
    if (refState.beneficiaryAdded) {
      Navigator.pop(context, {"beneficiary": null});
    }
    return Scaffold(
        key: scaffoldState,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: AppBar(
              backgroundColor: Color(0xffF8F7F7),
              elevation: 0.0,
            )),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Column(children: [
                      headerPage(context),
                      SizedBox(
                        height: 35,
                      ),
                      formAddBeneficiary(refState, ref)
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
                            headerPage(context),
                            formAddBeneficiary(refState, ref)
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
                            SizedBox(
                              height: 12.0,
                            ),
                            formAddBeneficiary(refState, ref),
                            SizedBox(
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
  }

  Widget formAddBeneficiary(AddBeneficiaryState refState, WidgetRef ref) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Nickname",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: (String val) =>
                ref.read(addBeneficiaryLogicProvider.notifier).changeName(val),
            controller: nicknameController,
            showError: refState.errorNicknameValidation,
            errorText: "Invalid input!",
            prefixIcon: Icon(
              Icons.text_fields,
              size: 20.0,
            )),
        SizedBox(
          height: 8.0,
        ),
        InputTextField(
            title: 'ss',
            hintText: "Phone Number, ex: 552711410",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: (String val) => ref
                .read(addBeneficiaryLogicProvider.notifier)
                .changePhoneNumber(val),
            controller: phoneNumberController,
            showError: refState.errorPhoneNumberValidation,
            errorText: "Invalid input!",
            prefixIcon: Text(
              "+971",
              style: TextStyle(color: Colors.black),
            )),
        SizedBox(
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
              onTap: () {
                ref.read(addBeneficiaryLogicProvider.notifier).submit();
              },
              isLoading: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget headerPage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add Beneficiary",
              style: TextStyle(
                  color: MAIN1, fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: TEXT_FIELD_COLOR),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
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
        SizedBox(
          height: 6.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "I am happy to see you again. You can add new beneficiary under your account here!.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: DARK_OFF_FONT, fontSize: 15.0),
          ),
        )
      ],
    );
  }
}
