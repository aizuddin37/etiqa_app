import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:maybank_app/shared/color-helper.dart';

//----------------------------Output if Todolist is empty-------------------------------------------------
class DefaultController extends StatelessWidget {
  final double size;
  final Color? color;

  const DefaultController({Key? key, this.color, this.size = 42})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      height: 250,
      width: 200,
      child: Center(
        child: Container(
          child: Column(
            children: [
              Image.asset("lib/assets/empty.png"),
              Text("There is no data in the system.",
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ));
}
