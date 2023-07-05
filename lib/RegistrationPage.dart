import 'package:flutter/material.dart';
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

var view = true;
class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    final large = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  AppBar(
        title:const Center(
          child: Text("REGISTRATION"),
        ),
        backgroundColor: Colors.blue,
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Container(
            color:Colors.white,
            child: Column(
              children: [
                Container(
                  child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: large < 900 ? 70 : large / 4),
                          child: TextFormField(
                                                
                            decoration: const InputDecoration(
                              label: Text("name"),
                              prefixIcon: Icon(Icons.person,color: Colors.blue),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              hintText: 'Your name',
            
                            ),
                          )),
                          const SizedBox(height: 20,),
                           Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: large < 900 ? 70 : large / 4),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("telephone"),
                              hintText: 'Your phone number',
                              prefixIcon: Icon(Icons.phone,color: Colors.blue),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                            ),
                          )),
                          const SizedBox(height: 20,),
                           Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: large < 900 ? 70 : large / 4),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Email"),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(Icons.email,color: Colors.blue),
                            ),
                          )),
                          const SizedBox(height: 20,),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: large < 900 ? 70 : large / 4),
                          child: TextFormField(
                            obscureText: view,
                            decoration: InputDecoration(
                              suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    view = !view;
                                  });
                                },
                                icon: view
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              label: const Text("Password"),
                              prefixIcon:const Icon(Icons.lock,color: Colors.blue,),
                              border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          )),
                          const SizedBox(height: 50,),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: large < 900 ? 10 : large / 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           ElevatedButton.icon(onPressed: ()=>{}, icon:const Icon(Icons.save), label:const Text('Save'))
                          ],
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}