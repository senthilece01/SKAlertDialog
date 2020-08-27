import 'package:example/model/raw_data.dart';
import 'package:example/utils/utils_importer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sk_alert_dialog/sk_alert_dialog.dart';

class AlertView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlertViewState();
  }
}

class AlertViewState extends State<AlertView> {
  bool isDarkThemeMode = false;
  final emailController = TextEditingController();
  final FocusNode _emailAddressFocus = FocusNode();

  Map<String, bool> checkBoxAry = {
    'Choice One': true,
    'Choice Two': false,
    'Choice Three': true,
    'Choice Four': false,
    'Choice Five': false,
    'Choice Six': false,
    'Choice Seven': false,
    'Choice Eight': false,
  };

  Map<String, int> radioButtonAry = {
    'Choice One': 1,
    'Choice Two': 2,
    'Choice Three': 3,
    'Choice Four': 4,
    'Choice Five': 5,
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 70, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(UtilsImporter().stringUtils.title,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 35,
                        letterSpacing: .9,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              UtilsImporter().stringUtils.description,
              style: GoogleFonts.nunito(
                  color: UtilsImporter().colorUtils.greycolor,
                  fontSize: 17,
                  letterSpacing: .5,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: alertTypesAry == null ? 0 : alertTypesAry.length,
                itemBuilder: (BuildContext context, int index) {
                  IconData icon;

                  if (index == 0) {
                    icon = Icons.check_box_outline_blank;
                  } else if (index == 1) {
                    icon = Icons.content_copy;
                  } else if (index == 2) {
                    icon = Icons.people;
                  } else if (index == 3) {
                    icon = Icons.check_box;
                  } else if (index == 4) {
                    icon = Icons.radio_button_checked;
                  } else {
                    icon = Icons.photo_library;
                  }

                  return new GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _onTileClicked(index),
                    child: AlertCard(
                      title: alertTypesAry[index]['title'],
                      description: alertTypesAry[index]['description'],
                      index: index,
                      iconData: icon,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to be called on click
  void _onTileClicked(int index) {
    if (index == 0) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.info,
        title: UtilsImporter().stringUtils.info_alert_title,
        message: UtilsImporter().stringUtils.info_alert_msg,
        onOkBtnTap: (value) {
          print('Okay Button Tapped');
        },
      );
    } else if (index == 1) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.buttons,
        title: UtilsImporter().stringUtils.buttons_alert_title,
        message: UtilsImporter().stringUtils.buttons_alert_msg,
        onOkBtnTap: (value) {
          print('Okay Button Tapped');
        },
        onCancelBtnTap: (value) {
          print('Cancel Button Tapped');
        },
      );
    } else if (index == 2) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.buttons,
        title: UtilsImporter().stringUtils.custom_buttons_alert_title,
        message: UtilsImporter().stringUtils.custom_buttons_alert_msg,
        okBtnText: UtilsImporter().stringUtils.yes,
        okBtnTxtColor: Colors.white,
        okBtnColor: const Color(0xFF3BD459),
        cancelBtnText: UtilsImporter().stringUtils.no,
        cancelBtnTxtColor: Colors.white,
        cancelBtnColor: const Color(0xFFFF4954),
        onOkBtnTap: (value) {
          print('Okay Button Tapped');
        },
        onCancelBtnTap: (value) {
          print('Cancel Button Tapped');
        },
      );
    } else if (index == 3) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.loginform,
        title: UtilsImporter().stringUtils.login_form_alert_title,
        okBtnText: UtilsImporter().stringUtils.login,
        onOkBtnTap: (value) {
          print('Okay Button Tapped');
        },
        onCancelBtnTap: (value) {
          print('Cancel Button Tapped');
        },
        onEmailTextFieldChanged: (value) {
          print('On Email Text Changed $value');
        },
        onPasswordTextFieldChanged: (value) {
          print('On Password Text Changed $value');
        },
      );
    } else if (index == 4) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.checkbox,
        checkBoxAry: checkBoxAry,
        title: UtilsImporter().stringUtils.checkbox_alert_title,
        onCancelBtnTap: (value) {
          print('Cancel Button Tapped');
        },
        onCheckBoxSelection: (value) {
          print('onCheckBoxSelection $value');
        },
      );
    } else if (index == 5) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.radiobutton,
        radioButtonAry: radioButtonAry,
        title: UtilsImporter().stringUtils.radio_button_alert_title,
        onCancelBtnTap: (value) {
          print('Cancel Button Tapped');
        },
        onRadioButtonSelection: (value) {
          print('onRadioButtonSelection $value');
        },
      );
    } else if (index == 6) {
      SKAlertDialog.show(
        context: context,
        type: SKAlertType.custom,
        title: UtilsImporter().stringUtils.radio_button_alert_title,
        customWidget: customWidget1(),
      );
    }
  }

  Widget customWidget() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                UtilsImporter().stringUtils.forgot_pswd,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.7),
                    fontSize: 20),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        _ShowEmailInput(),
        _showForgotPswdButton(),
      ],
    );
  }

  Widget customWidget1() {
    return new Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Thank you for reviewing the package',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColorDark.withOpacity(0.7),
                  fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: const Color(0xFF50A1FF),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'The End!',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Widget _ShowEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: new TextField(
        cursorColor: Theme.of(context).primaryColor,
        controller: emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        focusNode: _emailAddressFocus,
        textInputAction: TextInputAction.next,
        autofocus: true,
        onSubmitted: (term) {},
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Theme.of(context).primaryColorDark),
        decoration: InputDecoration(
            labelText: UtilsImporter().stringUtils.email_address,
            labelStyle: TextStyle(
              color: UtilsImporter().colorUtils.greycolor,
            ),
            hintStyle: TextStyle(
              color: UtilsImporter().colorUtils.greycolor,
            ),
            border: new UnderlineInputBorder(
                borderSide:
                    new BorderSide(color: Theme.of(context).primaryColor))),
      ),
    );
  }

  Widget _showForgotPswdButton() {
    final GestureDetector forgotPswdButtonWithGesture = new GestureDetector(
      onTap: _forgotPswdBtnTapped,
      child: new Container(
        height: 40.0,
        decoration: new BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: new BorderRadius.all(Radius.circular(6.0))),
        child: new Center(
          child: new Text(
            UtilsImporter().stringUtils.done.toUpperCase(),
            style: new TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
    return new Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        child: forgotPswdButtonWithGesture);
  }

  _forgotPswdBtnTapped() {
    Navigator.of(context).pop();
  }
}

class AlertCard extends StatefulWidget {
  String title;
  String description;
  int index;
  IconData iconData;

  AlertCard({this.title, this.description, this.index, this.iconData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlertCardState();
  }
}

class AlertCardState extends State<AlertCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(widget.iconData,
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.4))
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.title,
                              style: GoogleFonts.nunito(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5),
                            Text(widget.description,
                                style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        UtilsImporter().colorUtils.greycolor)),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.chevron_right,
                              color: Theme.of(context)
                                  .primaryColorDark
                                  .withOpacity(0.4))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(height: 4),
            Divider()
          ],
        ),
      ),
    );
  }
}
