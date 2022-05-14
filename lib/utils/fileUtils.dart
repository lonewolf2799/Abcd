// takes input as the name of the file in the same dir and sends the entire data in a list
// will be used to parse the cities or can be extended
// found that there is no better way to get the string from text files other than using the following code
// snippet

/*
  //Inside a stateful widget
  //say we have a list of strings

  List<String> ls1;
  fetchData(String fileNameInAssetFolder) async{
    // file is in asset folder immediate or specify 
    await rootBundle.loadString('assets/fileNameInAssetFolder')
          .then((value) => ls1 = value);
    setState((){
      ls1;
    })

  } 
*/

List<List<String>> txtToList(String txt, String delim1, String delim2) {
  List<String> s = txt.split(delim1);
  List<List<String>> res = [];
  for (var e in s) {
    res.add(e.split(delim2));
  }
  return res;
}
