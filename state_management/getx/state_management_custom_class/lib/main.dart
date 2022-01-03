import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_custom_class/student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // var student = Student();
  final student = Student(name: "MJK", age: 20).obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX - State Management > Obx & Custom Class",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("GetX - State Management > Obx & Custom Class"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  // "Student Name is ${student.name.value} (${student.age.value}).",
                  "Student Name is ${student.value.name} (${student.value.age}).",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // student.name.value = student.name.value.toUpperCase();
                  student.update((student) {
                    student!.name = student.name.toString().toUpperCase();
                  });
                },
                child: const Text("Upper Case Letter"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // student.name.value = student.name.value.toLowerCase();
                  student.update((student) {
                    student!.name = student.name.toString().toLowerCase();
                  });
                },
                child: const Text("Lower Case Letter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
