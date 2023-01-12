import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maybank_app/shared/color-helper.dart';

//----------------------------Output of Loading-------------------------------------------------
class LoadingController extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingController({Key? key, this.color, this.size = 42})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        width: 200,
        child: Center(
          child: SpinKitFadingCircle(
            color: color ?? primaryColor,
            size: size,
          ),
        ),
      );
}
