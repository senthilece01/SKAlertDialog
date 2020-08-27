library sk_alertdialog;

import 'package:flutter/material.dart';

import 'src/model/sk_alert_model.dart';
import 'src/widgets/sk_alert_checkbox.dart';
import 'src/widgets/sk_alert_customwidget.dart';
import 'src/widgets/sk_alert_message.dart';
import 'src/widgets/sk_alert_radiobutton.dart';
import 'src/widgets/sk_alert_textfield.dart';

enum SKAlertType {
  info,
  buttons,
  loginform,
  checkbox,
  radiobutton,
  custom,
}

class SKAlertDialog {
  static Future show({
    @required BuildContext context,
    String title,
    String message,
    Color titleTxtColor = Colors.black,
    Color messageTxtColor = Colors.black,
    Color closeBtnColor = Colors.black,
    @required SKAlertType type,
    bool barrierDismissible = false,
    ValueChanged<String> onOkBtnTap,
    String okBtnText = "OK",
    Color okBtnColor = const Color(0xFF50A1FF),
    Color okBtnTxtColor = Colors.white,
    ValueChanged<String> onCancelBtnTap,
    String cancelBtnText = "CANCEL",
    Color cancelBtnColor = const Color(0xFFEAECF0),
    Color cancelBtnTxtColor = Colors.black,
    bool showCancelBtn = false,
    double borderRadius = 5.0,
    ValueChanged<String> onEmailTextFieldChanged,
    ValueChanged<String> onPasswordTextFieldChanged,
    Widget customWidget,
    Map<String, bool> checkBoxAry,
    ValueChanged<Map<String, bool>> onCheckBoxSelection,
    Map<String, int> radioButtonAry,
    ValueChanged<String> onRadioButtonSelection,
  }) {
    // 1
    // Default Child
    Widget defaultChild = AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: Container(),
    );

    // 2
    // Assing the value to the model
    SKAlertModel skAlertModel = SKAlertModel(
        title: title,
        message: message,
        titleTxtColor: titleTxtColor,
        messageTxtColor: messageTxtColor,
        closeBtnColor: closeBtnColor,
        type: type,
        barrierDismissible: barrierDismissible,
        onOkBtnTap: onOkBtnTap,
        okBtnText: okBtnText,
        okBtnColor: okBtnColor,
        okBtnTxtColor: okBtnTxtColor,
        onCancelBtnTap: onCancelBtnTap,
        cancelBtnText: cancelBtnText,
        cancelBtnColor: cancelBtnColor,
        cancelBtnTxtColor: cancelBtnTxtColor,
        showCancelBtn: showCancelBtn,
        borderRadius: borderRadius,
        onEmailTextFieldChanged: onEmailTextFieldChanged,
        onPasswordTextFieldChanged: onPasswordTextFieldChanged,
        customWidget: customWidget,
        checkBoxAry: checkBoxAry,
        onCheckBoxSelection: onCheckBoxSelection,
        radioButtonAry: radioButtonAry,
        onRadioButtonSelection: onRadioButtonSelection);

    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: barrierDismissible,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, anim1, anim2) {
          switch (type) {
            case SKAlertType.info:
            case SKAlertType.buttons:
              return SKAlertMessage(model: skAlertModel);
              break;
            case SKAlertType.loginform:
              return SKAlertTextField(model: skAlertModel);
            case SKAlertType.custom:
              return SKAlertCustomWidget(model: skAlertModel);
            case SKAlertType.checkbox:
              return SKAlertCheckbox(model: skAlertModel);
            case SKAlertType.radiobutton:
              return SKAlertRadioButton(model: skAlertModel);
            default:
              return defaultChild;
          }
        });
  }
}
