import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobaicamp/user.dart';

import 'car.dart';

class MyScreen extends StatelessWidget {
  MyScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  callApi() async {
    Dio dio = Dio();
    List<Car> cars = [];
    User myUser = User(nameController.text, int.parse(ageController.text));
    var response =
        await dio.post("https://localhost/user", data: myUser.toJson());
    if (response.statusCode == 200) {
      cars = (response.data["cars"] as List)
          .map((item) => Car.fromJson(item))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mob ai camp"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: myInputDecoration,
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: myInputDecoration,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  callApi();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "submit",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

var myInputDecoration = InputDecoration(
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.black, width: 1)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Color(0xffBDBDBD), width: 0.5)),
  fillColor: Colors.white,
  filled: true,
);
