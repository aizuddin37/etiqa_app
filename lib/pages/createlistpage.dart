import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maybank_app/cubit/list_cubit.dart';
import 'package:maybank_app/pages/homepage.dart';
import 'package:maybank_app/shared/loadingcontroller.dart';

import '../shared/color-helper.dart';

class CreateListPage extends StatefulWidget {
  static String routeName = '/create-list-page';

  const CreateListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateListPage> createState() => _CreateListPageState();
}

class _CreateListPageState extends State<CreateListPage> {
  late DateTime _selectedstartDate;
  late DateTime _selectedendDate;
  final title = TextEditingController();
  final start_date = TextEditingController();
  final end_date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.selection =
        TextSelection.fromPosition(TextPosition(offset: title.text.length));
    start_date.selection = TextSelection.fromPosition(
        TextPosition(offset: start_date.text.length));
    end_date.selection =
        TextSelection.fromPosition(TextPosition(offset: end_date.text.length));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black,
        title: Text("New list",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: BlocProvider(
            create: (context) => ListCubit()..init(),
            child: BlocConsumer<ListCubit, ListState>(
                builder: (context, state) {
                  if (state.list != null) {
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(height: 10),

                          //Container of todo title
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('To-Do Title ',
                                        style: TextStyle(
                                            color: grayTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                //----------------------------TextField of title-------------------------------------------------
                                TextField(
                                  autofocus: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.normal),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: title,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                  ),
                                  onChanged: (e) {
                                    setState(() {
                                      title.text = e;
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),

                          //----------------------------Container os start Date-------------------------------------------------
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Start Date ',
                                        style: TextStyle(
                                            color: grayTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                //----------------------------TextField of start Date-------------------------------------------------
                                TextField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.normal),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: start_date,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                  ),
                                  onTap: () {
                                    _selectstartDate(context);
                                  },
                                ),
                              ],
                            ),
                          ),

                          //----------------------------Container of End date-------------------------------------------------
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Estimated End Date ',
                                        style: TextStyle(
                                            color: grayTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                //----------------------------TextField of endDate-------------------------------------------------
                                TextField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.normal),
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: end_date,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: primaryColor,
                                        )),
                                  ),
                                  onTap: () {
                                    _selectendDate(context);
                                  },
                                ),
                              ],
                            ),
                          ),

                          ElevatedButton(
                              onPressed: () {
                                context.read<ListCubit>().onAddList(
                                    _selectedstartDate,
                                    _selectedendDate,
                                    title.text,
                                    state.list.length + 1);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0))),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(238, 88, 31, 1))),
                              child: Container(
                                width: 150,
                                height: 40,
                                child: Center(
                                    child: Text(
                                  "Done",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ))
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    width: 200,
                                    child: Image.asset(
                                      'lib/assets/empty.png',
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text("list is not available",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                listenWhen: (previous, current) =>
                    current is MessageDialogState,
                listener: (context, state) async {
                  if (state is MessageDialogState) {
                    _showMessage(context);
                  }
                }),
          ),
        ),
      ),
    );
  }

  _selectstartDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.black,
                surface: primaryColor,
                onSurface: buttonColor,
              ),
            ),
            child: child!));

    if (newSelectedDate != null) {
      _selectedstartDate = newSelectedDate;
      start_date
        ..text = DateFormat.yMMMd().format(_selectedstartDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: start_date.text.length, affinity: TextAffinity.upstream));
    }
  }

  _selectendDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.black,
                surface: primaryColor,
                onSurface: buttonColor,
              ),
            ),
            child: child!));

    if (newSelectedDate != null) {
      _selectedendDate = newSelectedDate;
      end_date
        ..text = DateFormat.yMMMd().format(_selectedendDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: start_date.text.length, affinity: TextAffinity.upstream));
      print(end_date.text);
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

_showMessage(BuildContext context) async {
  return showDialog<bool?>(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: Column(
            children: [
              Text(
                "Successfully Created!",
                maxLines: 2,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Divider(
                height: 4,
                color: primaryColor,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 38,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 232, 205, 29)),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Center(
                          child: Text(
                        "Okay",
                        style: TextStyle(color: Colors.black),
                      )),
                    )),
              ),
            ],
          ),
        );
      });
}
