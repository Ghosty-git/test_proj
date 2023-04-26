import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_proj/features/test_app/data/models/test_model.dart';
import 'package:test_proj/features/test_app/presentation/logic/bloc/test_user_bloc.dart';

import '../../../../../iternal/dependencies/get_it.dart';

class TestInfoScreen extends StatefulWidget {
  final int id;
  final String name;
  final String username;
  final String phone;
  const TestInfoScreen({
    super.key,
    required this.id,
    required this.name,
    required this.username,
    required this.phone,
  });

  @override
  State<TestInfoScreen> createState() => _TestInfoScreenState();
}

class _TestInfoScreenState extends State<TestInfoScreen> {
  late TestUserBloc bloc;

  @override
  void initState() {
    bloc = getIt<TestUserBloc>();
    bloc.add(GetUserIdEvent(
      id: widget.id,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id.toString()),
      ),
      body: BlocConsumer<TestUserBloc, TestUserState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 6)),
                    width: 200.w,
                    height: 200.h,
                    child: Image.asset("assets/images/profile.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Text(
                    widget.username,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                children: [
                  Text(
                    widget.phone,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
