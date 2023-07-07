import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var name = 'Julian';
  List Array = ['jane', 'doe', 'LIL'];
  List<Map> users = [
    {'name': 'JSA', 'age': 23, 'value': true, 'size': 20.8},
    {'name': 'JSY', 'age': 29, 'value': false, 'size': 29.8},
    {'name': 'JSA', 'age': 23, 'value': true, 'size': 20.8},
    {'name': 'JSY', 'age': 29, 'value': false, 'size': 29.8}
  ];
  DateTime d = DateTime.now();
  Widget  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:const Text('Home page'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Text("hello ${Array[0]}"),
              Text(" now is $d"),
              Container(
                height: 200,
                width: 200,
                child: GridView.builder(
                    itemCount: users.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) =>
                        Text('${users[index]['name']}'))),
              ),
              Form(
                  child: Column(
                children: [TextFormField( decoration:const InputDecoration(hintText: 'enter your name',label: Text('your name'),border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
                
                )],
              )),
              TextButton(onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(),))
              }, child:const Text('click')),
              IconButton(onPressed: () => {}, icon:const Icon(Icons.window)),
              TextButton.icon(
                  onPressed: () => {},
                  icon:const Icon(Icons.settings),
                  label:const Text('settings'))
            ],
          ),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => {}, child:const Icon(Icons.add)));
  }
}
