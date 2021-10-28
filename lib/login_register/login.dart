import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  final _emailcon = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green[800],
      /*appBar: AppBar(
        title: Text('Login Page' ,style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0),),
        centerTitle: true,
        elevation: 3.0,
        backgroundColor: Colors.yellow[800],

      ),*/
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.blueAccent, Colors.blueGrey],
                stops: [0.2, 0.5, 0.7],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        /*constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width

        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Card(
                elevation: 5.0,
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                /*shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),*/
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  ' Agriman',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _emailcon,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                    hintText: 'example@random.com',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                    )),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextField(
                                controller: _password,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                    )),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                              ),
                              /*ButtonBar(
                                alignment: MainAxisAlignment.start,
                                children: [
                                  Card( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      color: Colors.blue,
                                      child: TextButton( onPressed: (){
                                        email = _emailcon.text;
                                        password = _password.text;
                                        // Now we will pass these values for authentication to an authentication page from where it will open the page for home
                                        // but for now let us navigate to home page
                                        Navigator.pushReplacementNamed(context, '/');
                                      }, child: Text('Sign in', style: TextStyle(color: Colors.white),))),
                                  Card( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      color: Colors.blue,
                                      child: TextButton( onPressed: (){print('Sign-up');}, child: Text('Sign up', style: TextStyle(color: Colors.white),))),
                                ],
                              ),*/
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(13)),
                                      color: Colors.blue,
                                      child: TextButton(
                                        onPressed: () {
                                          email = _emailcon.text;
                                          password = _password.text;
                                          // Now we will pass these values for authentication to an authentication page from where it will open the page for home
                                          // but for now let us navigate to home page
                                          Navigator.pushReplacementNamed(context, '/');
                                        },
                                        child: Text(
                                          'Sign in',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text('Not registered ?'),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Sign up',
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// TODO: Need to make an authorization function here