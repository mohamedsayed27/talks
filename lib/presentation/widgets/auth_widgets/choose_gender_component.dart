import 'package:flutter/material.dart';
import 'package:talks/core/app_colors/app_colors.dart';

import '../../../core/constants/app_strings.dart';
import '../custom_sized_box.dart';
import '../radio_button_item.dart';

class ChooseGenderComponent extends StatefulWidget {
  final bool isMaleTrueOrFemaleFalse;
  const ChooseGenderComponent({Key? key, required this.isMaleTrueOrFemaleFalse}) : super(key: key);

  @override
  State<ChooseGenderComponent> createState() => _ChooseGenderComponentState();
}

class _ChooseGenderComponentState extends State<ChooseGenderComponent> {
  late bool isMaleTrueOrFemaleFalse;
  @override
  void initState() {
    isMaleTrueOrFemaleFalse = widget.isMaleTrueOrFemaleFalse;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isMaleTrueOrFemaleFalse = false;
              });
            },
            child: CustomRadioButtonItem(
              genderTitle: AppStrings.female,
              isMaleTrueOrFemaleFalse: isMaleTrueOrFemaleFalse,
              color: !isMaleTrueOrFemaleFalse?AppColors.whiteColor:AppColors.blueColor,
            ),
          ),
        ),
        const CustomSizedBox(
          width: 15,
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                isMaleTrueOrFemaleFalse = true;
              });
              },
            child: CustomRadioButtonItem(
              genderTitle: AppStrings.male,
              isMaleTrueOrFemaleFalse: isMaleTrueOrFemaleFalse,
              color: isMaleTrueOrFemaleFalse?AppColors.whiteColor:AppColors.blueColor,
            ),
          ),
        ),
      ],
    );
  }
}
