import 'package:brokr/features/add_new_car/domain/entity/car_entity.dart';
import 'package:brokr/features/add_new_car/presentation/provider/add_car_logic.dart';
import 'package:brokr/features/add_new_car/presentation/provider/add_car_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/util/colors.dart';
import '../../../../core/util/input_text_field.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../../../../core/util/widgets/submit_button_widget.dart';

class AddCarPage extends ConsumerWidget with FlushBarMixin {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController nicknameController = new TextEditingController();
  final TextEditingController phoneNumberController =
      new TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddCarState state = ref.watch(addCarLogicProvider);
    if (state.carAdded) {
      /// The CarEntity has to be coming from the backend (store it in the state and
      /// return it back here and pop it to the previous page for adding it without calling
      /// the api again...).
      Navigator.pop(
          context, {"newCar": CarEntity(id: -1, name: 'name', brand: 'brand')});
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
                      const SizedBox(
                        height: 35,
                      ),
                      formAddBeneficiary(state, ref)
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
                            formAddBeneficiary(state, ref)
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
                            formAddBeneficiary(state, ref),
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
  }

  Widget formAddBeneficiary(AddCarState refState, WidgetRef ref) {
    return Column(
      children: [
        InputTextField(
            title: 'ss',
            hintText: "Title",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: (String val) =>
                ref.read(addCarLogicProvider.notifier).changeTitle(val),
            controller: nicknameController,
            showError: refState.errorNicknameValidation,
            errorText: "Invalid input!",
            prefixIcon: const Icon(
              Icons.text_fields,
              size: 20.0,
            )),
        const SizedBox(
          height: 8.0,
        ),
        InputTextField(
            title: 'ss',
            hintText: "Phone Number, ex: 552711410",
            inputType: TextInputType.number,
            onSubmit: (val) {},
            onChanged: (String val) =>
                ref.read(addCarLogicProvider.notifier).changePhoneNumber(val),
            controller: phoneNumberController,
            showError: refState.errorPhoneNumberValidation,
            errorText: "Invalid input!",
            prefixIcon: const Text(
              "+971",
              style: TextStyle(color: Colors.black),
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
              onTap: () {
                ref.read(addCarLogicProvider.notifier).submit();
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
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Add New Car",
              style: TextStyle(
                  color: MAIN1, fontSize: 14.sp, fontWeight: FontWeight.bold),
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
        Container(
          width: MediaQuery.of(context).size.width,
          child: const Text(
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
