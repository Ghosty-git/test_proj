import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_proj/features/test_app/data/models/test_model.dart';
import 'package:test_proj/features/test_app/presentation/screens/test_screen/test_info_screen.dart';
import 'package:test_proj/features/test_app/presentation/widgets/dialog_box.dart';

import '../../../../../iternal/dependencies/get_it.dart';
import '../../logic/bloc/test_user_bloc.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final controllerName = TextEditingController();
  final controllerSurname = TextEditingController();
  final controllerPhone = TextEditingController();

  late TestUserBloc bloc;

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controllerName: controllerName,
            controllerSurname: controllerSurname,
            controllerPhone: controllerPhone,
            onSave: () {
              saveNewTask;
            },
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void saveNewTask() {
    setState(() {
     
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    bloc = getIt<TestUserBloc>();
    bloc.add(GetTestUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Test Proj",
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            createNewTask();
          },
          child: Icon(Icons.add),
        ),
        body: BlocConsumer<TestUserBloc, TestUserState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {

            if (state is TestUserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is TestUserLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        bloc.add(
                          GetTestUserEvent(),
                        );
                      },
                      child: ListView.separated(
                        itemCount: state.testModel.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TestInfoScreen(
                                    id: state.testModel[index].id!,
                                    name: state.testModel[index].name!,
                                    username: state.testModel[index].username!,
                                    phone: state.testModel[index].phone!,
                                  ),
                                ),
                              );
                            },
                            child: Dismissible(
                              background: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                color: Colors.red,
                              ),
                              key: UniqueKey(),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    bottom: 10.h,
                                    top: 10.h),
                                width: 390.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black)),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(40.r),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.r),
                                        child: Image.asset(
                                          "assets/images/profile.png",
                                          width: 65.w,
                                          height: 65.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          state.testModel[index].name ?? "",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          state.testModel[index].username ?? "",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          state.testModel[index].phone ?? "",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container();
                        },
                      ),
                    ),
                  )
                ],
              );
            }

            return Container(
              width: 50.w,
              height: 50.h,
              color: Colors.red,
            );
          },
        ));
  }
}
