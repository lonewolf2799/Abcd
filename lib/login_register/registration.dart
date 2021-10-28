import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _name = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();

  String name = "";
  String password = "";
  bool error = false;
  bool email_empty = false;
  bool ob = true;
  bool ob2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text('Sign up'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' Email address:', style: TextStyle(fontSize: 15, color: Colors.blueAccent),),
            SizedBox(height: 7),

            TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.grey[200],
                hintText: 'random@email.com'
              ),
            ),

            if(email_empty)
              Container(margin: EdgeInsets.symmetric(vertical: 7.0),
                  child: Center(child: Text(' Email address not filled !!'))),
            SizedBox(height: 15,),
            Text('Password:', style: TextStyle(fontSize: 15, color: Colors.blueAccent)),
            SizedBox(height: 7),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.grey[200],
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  onPressed: (){
                    setState(() {
                      ob = !ob;
                    });
                  },

                )
              ),
              obscureText: ob,
            ),
            SizedBox(height: 15,),

            Text('Confirm Password:', style: TextStyle(fontSize: 15, color: Colors.blueAccent) ),
            SizedBox(height: 7),
            TextField(
              controller: _confirmpassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.grey[200],
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: (){
                      setState(() {
                        ob2 = !ob2;
                      });
                    },

                  )
              ),
              obscureText: ob2,
            ),
            if(error)
              SizedBox(height: 5,),
            if(error)
              Center(child: Text('Enter Password again !! ', style: TextStyle(fontSize: 15, color: Colors.red),)),

            SizedBox(height: 15,),

            Center(
              child: TextButton(onPressed: ()
                {
                  if(_password.text != _confirmpassword.text)
                    {
                     setState(() {
                      error = true;
                     });
                    }
                  else{
                    setState(() {
                      error = false;
                    });
                    //error = false;
                    Navigator.pushNamed(context, '/profile');
                  }

                },
              child: Text('Submit'),),
            )

          ],
        ),
      ),
    );
  }
}
