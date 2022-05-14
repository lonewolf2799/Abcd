import 'package:agriman/models/plant_model.dart';
import 'package:agriman/templates/plant_data.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class CropList extends StatefulWidget {
  const CropList({Key? key}) : super(key: key);

  @override
  _CropListState createState() => _CropListState();
}

class _CropListState extends State<CropList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var str;
  final cropname = TextEditingController();
  List<String> cropNames = ['Onion', 'EggPlant'];

  List<PlantModel> crops = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    for (String s in cropNames) {
      cropAdder(s, true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void cropAdder(String s, bool imageGiven) {
    String r = s + DateTime.now().toString();
    var bytes = utf8.encode(r);
    Digest md5res = md5.convert(bytes);
    crops.add(new PlantModel(md5res.toString(), s, imageGiven));
  }

  Widget PlantCell(
    BuildContext context,
    int index,
  ) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlantData(crops[index])));
        },
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Row(
            children: [
              Hero(
                  tag: crops[index],
                  child: Image.asset(crops[index].imageStr,
                      width: 150, height: 150)),
              const SizedBox(
                width: 16,
              ),
              Text(crops[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              const Icon(Icons.navigate_next, color: Colors.black38),
            ],
          ),
        ));
  }

  late PlantModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(
          'Crops',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.builder(
                itemCount: crops.length,
                itemBuilder: (context, index) => PlantCell(context, index))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      controller: cropname,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Crop Name '),
                    ),
                    TextButton(
                      onPressed: () {
                        if (cropname.text.isEmpty) {
                          Navigator.pop(context);
                        } else {
                          str = cropname.text;
                          setState(() {
                            cropAdder(str, false);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('$str Added'),
                            duration: Duration(seconds: 1),
                          ));
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Submit'),
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final PlantModel data;
  CropCard({required this.data});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[600],
      elevation: 3.0,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 3.0),
          child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/crop_data',
                    arguments: {'data': data});
              },
              icon: Icon(
                Icons.fastfood,
                color: Colors.orange,
              ),
              label: Text(
                data.name,
                style: TextStyle(color: Colors.white),
              ))),
    );
  }
}
