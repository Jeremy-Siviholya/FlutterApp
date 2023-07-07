import 'package:flutter/material.dart';
import 'package:flutter_application_1/RegistrationPage.dart';
import 'package:flutter_application_1/dashboard.dart';

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

  login(){
    // print(emailControler);
    Map data={
      "email":emailControler.text,
      "password":passwordControler.text
    };
    if(emailControler.text=="jeremyjs@gmail.com"){
      if(passwordControler.text=='jeremy@2021')
      {
        setState(() {
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const dashboard()),
              (route) => false);
        });
      }
      else{
        setState(() {
          print('Echec');
        // SnackBarAction(label: 'Echec', onPressed: (){});
        });
      }
    }
 
    print(data);
  }


  bool view = true;
  TextEditingController emailControler=TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  final globalKey=GlobalKey<FormState>();

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
                  Icons.window,
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
              key: globalKey,
                child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: large < 900 ? 40 : large / 4),
                    child: TextFormField(
                      controller: emailControler,
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'etrer votre email';
                        }
                        if(!value.contains("@"))
                        {
                          return 'votre email est incorrect';
                        }
                        if(value.length<8)
                        {
                          return 'entrez au moins 8 caractere';
                        }
                        
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'etrer votre password';
                            }
                            if (value.length < 8) {
                              return 'entrez au moins 8 caractere';
                            }
                            return null;
                          },
                      controller: passwordControler,
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
                      
                      ElevatedButton.icon(onPressed: (){
                        if(globalKey.currentState!.validate()){
                        login();
                        }
                        }, icon:const Icon(Icons.login_sharp), label: Text('connexion')),
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
