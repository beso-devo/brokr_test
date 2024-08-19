import 'package:brokr/features/main_page/domain/entities/boat_entity.dart';
import 'package:brokr/features/main_page/presentation/provider/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/util/colors.dart';
import '../../../../core/util/generate_screen.dart';
import '../../../../core/util/mixin/flush_bar_mixin.dart';
import '../provider/main_logic.dart';
import '../widgets/car_widget.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    Future.delayed((const Duration(milliseconds: 500))).then((c) {
      ref.read(mainLogicProvider.notifier).getBoats();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        MainState state = ref.watch(mainLogicProvider);

        return Scaffold(
            key: scaffoldState,
            backgroundColor: const Color(0xFFF9F9F9),
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
                      if (value != null &&
                          (value as Map)["beneficiary"] != null) {
                        // _bloc.onAddNewBeneficiary((value)["beneficiary"]);
                      }
                    });
                  },
                  icon: const Icon(
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
      },
    );
  }
}
