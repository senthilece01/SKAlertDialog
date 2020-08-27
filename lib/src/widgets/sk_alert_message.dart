import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sk_alert_dialog/sk_alert_dialog.dart';
import 'package:sk_alert_dialog/src/model/sk_alert_model.dart';

class SKAlertMessage extends StatelessWidget {
  final SKAlertModel model;

  const SKAlertMessage({
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      model.title ??
                                          'This is a simple alert title',
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: model.titleTxtColor)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(Icons.clear,
                                        color: model.closeBtnColor, size: 30),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        model.message ??
                                            'This is a simple alert message',
                                        style: GoogleFonts.nunito(
                                            fontSize: 17,
                                            color: model.messageTxtColor))
                                  ]),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Visibility(
                                    visible: model.type == SKAlertType.info
                                        ? false
                                        : true,
                                    child: FlatButton(
                                      color:
                                          model.cancelBtnColor ?? Colors.white,
                                      onPressed: () {
                                        model.onCancelBtnTap('Cancel');
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        model.cancelBtnText ?? "Cancel",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 15,
                                            color: model.cancelBtnTxtColor ??
                                                Colors.white,
                                            letterSpacing: .5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  FlatButton(
                                    color: model.okBtnColor ?? Colors.blue,
                                    onPressed: () {
                                      model.onOkBtnTap('Confirm');
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      model.okBtnText ?? "Ok",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 15,
                                          color: model.okBtnTxtColor ??
                                              Colors.white,
                                          letterSpacing: .5),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
