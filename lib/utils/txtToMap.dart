// takes input as the name of the file in the same dir and sends the entire data in a list
// will be used to parse the cities or can be extended

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

Future<List<List<String>>> txtToList(String filename, String delim) async {
  List<List<String>> ls = [];
  String pathToFile = join(dirname(Platform.script.path), '..', filename);
  File file = File(pathToFile);

  if (await file.exists()) {
    var contents = StringBuffer();
    var contentStream = file.openRead();
    contentStream.transform(Utf8Decoder()).transform(LineSplitter()).listen(
        (String line) {
      contents.write(line);
    }, onDone: () => ls.add(contents.toString().split(delim)));
  }

  return ls;
}
