import 'package:flutter/material.dart';

class CropList extends StatefulWidget {
  const CropList({Key? key}) : super(key: key);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var str;
  final cropname = TextEditingController();

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

  List<String> crops =  [];
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
          showModalBottomSheet<void>(
            context: context, builder: (BuildContext context){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              TextField(
                controller: cropname,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
                 hintText: 'Enter Crop Name '
            ),
            ),
                  TextButton(onPressed: (){
                     if(cropname.text.isEmpty)
                    {
                    Navigator.pop(context);
                    }
                    else
                    {
                    str = cropname.text;
                    setState(() {
                    crops.add(str);

                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$str Added'),duration: Duration(seconds: 1),));
                    Navigator.pop(context);
                    }
                                  }, child: Text('Submit'),

                  )
            ],
              );

          }
          );


        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
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
          child: TextButton.icon(onPressed: (){
            Navigator.pushNamed(context, '/crop_data', arguments: {
              'name' : str,
            });
          }, icon: Icon(Icons.fastfood, color: Colors.orange,), label: Text(str, style: TextStyle(color: Colors.white),)
          )
      ),
    );
  }
}

