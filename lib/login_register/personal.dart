import 'package:flutter/material.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  _UserprofileState createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(
       title: Text('Profile'),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Form(
         key: _formKey,
           child: Column(
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   hintText: 'Enter your name ',
                   labelText: 'Name',
                   icon: Icon(Icons.account_circle_rounded)
                 ),
                 validator: (value) {
                   if(value == null || value.isEmpty)
                     {
                       return 'Please enter your name' ;
                     }
                   return null;
                 },
                 keyboardType: TextInputType.name,
               ),
               TextFormField(
                 decoration: InputDecoration(
                     hintText: 'Enter phone number',
                     labelText: 'Number',
                     icon: Icon(Icons.phone)
                 ),
                 validator: (value) {
                   if(value == null || value.isEmpty)
                   {
                     return 'Enter your number' ;
                   }
                   return null;
                 },
                 keyboardType: TextInputType.phone,
               ),
               TextFormField(
                 decoration: InputDecoration(
                     hintText: 'Country',
                     labelText: 'Country',
                     icon: Icon(Icons.location_on)
                 ),
                 validator: (value) {
                   if(value == null || value.isEmpty)
                   {
                     return 'Please specify your country' ;
                   }
                   return null;
                 },
                 keyboardType: TextInputType.text,
               ),
               TextFormField(

                 decoration: InputDecoration(

                     hintText: 'City ',
                     labelText: 'City',
                     icon: Icon(Icons.location_city)
                 ),
                 validator: (value) {
                   if(value == null || value.isEmpty)
                   {
                     return 'Please enter your city or nearest city' ;
                   }
                   return null;
                 },
                 keyboardType: TextInputType.text,
               ),
               SizedBox(height: 20,),
               ElevatedButton(onPressed: (){
                 if (_formKey.currentState!.validate())
                     {
                       ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text('Processing Data')),
                       );

                     }
                 else
                   {
                     ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Botched Data')),
                     );
                   }
               }, child: Text('Submit'))
             ],
           )
       ),
     ),
   );
  }
}
