import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../sk_alert_dialog.dart';

class SKAlertModel {
  String title;
  String message;
  Color titleTxtColor;
  Color messageTxtColor;
  Color closeBtnColor;
  SKAlertType type;
  bool barrierDismissible;
  ValueChanged<String> onOkBtnTap;
  String okBtnText;
  Color okBtnColor;
  Color okBtnTxtColor;
  ValueChanged<String> onCancelBtnTap;
  String cancelBtnText;
  Color cancelBtnColor;
  Color cancelBtnTxtColor;
  bool showCancelBtn;
  double borderRadius;
  ValueChanged<String> onEmailTextFieldChanged;
  ValueChanged<String> onPasswordTextFieldChanged;
  Widget customWidget;
  Map<String, bool> checkBoxAry;
  ValueChanged<Map<String, bool>> onCheckBoxSelection;
  Map<String, int> radioButtonAry;
  ValueChanged<String> onRadioButtonSelection;

  SKAlertModel(
      {this.title,
      this.message,
      this.titleTxtColor,
      this.messageTxtColor,
      this.closeBtnColor,
      this.type,
      this.barrierDismissible,
      this.onOkBtnTap,
      this.okBtnText,
      this.okBtnColor,
      this.okBtnTxtColor,
      this.onCancelBtnTap,
      this.cancelBtnText,
      this.cancelBtnColor,
      this.cancelBtnTxtColor,
      this.showCancelBtn,
      this.borderRadius,
      this.onEmailTextFieldChanged,
      this.onPasswordTextFieldChanged,
      this.customWidget,
      this.checkBoxAry,
      this.onCheckBoxSelection,
      this.radioButtonAry,
      this.onRadioButtonSelection});
}
