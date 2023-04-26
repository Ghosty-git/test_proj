import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_proj/features/test_app/presentation/widgets/custom_buttom.dart';

class DialogBox extends StatelessWidget {
  
    final controllerName;
  final controllerSurname;
  final controllerPhone;
    VoidCallback onSave;
    VoidCallback onCancel;
   DialogBox({
    super.key,
    this.controllerName,
    this.controllerSurname,
    this.controllerPhone,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.blue,
      content: Container(
        height: 250.h,
        child: Column(
          children: [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add Name"),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextField(
              controller: controllerSurname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add Username"),
            ),
            SizedBox(height: 8.h),
            TextField(
              controller: controllerPhone,
              decoration: InputDecoration(
                  
                  border: OutlineInputBorder(), hintText: "Add phone number"),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtom(title: "Save", onPressed: onSave),
                SizedBox(
                  width: 8.w,
                ),
                CustomButtom(title: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class DialogBox extends StatefulWidget {


//   @override
//   State<DialogBox> createState() => _DialogBoxState();
// }

// class _DialogBoxState extends State<DialogBox> {
//     final controllerName;
//   final controllerSurname;
//   final controllerPhone;

//   _DialogBoxState(this.controllerName, this.controllerSurname, this.controllerPhone);
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
