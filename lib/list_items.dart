import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyItems extends StatelessWidget {
  const MyItems({Key? key}) : super(key: key);
  final String title = 'Ghazanfar';
  final String subTitle = 'BSCS 7th';
  static List items = [
    1,
    2,
    3,
    4,
    5,
    1,
    2,
    3,
    4,
    5,
    1,
    2,
    3,
    4,
    5,
    1,
    2,
    3,
    4,
    5,
  ];
  final String imgUrl =
      'https://images.unsplash.com/photo-1523875194681-bedd468c58bf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: CustomTile(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomTile(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(30)),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              // color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
            ),
            SizedBox(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text(title), Text(subTitle)],
              ),
            ),
            SizedBox(
              //   color: Colors.blue,
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(child: Image.network(imgUrl)),
            )
          ],
        ),
      );
}
