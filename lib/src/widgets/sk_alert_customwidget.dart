import 'package:flutter/material.dart';
import 'package:sk_alert_dialog/src/model/sk_alert_model.dart';

class SKAlertCustomWidget extends StatelessWidget {
  final SKAlertModel model;

  const SKAlertCustomWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: double.infinity, height: double.infinity),
        child: Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: Theme.of(context).dialogBackgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(model.borderRadius)),
              titlePadding: EdgeInsets.all(0.0),
              title: Container(
                child: Center(child: model.customWidget),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
