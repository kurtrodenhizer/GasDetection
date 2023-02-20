import 'package:drager/string_file.dart';
import 'package:drager/subsubcategory.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class MoreSubSubcategoryScreen extends StatefulWidget {
  final List<ChemicalCategoriesItem> chemicalCategoryList;
  final String title;

  // In the constructor, require a Todo.
  MoreSubSubcategoryScreen(
      {Key? key, required this.chemicalCategoryList, required this.title})
      : super(key: key);

  @override
  _SubSubcategoryScreenState createState() => _SubSubcategoryScreenState();
}

class _SubSubcategoryScreenState extends State<MoreSubSubcategoryScreen> {
  // ProgressDialog pr;
  String pathPDF = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //pr = new ProgressDialog(context, ProgressDialogType.Normal);

    //pr.setMessage('Please wait...');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFFEEEFF1), Color(0xFFEEEFF1)]),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        itemCount: widget.chemicalCategoryList.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          // return Divider();

          return InkWell(
            onTap: () {
              createFileOfPdfUrl(widget.chemicalCategoryList[index].page)
                  .then((file) {
                setState(() {
                  pathPDF = file.path;
                  //   pr.hide();
                  var now = new DateTime.now();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFScreen(
                            pathPDF,
                            widget.chemicalCategoryList[index].eName,
                            widget.chemicalCategoryList[index].page)),
                  );
                });
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.chemicalCategoryList[index].eName,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal,
                                color: Colors
                                    .black54, // insert your font size here
                                fontWeight: FontWeight.w900)),
                        vieww(context, widget.chemicalCategoryList[index])
                      ],
                    )),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0)
              ],
            ),
          );
          /*  return ListTile(
            title: Text(
              widget.chemicalCategoryList[index].eName,
              style: TextStyle(
                  fontSize: 13.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black, // insert your font size here
                  fontWeight: FontWeight.bold),
            ),
            subtitle: vieww(context, widget.chemicalCategoryList[index]),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: () {
              createFileOfPdfUrl(widget.chemicalCategoryList[index].page)
                  .then((file) {
                setState(() {
                  pathPDF = file.path;
                  //   pr.hide();
                  var now = new DateTime.now();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PDFScreen(
                            pathPDF, widget.chemicalCategoryList[index].eName)),
                  );
                });
              });
            },
          );*/
        },
      ),
    );
  }

  Widget vieww(BuildContext context, ChemicalCategoriesItem dd) {
    String textt = dd.eNumber;
    double sizee = 0.0;
    if (widget.title == "Contact Information") {
      textt = dd.page;
      sizee = 13.0;
      if (dd.page.contains("http://www.draeger")) {
        textt = "";
        sizee = 0.0;
        // return null;
      }
    }
    if (textt != "") {
      textt = textt.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
      textt = "Part No. " + textt;
      sizee = 13.0;
    }
    return Text(
      textt,
      style: TextStyle(
          fontSize: sizee,
          fontStyle: FontStyle.normal,
          color: Color(0xFF929292),
          fontWeight: FontWeight.bold),
    );
  }
}
