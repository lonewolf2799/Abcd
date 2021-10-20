import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Row(
        children: [
          Icon(Icons.person),
          Text('User account', style: TextStyle(color: Colors.white, letterSpacing: 2.0, fontWeight: FontWeight.bold),
        ),
        ],
        ),

        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0.0,




      ),
      body: Container(
       // color: Colors.blue,
        margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 13.0),
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 50.0,
                  ),
                  SizedBox(width: 10.0,),
                  Text('RandomName' ,style: TextStyle( fontSize: 25.0, color: Colors.yellowAccent)),
                ],
              ),
            ),

            Padding(

              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.email,
                  size: 20.0,
                  color: Colors.amber,),
                  SizedBox(width: 10.0,),
                  Text('random@random_mail.com' , style : TextStyle(fontSize: 20.0, color: Colors.yellowAccent))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
              child: Row(
                children: [
                  Icon(Icons.call,
                  size: 20.0,
                  color: Colors.lightGreen,),
                  SizedBox(width: 10.0,),
                  Text('+91-XXXXXXXXX' ,style: TextStyle(fontSize: 20.0, color: Colors.yellowAccent)),
                ],
              ),
            ),
            SizedBox(height: 200.0,),
            Center(
                child:
                Container(
                  color: Colors.red,
                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),

                  child: TextButton(onPressed: (){}, child: Text('Sign Out',
              style: TextStyle(fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            ),
                )
            )


          ],
        ),
      )
    );
  }
}
