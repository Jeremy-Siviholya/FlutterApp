import 'package:flutter/material.dart';
import 'package:flutter_application_1/RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

  bool view = true;

  Widget build(BuildContext context) {
    final large = MediaQuery.of(context).size.width;
    return Scaffold(
      // body: Center(
      //   child: large <=670 ? Text('mobile'): large<=900 ? Text('Tablette'):Text('desk'),
      // ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.adobe_rounded,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Container(
            child: Form(
                child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: large < 900 ? 40 : large / 4),
                    child: TextFormField(
                      decoration:
                         const InputDecoration(label: Text('Enter your email'),
                         border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                         hintText: 'your email'
                         ),
                    )),
                   const SizedBox(height: 20,),
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: large < 900 ? 40 : large / 4),
                    child: TextFormField(
                      obscureText: view,
                      decoration: InputDecoration(
                          label: const Text('Enter your password'),
                          border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          suffix: IconButton(
                              onPressed: () => {
                                    setState(() {
                                      view = !view;
                                    })
                                  },
                              icon: view
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility))),
                    )),
                    const SizedBox(height: 70,),
                    Padding(
                     padding: EdgeInsets.symmetric(
                      
                        vertical: 40,horizontal:large < 900 ? 10 : large / 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      
                      ElevatedButton.icon(onPressed: ()=>{}, icon: Icon(Icons.login_sharp), label: Text('connexion')),
                      ElevatedButton.icon(onPressed: ()=>{
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>RegistrationPage(),))
                      }, icon:const Icon(Icons.app_registration), label:const Text('Registration'))
                      ],),
                    )
              
              ],
            )),
          )
        ],
      )),
    );
  }
}
