import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:maybank_app/cubit/list_cubit.dart';
import 'package:maybank_app/pages/createlistpage.dart';
import 'package:maybank_app/pages/editlistpage.dart';
import 'package:maybank_app/shared/color-helper.dart';
import 'package:maybank_app/shared/defaultbackground.dart';
import 'package:maybank_app/shared/loadingcontroller.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = '/home';
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListCubit()..init(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title: Text(
            widget.title,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocConsumer<ListCubit, ListState>(
            builder: (context, state) {
              if (state.isInitialize || state.isLoading) {
                return Center(
                  child: LoadingController(),
                );
              } else if (state.list.isEmpty) {
                return RefreshIndicator(
                  onRefresh: () {
                    context.read<ListCubit>().refresh(state.list);
                    return Future.value(true);
                  },
                  child: Center(
                    child: DefaultController(),
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () {
                    context.read<ListCubit>().refresh(state.list);
                    return Future.value(true);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              final list_stage = state.list.elementAt(index);
                              final newstart = DateFormat.yMMMd().format(
                                  list_stage.start_date ?? DateTime.now());
                              final newend = DateFormat.yMMMd().format(
                                  list_stage.end_date ?? DateTime.now());
                              final days_left = list_stage.end_date
                                  ?.difference(
                                      list_stage.start_date ?? DateTime.now())
                                  .inHours;
                              //----------------------------Display cards of object-------------------------------------------------
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditListPage(
                                                list: list_stage,
                                                id: index,
                                              )));
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  elevation: 20,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    width: 150,
                                    padding: EdgeInsets.all(10),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 150,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('${list_stage.title} ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("Start Date",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300)),
                                                        SizedBox(height: 10),
                                                        Text('${newstart}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Text("End Date",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      SizedBox(height: 10),
                                                      Text('${newend}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Text("Time left",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      SizedBox(height: 10),
                                                      Text(
                                                          '${days_left} Hour(s)left',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          Container(
                                            height: 40,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              color: bottomColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text('status: ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      Text(
                                                          list_stage.status !=
                                                                  null
                                                              ? "incomplete"
                                                              : "complete",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          'Tick if completed: ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                      Checkbox(
                                                        checkColor:
                                                            Colors.white,
                                                        value: list_stage
                                                            .completed,
                                                        onChanged: (value) {
                                                          context
                                                              .read<ListCubit>()
                                                              .onComplete(
                                                                  index,
                                                                  value!,
                                                                  state.list);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }
            },
            listenWhen: (previous, current) => current is MessageDialogState,
            listener: (context, state) async {
              if (state is MessageDialogState) {
                _showMessage(context);
              }
            }),
        //--------------------------Floating Button-------------------------------------------------
        floatingActionButton: Container(
          height: 45,
          width: 45,
          child: FloatingActionButton(
            elevation: 10,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateListPage()));
            },
            backgroundColor: buttonColor,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
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
                "Congratulations,You have successfully finished your task!",
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
                      Navigator.of(_).pop(false);
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
