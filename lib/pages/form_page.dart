import 'package:flutter/material.dart';
import 'package:todo/widget/widget_support.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Fillup ",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              "Form",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15.0, top: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //===========Name TextField===============
              Text(
                "Name",
                style: AppWidget.headlineTextFeildStyle(),
              ),
              const SizedBox(height: 7.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ),

              //==============Age Textfield===============
              const SizedBox(height: 20),
              Text(
                "Age",
                style: AppWidget.headlineTextFeildStyle(),
              ),
              const SizedBox(height: 7.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ),
              // =============Location TextField==================
              const SizedBox(height: 20),
              Text(
                "Location",
                style: AppWidget.headlineTextFeildStyle(),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Update',
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
