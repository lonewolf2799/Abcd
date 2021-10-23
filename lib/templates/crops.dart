import 'package:flutter/material.dart';

class CropList extends StatefulWidget {
  const CropList({Key? key}) : super(key: key);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  List<String> crops =  ['Potato', "Tomato","Apple","GreenPeas",'Onions','Pepper',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Crops', style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
          crops.map((crop)=> CropCard(str: crop,)
        ).toList()

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet()
      {

      }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      bottomSheet: Card(
        child: Text('This is bottom sheet',
      )
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  String str;
CropCard({required this.str});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[600],
      elevation: 3.0,
      child:
      Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 3.0),
          child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.fastfood, color: Colors.orange,), label: Text(str, style: TextStyle(color: Colors.white),)
          )
      ),
    );
  }
}

