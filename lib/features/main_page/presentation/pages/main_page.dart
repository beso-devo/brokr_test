import 'package:brokr/features/main_page/presentation/provider/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../provider/main_logic.dart';
import '../widgets/car_widget.dart';

class MainPage extends ConsumerWidget with FlushBarMixin {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController nicknameController = new TextEditingController();
  final TextEditingController phoneNumberController =
      new TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainState state = ref.watch(mainLogicProvider);

    return Scaffold(
        key: scaffoldState,
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: TEXT_FIELD_COLOR,
          centerTitle: false,
          title: Text(
            "Cars",
            style: TextStyle(
                fontSize: 14.sp,
                color: MAIN1,
                fontWeight: FontWeight.bold,
                fontFamily: "Lobster"),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, GeneralScreens.ADD_CAR)
                    .then((value) {
                  if (value != null && (value as Map)["beneficiary"] != null) {
                    // _bloc.onAddNewBeneficiary((value)["beneficiary"]);
                  }
                });
              },
              icon: Icon(
                Icons.add,
                color: MAIN1,
              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CarWidget();
            }));
  }
}
