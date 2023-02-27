import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:drager/more_subcategory.dart';
import 'package:drager/progress_hud.dart';
import 'package:drager/splash_screen.dart';
import 'package:drager/string_file.dart';
import 'package:drager/subcategory.dart';
import 'package:drager/subsubcategory.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

//import 'package:progress_dialog/progress_dialog.dart';
//import 'package:material_search/material_search.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:esys_flutter_share/esys_flutter_share.dart';

void main() => runApp(new MaterialApp(
    theme: ThemeData(
        primaryColor: Color(0xFFEEEFF1),
        accentColor: Colors.white70,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Color(0xFF000000),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        fontFamily: "Schyler"),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Schyler",
        primaryColor: Color(0xFFEEEFF1),
        accentColor: Colors.white70,
        primarySwatch: MaterialColor(
          0xFF02029A,
          <int, Color>{
            50: Color(0xFFE3F2FD),
            100: Color(0xFFBBDEFB),
            200: Color(0xFF90CAF9),
            300: Color(0xFF64B5F6),
            400: Color(0xFF42A5F5),
            500: Color(0xFF02029A),
            600: Color(0xFF1E88E5),
            700: Color(0xFF1976D2),
            800: Color(0xFF1565C0),
            900: Color(0xFF02029A),
          },
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key? key, required this.title, this.color, this.colorName, this.index})
      : super(key: key);
  final Color? color;
  final String? colorName;
  final int? index;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var toolbarTitle = Flutkart.gasguideText;
  int _currentIndex = 0;
  String serachText = "";
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  late List<NavigationIconView> _navigationViews;

  //ProgressDialog pr;
  String pathPDF = "";

  // MessageItem mMessageItem = Flutkart.gasguide[0];
  double iconSize = 80;
  MaterialColor iconColor = Colors.blue;

  late List<MessageItem> gasguidelist;

  List<DataList> productlist = dataListFromJson(jsonProductStr);
  List<DataList> morelist = dataListFromJson(jsonMoreStr);
  List<ChemicalItem> chemicalList = chemicalFromJson(jsonChemicalStr).data;
  List<ChemicalCategoriesItem> chemicalCategoryList =
      chemicalCategoriesFromJson(jsonChemicalSubStr).data;

  String gasguideFileText = Flutkart.gasguideFileText;

  @override
  void initState() {
    super.initState();
    if (gasguideFileText.isNotEmpty) {
      gasguidelist = messageItemFromJson(gasguideFileText);
    }

    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        // icon: const Icon(Icons.gesture),
        activeIcon: Image.asset(
          'assets/bar01.png',
          height: 35,
          width: 35,
          color: Colors.blue,
        ),
        icon: Image.asset(
          'assets/bar0.png',
          height: 35,
          width: 35,
          color: Colors.grey,
        ),
        title: Flutkart.gasguideText,
        color: Colors.black,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: Image.asset(
          'assets/bar11.png',
          height: 35,
          width: 35,
          color: Colors.blue,
        ),
        //icon: CustomInactiveIcon(),
        //icon: const Icon(Icons.clear_all),
        icon: Image.asset(
          'assets/bar1.png',
          height: 35,
          width: 35,
          color: Colors.grey,
        ),
        title: Flutkart.productsText,
        color: Colors.black,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: Image.asset(
          'assets/bar21.png',
          height: 35,
          width: 35,
          color: Colors.blue,
        ),
        // activeIcon: const Icon(Icons.cloud),
        //icon: const Icon(Icons.cloud_queue),
        icon: Image.asset(
          'assets/bar2.png',
          height: 35,
          width: 35,
          color: Colors.grey,
        ),
        title: Flutkart.chemicalText,
        color: Colors.black,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: Image.asset(
          'assets/bar31.png',
          height: 35,
          width: 35,
          color: Colors.blue,
        ),
        // activeIcon: const Icon(Icons.search),
        //icon: const Icon(Icons.search),
        icon: Image.asset(
          'assets/bar3.png',
          height: 35,
          width: 35,
          color: Colors.grey,
        ),
        title: Flutkart.searchText,
        color: Colors.black,
        vsync: this,
      ),
      NavigationIconView(
        activeIcon: Image.asset(
          'assets/bar41.png',
          height: 35,
          width: 35,
          color: Colors.blue,
        ),
        //icon: const Icon(Icons.more_horiz),
        icon: Image.asset(
          'assets/bar4.png',
          height: 35,
          width: 35,
          color: Colors.grey,
        ),
        title: Flutkart.supportText,
        color: Colors.black,
        vsync: this,
      ),
    ];

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  late List<Color> relatedColors;
  bool loading = false;

  Future<File?> createFileOfPdfUrl(String filenamepdf,
      {bool isFromAsset = true}) async {
    var now = new DateTime.now();

    /* final url = Flutkart.BASE_URL+"PDF/"+filenamepdf.trim()+".pdf";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;*/
    //read and write
    if (isFromAsset) {
      final filename1 = filenamepdf + ".pdf";
      var bytes1 =
          await rootBundle.load("assets/" + filenamepdf.trim() + ".pdf");
      String dir1 = (await getApplicationDocumentsDirectory()).path;
      // writeToFile(bytes,'$dir1/$filename1');
      final buffer = bytes1.buffer;
      return new File('$dir1/$filename1').writeAsBytes(
          buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes));
    } else {
      String basename = p.basename(filenamepdf);
      return downloadFile(filenamepdf, basename);
    }
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 120));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    /* pr = new ProgressDialog(context, ProgressDialogType.Normal);

    pr.setMessage('Please wait...');*/
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();

          if (_currentIndex == 0) {
            toolbarTitle = Flutkart.gasguideText;
          } else if (_currentIndex == 1) {
            toolbarTitle = Flutkart.productsText;
          } else if (_currentIndex == 2) {
            toolbarTitle = Flutkart.chemicalText;
          } else if (_currentIndex == 3) {
            toolbarTitle = Flutkart.searchText;
          } else if (_currentIndex == 4) {
            toolbarTitle = Flutkart.supportText;
          }
        });
      },
      backgroundColor: Color(0xFFEEEFF1),
      unselectedItemColor: Colors.black54,
      selectedItemColor: Colors.blue,
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          toolbarTitle,
          style: TextStyle(color: Color(0xFF000000)),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFFEEEFF1), Color(0xFFEEEFF1)],
            ),
          ),
        ),
      ),
      body: _myListView(context),
      bottomNavigationBar: botNavBar,
    );
  }

  Widget _myListView(BuildContext context) {
    // backing data
    if (_currentIndex == 0) {
      //0 for gas guide
      return ListView.separated(
        itemCount: gasguidelist.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          gasguidelist.sort((a, b) => a.eName.compareTo(b.eName));

          // ignore: unnecessary_statements
          ('Index 0 : ${gasguidelist[index].page}');
          return InkWell(
            onTap: loading
                ? null
                : () {
                    setState(() {
                      loading = true;
                    });
                    createFileOfPdfUrl(gasguidelist[index].page).then((file) {
                      setState(() {
                        pathPDF = file!.path;
                        //    pr.hide();
                        var now = new DateTime.now();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PDFScreen(
                                  pathPDF,
                                  gasguidelist[index].eName,
                                  gasguidelist[index].page)),
                        );
                      });
                    }, onError: (error) {
                      _launchURL(gasguidelist[index].page);
                    });
                    setState(() {
                      loading = false;
                    });
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      gasguidelist[index].eName,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54, // insert your font size here
                          fontWeight: FontWeight.w900),
                    )),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0)
              ],
            ),
          );
          /* return ListTile(
            title: Text(
              gasguidelist[index].eName,
              style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black, // insert your font size here
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: () {


              createFileOfPdfUrl(gasguidelist[index].page).then((file) {
                setState(() {
                  pathPDF = file.path;
                  //    pr.hide();
                  var now = new DateTime.now();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PDFScreen(pathPDF, gasguidelist[index].eName)),
                  );
                });
              });

            },
          );*/
        },
      );
    } else if (_currentIndex == 1) {
      return ListView.separated(
        itemCount: productlist.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          productlist.sort((a, b) => a.title.compareTo(b.title));
          return InkWell(
            onTap: () {
              if (productlist[index].subcategory.length == 0) {
                DataCategory? dc;
                if (productlist[index].data == "CMSChips") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductCMSStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "single") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductSigleGasStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "multi") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductMultiGasStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "calibration") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductcalibratinStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "Micro") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductMicroStr);
                  dc = shortTermlist;
                }

                if (dc != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubSubcategoryScreen(
                              datalist: dc!.data,
                              title: productlist[index].title,
                            )),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubcategoryScreen(
                            product: productlist[index],
                          )),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      productlist[index].title,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54, // insert your font size here
                          fontWeight: FontWeight.w900),
                    )),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0)
              ],
            ),
          );
          /* return ListTile(
            title: Text(
              productlist[index].title,
              style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black, // insert your font size here
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: () {

              if (productlist[index].subcategory.length == 0) {
                DataCategory dc;
                if (productlist[index].data == "CMSChips") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductCMSStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "single") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductSigleGasStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "multi") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductMultiGasStr);
                  dc = shortTermlist;
                } else if (productlist[index].data == "calibration") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonProductcalibratinStr);
                  dc = shortTermlist;
                }

                if (dc != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubSubcategoryScreen(
                              datalist: dc.data,
                              title: productlist[index].title,
                            )),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubcategoryScreen(
                            product: productlist[index],
                          )),
                );
              }
              
            },
          );*/
        },
      );
    } else if (_currentIndex == 2) {
      return ListView.separated(
        itemCount: chemicalList.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          // return Divider();
          return InkWell(
            onTap: () {
              String cat = chemicalList[index].chemicalSlug;
              List<ChemicalCategoriesItem> chemicalCategory = [];
              for (int k = 0; k < chemicalCategoryList.length; k++) {
                List<String> catlist =
                    chemicalCategoryList[k].chemicalCategories;
                for (int j = 0; j < catlist.length; j++) {
                  if (catlist[j] == cat) {
                    chemicalCategory.add(chemicalCategoryList[k]);
                  }
                }
              }

              if (chemicalCategory.length > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoreSubSubcategoryScreen(
                            chemicalCategoryList: chemicalCategory,
                            title: chemicalList[index].chemicalName,
                          )),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      chemicalList[index].chemicalName,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54, // insert your font size here
                          fontWeight: FontWeight.w900),
                    )),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0)
              ],
            ),
          );
          /*return ListTile(
            title: Text(
              chemicalList[index].chemicalName,
              style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black, // insert your font size here
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: () {
              String cat = chemicalList[index].chemicalSlug;
              List<ChemicalCategoriesItem> chemicalCategory = List();
              for (int k = 0; k < chemicalCategoryList.length; k++) {
                List<String> catlist =
                    chemicalCategoryList[k].chemicalCategories;
                for (int j = 0; j < catlist.length; j++) {
                  if (catlist[j] == cat) {
                    chemicalCategory.add(chemicalCategoryList[k]);
                  }
                }
              }

              if (chemicalCategory.length > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MoreSubSubcategoryScreen(
                            chemicalCategoryList: chemicalCategory,
                            title: chemicalList[index].chemicalName,
                          )),
                );
              }
            },
          );*/
        },
      );
    } else if (_currentIndex == 3) {
      // Datum valueText;
      //search tab
      List<Datum> chemicalSearchlist = [];
      DataCategory shortTermlist =
          dataCategoryFromJson(jsonProductShort_TermStr);
      List<Datum> chemicalDatalist = shortTermlist.data;
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductdiffusionStr).data);
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductSimultestStr).data);
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductAerotestStr).data);
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductMilitaryStr).data);
      chemicalDatalist.addAll(dataCategoryFromJson(jsonProductMicroStr).data);
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductSamplingStr).data);
      chemicalDatalist.addAll(dataCategoryFromJson(jsonSensorCatExStr).data);
      chemicalDatalist.addAll(dataCategoryFromJson(jsonSensorElectroStr).data);
      chemicalDatalist.addAll(dataCategoryFromJson(jsonSensorInfraStr).data);
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductSigleGasStr).data);
      chemicalDatalist
          .addAll(dataCategoryFromJson(jsonProductMultiGasStr).data);
      chemicalDatalist.addAll(dataCategoryFromJson(jsonSensorPIDtr).data);
      chemicalDatalist.addAll(dataCategoryFromJson(jsonProductCMSStr).data);

      for (var i = 0; i < chemicalDatalist.length; i++) {
        if (chemicalDatalist[i].eName.toLowerCase().contains(serachText) ||
            chemicalDatalist[i].chem.toLowerCase().contains(serachText) ||
            chemicalDatalist[i].page.toLowerCase().contains(serachText)) {
          chemicalSearchlist.add(chemicalDatalist[i]);
        }
      }

      return ProgressHUD(
        inAsyncCall: loading,
        progressIndicator:
            CircularProgressIndicator(backgroundColor: Colors.blue),
        child: Column(children: [
          Padding(
            //Add padding around textfield
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  serachText = text;
                });
              },
              decoration: InputDecoration(
                //Add th Hint text here.
                hintText: "Search here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
              // wrap in Expanded
              child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: chemicalSearchlist.length,
            padding: const EdgeInsets.all(5.0),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: loading
                    ? null
                    : () async {
                        setState(() {
                          loading = true;
                        });
                        await createFileOfPdfUrl(chemicalSearchlist[index].page,
                                isFromAsset:
                                    chemicalSearchlist[index].urlSts == "0")
                            .then((file) {
                          setState(() {
                            pathPDF = file!.path;
                            //    pr.hide();
                            var now = new DateTime.now();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PDFScreen(
                                      pathPDF,
                                      chemicalSearchlist[index].eName,
                                      chemicalSearchlist[index].page)),
                            );
                          });
                        }, onError: (error) {
                          _launchURL(chemicalSearchlist[index].page);
                        });
                        setState(() {
                          loading = false;
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
                            Text(
                              chemicalSearchlist[index].eName,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black54,
                                  // insert your font size here
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                            Text(
                              "Part No. " +
                                  chemicalSearchlist[index].eNumber.replaceAll(
                                      new RegExp(r"\s+\b|\b\s"), ""),
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Color(0xFF929292),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.grey, size: 18.0)
                  ],
                ),
              );
            },
          ))
        ]),
      );
    } else if (_currentIndex == 4) {
      return ListView.separated(
        itemCount: morelist.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          // return Divider();
          morelist.sort((a, b) => a.title.compareTo(b.title));
          return InkWell(
            onTap: () {
              //  Navigator.pushNamed(context, "/subcat");
              if (morelist[index].subcategory.length == 0) {
                DataCategory? dc;
                if (morelist[index].data == "contact") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonMoreContactStr);
                  dc = shortTermlist;
                } else {
                  _launchURL(morelist[index].havsubcategoty);
                }

                if (dc != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubSubcategoryScreen(
                              datalist: dc!.data,
                              title: morelist[index].title,
                            )),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubcategoryScreen(
                            product: morelist[index],
                          )),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      morelist[index].title,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          color: Colors.black54, // insert your font size here
                          fontWeight: FontWeight.w900),
                    )),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0)
              ],
            ),
          );

          /*return ListTile(
            title: Text(
              morelist[index].title,
              style: TextStyle(
                  fontSize: 14.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.black, // insert your font size here
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: () {
              //  Navigator.pushNamed(context, "/subcat");
              if (morelist[index].subcategory.length == 0) {
                DataCategory dc;
                if (morelist[index].data == "contact") {
                  DataCategory shortTermlist =
                      dataCategoryFromJson(jsonMoreContactStr);
                  dc = shortTermlist;
                } else {
                  _launchURL(morelist[index].havsubcategoty);
                }

                if (dc != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubSubcategoryScreen(
                              datalist: dc.data,
                              title: morelist[index].title,
                            )),
                  );
                }
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubcategoryScreen(
                            product: morelist[index],
                          )),
                );
              }
              
            },
          );*/
        },
      );
    } else {
      return SizedBox.shrink();
    }
  }

  _launchURL(String url) async {
    if (url.contains("http://www.draeger") ||
        url.contains("http://www.youtube.com")) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}

class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  String filename = "";
  final String name;

  PDFScreen(this.pathPDF, this.name, this.filename);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PDFViewerScaffold(
            appBar: AppBar(
              title: Text(name),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Color(0xFFEEEFF1), Color(0xFFEEEFF1)],
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    _launchURL(filename);
                  },
                )
              ],
            ),
            path: pathPDF,
          ),
          /* Positioned(
            child: new FloatingActionButton(
              child: Icon(Icons.camera_alt),
              backgroundColor: Colors.green.shade800,
              onPressed: () => {},
            ),
          ),*/
        ],
      ),
    );
  }

  _launchURL(String url) async {
    final ByteData bytes1 =
        await rootBundle.load("assets/" + url.trim() + ".pdf");

    await Share.files(
      'esys images',
      {
        url.trim() + ".pdf": bytes1.buffer.asUint8List(),
      },
      '*/*',
    );
  }
}

// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.

class NavigationIconView {
  NavigationIconView({
    required Widget icon,
    required Widget activeIcon,
    required String title,
    required Color color,
    required TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          label: title,
          backgroundColor: Colors.black,
        ),
        controller = AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = controller.drive(CurveTween(
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  late Animation<double> _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animation.drive(
          Tween<Offset>(
            begin: const Offset(0.0, 0.02), // Slightly down.
            end: Offset.zero,
          ),
        ),
        child: IconTheme(
          data: IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size! - 8.0,
      height: iconTheme.size! - 8.0,
      color: iconTheme.color,
    );
  }
}

class CustomInactiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size! - 8.0,
      height: iconTheme.size! - 8.0,
      decoration: BoxDecoration(
        border: Border.all(color: iconTheme.color!, width: 2.0),
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Tooltip(
        message: 'Back',
        child: Text('Exit'),
        excludeFromSemantics: true,
      ),
      onPressed: () {
        // The demo is on the root navigator.
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }
}

final Widget trailingButtons = Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    // CupertinoDemoDocumentationButton('/cupertino/navigation'),
    const Padding(padding: EdgeInsets.only(left: 8.0)),
    const ExitButton(),
  ],
);

/*
class AddRemoveListView extends StatefulWidget {
  _AddRemoveListViewState createState() => _AddRemoveListViewState();
}

class _AddRemoveListViewState extends State<AddRemoveListView> {
  TextEditingController _textController = TextEditingController();

  List<String> _listViewData = [
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
    "Swipe Right / Left to remove",
  ];

  _onSubmit() {
    setState(() {
      _listViewData.add(_textController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add & Remove from ListView'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'enter text to add',
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: RaisedButton(
              onPressed: _onSubmit,
              child: Text('Add to List'),
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: _listViewData.reversed.map((data) {
                return Dismissible(
                  key: Key(data),
                  child: ListTile(
                    title: Text(data),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
*/
