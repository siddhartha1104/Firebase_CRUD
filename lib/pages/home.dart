import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/form_page.dart';
import 'package:todo/server/database.dart';
import 'package:todo/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // =====fetching Data from Firestore========
  Stream? EmployeeStream;

  getOnTheLoad() async {
    EmployeeStream = await DataBaseMethods().getEmployeeDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
      stream: EmployeeStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: " + ds["Name"],
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                            Text(
                              "Age: " + ds["Age"],
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                            Text(
                              "Location: " + ds["Location"],
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const FormPage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Firebase ",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              "CURD",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
      // =====Read all the data from the firestore and display in the app====
      body: Container(
        margin: const EdgeInsets.only(top: 25, left: 12, right: 12),
        child: Column(
          children: [
            Expanded(child: allEmployeeDetails()),
          ],
        ),
      ),
    );
  }
}
