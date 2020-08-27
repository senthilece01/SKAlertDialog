import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sk_alert_dialog/src/model/sk_alert_model.dart';

class SKAlertRadioButton extends StatefulWidget {
  final SKAlertModel model;

  SKAlertRadioButton({this.model});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SKAlertRadioButtonState();
  }
}

class SKAlertRadioButtonState extends State<SKAlertRadioButton> {
  // Group Value for Radio Button.
  int id = 1;
  String selectedText;

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
                  borderRadius:
                      BorderRadius.circular(widget.model.borderRadius)),
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
                                      widget.model.title ??
                                          'This is a simple alert title',
                                      style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: widget.model.titleTxtColor)),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(Icons.clear,
                                        color: widget.model.closeBtnColor,
                                        size: 30),
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
                              Column(
                                children: widget.model.radioButtonAry.keys
                                    .map((text) => RadioListTile(
                                          title: Text(text),
                                          value:
                                              widget.model.radioButtonAry[text],
                                          groupValue: id,
                                          onChanged: (val) {
                                            setState(() {
                                              selectedText = text;
                                              id = widget
                                                  .model.radioButtonAry[text];
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    color: widget.model.cancelBtnColor ??
                                        Colors.white,
                                    onPressed: () {
                                      widget.model.onCancelBtnTap('Cancel');
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      widget.model.cancelBtnText ?? "Cancel",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 15,
                                          color:
                                              widget.model.cancelBtnTxtColor ??
                                                  Colors.white,
                                          letterSpacing: .5),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  FlatButton(
                                    color:
                                        widget.model.okBtnColor ?? Colors.blue,
                                    onPressed: () {
                                      widget.model
                                          .onRadioButtonSelection(selectedText);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      widget.model.okBtnText ?? "Ok",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 15,
                                          color: widget.model.okBtnTxtColor ??
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
  }
}
