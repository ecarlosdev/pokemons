import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class UserButtonComponent extends StatelessWidget {
  const UserButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.responsive(context)),
      child: ClipOval(
        child: Container(
          width: 36.responsive(context),
          height: 36.responsive(context),
          color: Colors.grey,
        ),
      ),
    );
  }
}
