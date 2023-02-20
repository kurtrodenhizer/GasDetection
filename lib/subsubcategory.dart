import 'dart:developer';
import 'dart:io';
import 'package:drager/progress_hud.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';
import 'package:drager/string_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class SubSubcategoryScreen extends StatefulWidget {
  List<Datum> datalist;
  String title;

  // In the constructor, require a Todo.
  SubSubcategoryScreen({Key? key, required this.datalist, required this.title})
      : super(key: key);

  @override
  _SubSubcategoryScreenState createState() => _SubSubcategoryScreenState();
}

class _SubSubcategoryScreenState extends State<SubSubcategoryScreen> {
  // ProgressDialog pr;
  String pathPDF = "";
  bool loading = false;

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
      body: ProgressHUD(
        inAsyncCall: loading,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
        child: ListView.separated(
          itemCount: widget.datalist.length,
          padding: const EdgeInsets.all(8.0),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemBuilder: (context, index) {
            // return Divider();
            return InkWell(
              onTap: loading
                  ? null
                  : () async {
                      /*  if(!pr.isShowing()){
                  pr.show();
                }*/

                      if (widget.datalist[index].eName == "How-to Videos") {
                        DataCategory? dc;
                        if (widget.title == "Pac 3500") {
                          dc = dataCategoryFromJson(jsonMorePac3500VStr);
                        } else if (widget.title == "Pac 5500") {
                          dc = dataCategoryFromJson(jsonMorePac5500VStr);
                        } else if (widget.title == "Pac 6000") {
                          dc = dataCategoryFromJson(jsonMorePac6000VStr);
                        } else if (widget.title == "Pac 6500") {
                          dc = dataCategoryFromJson(jsonMorePac6500VStr);
                        } else if (widget.title == "Pac 7000") {
                          dc = dataCategoryFromJson(jsonMorePac7000VStr);
                        } else if (widget.title == "Pac 8000") {
                          dc = dataCategoryFromJson(jsonMorePac8000VStr);
                        } else if (widget.title == "Pac 8500") {
                          dc = dataCategoryFromJson(jsonMorePac8500VStr);
                        } else if (widget.title == "X-am 2000 (Discontinued)") {
                          dc = dataCategoryFromJson(jsonMoreXam2000VStr);
                        } else if (widget.title == "X-am 2500") {
                          dc = dataCategoryFromJson(jsonMoreXam2500VStr);
                        } else if (widget.title == "X-am 3500") {
                          dc = dataCategoryFromJson(jsonMoreXam3500VStr);
                        } else if (widget.title == "X-am 8000") {
                          dc = dataCategoryFromJson(jsonMoreXam8000VStr);
                        } else if (widget.title == "X-am 5000") {
                          dc = dataCategoryFromJson(jsonMoreXam5000VStr);
                        } else if (widget.title == "X-am 5600") {
                          dc = dataCategoryFromJson(jsonMoreXam5600VStr);
                        } else if (widget.title == "X-zone") {
                          dc = dataCategoryFromJson(jsonMoreXZoneVStr);
                        } else if (widget.title == "X-zone 5500") {
                          dc = dataCategoryFromJson(jsonMoreXZone5500VStr);
                        } else if (widget.title == "X-act 5000") {
                          dc = dataCategoryFromJson(jsonMoreXAct5000VStr);
                        }
                        if (dc != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubSubcategoryScreen(
                                      datalist: dc!.data,
                                      title: "How-to Videos",
                                    )),
                          );
                        }
                      } else {
                        setState(() {
                          loading = true;
                        });
                        if (widget.datalist[index].urlSts == "1") {
                          String basename =
                              p.basename(widget.datalist[index].page);
                          await downloadFile(
                                  widget.datalist[index].page, basename)
                              .then((file) {
                            if (file != null) {
                              setState(() {
                                pathPDF = file.path;
                                //   pr.hide();
                                var now = new DateTime.now();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDFScreen(
                                          pathPDF,
                                          widget.datalist[index].eName,
                                          widget.datalist[index].page)),
                                );
                              });
                            }
                          }, onError: (error) {
                            _launchURL(widget.datalist[index].page);
                          });
                        } else {
                          await createFileOfPdfUrl(widget.datalist[index].page)
                              .then((file) {
                            setState(() {
                              pathPDF = file.path;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PDFScreen(
                                        pathPDF,
                                        widget.datalist[index].eName,
                                        widget.datalist[index].page)),
                              );
                            });
                          }, onError: (error) {
                            _launchURL(widget.datalist[index].page);
                          });
                        }
                        setState(() {
                          loading = false;
                        });
                      }
                    },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.datalist[index].eName,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal,
                                  color: Colors
                                      .black54, // insert your font size here
                                  fontWeight: FontWeight.w900)),
                          vieww(context, widget.datalist[index]),
                        ],
                      )),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0)
                ],
              ),
            );

            /* return ListTile(
              title: Text(
                widget.datalist[index].eName,
                style: TextStyle(
                    fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                    color: Colors.black, // insert your font size here
                    fontWeight: FontWeight.bold),
              ),
              subtitle: vieww(context, widget.datalist[index]),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
              onTap: () {
                */ /*  if(!pr.isShowing()){
                  pr.show();
                }*/ /*

                if (widget.datalist[index].eName == "How-to Videos") {
                  DataCategory dc;
                  if (widget.title == "Pac 3500") {
                    dc = dataCategoryFromJson(jsonMorePac3500VStr);
                  } else if (widget.title == "Pac 5500") {
                    dc = dataCategoryFromJson(jsonMorePac5500VStr);
                  } else if (widget.title == "Pac 7000") {
                    dc = dataCategoryFromJson(jsonMorePac7000VStr);
                  } else if (widget.title == "X-am 2000 (Discontinued)") {
                    dc = dataCategoryFromJson(jsonMoreXam2000VStr);
                  } else if (widget.title == "X-am 2500") {
                    dc = dataCategoryFromJson(jsonMoreXam2500VStr);
                  } else if (widget.title == "X-am 5000") {
                    dc = dataCategoryFromJson(jsonMoreXam5000VStr);
                  } else if (widget.title == "X-am 5600") {
                    dc = dataCategoryFromJson(jsonMoreXam5600VStr);
                  } else if (widget.title == "X-zone") {
                    dc = dataCategoryFromJson(jsonMoreXZoneVStr);
                  } else if (widget.title == "X-act 5000") {
                    dc = dataCategoryFromJson(jsonMoreXAct5000VStr);
                  }
                  if (dc != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubSubcategoryScreen(
                                datalist: dc.data,
                                title: "How-to Videos",
                              )),
                    );
                  }
                } else {
                  createFileOfPdfUrl(widget.datalist[index].page).then((file) {
                    setState(() {
                      pathPDF = file.path;
                      //   pr.hide();
                      var now = new DateTime.now();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFScreen(pathPDF, widget.datalist[index].eName)),
                      );
                    });
                  }, onError: (error) {
                    _launchURL(widget.datalist[index].page);
                  });
                }
              },
            );*/
          },
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (url.contains("http://www.draeger") ||
        url.contains("http://www.youtube.com") ||
        url.contains("https://youtu.be") ||
        url.contains("https://www.draeger.com") ||
        url.contains("https://www.youtube.com")) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (url.length > 10) {
      await launch("tel:" + url);
    }
  }

  Widget vieww(BuildContext context, Datum dd) {
    String textt = dd.eNumber;
    double sizee = 0.0;
    if (textt != "") {
      textt = "Part No. " + textt.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
      sizee = 13.0;
    }
    if (widget.title == "Contact Information") {
      textt = dd.page;
      sizee = 13.0;
      if (dd.page.contains("http://www.draeger")) {
        textt = "";
        // return null;
      }
    }

    return Text(
      textt,
      style: TextStyle(
          fontSize: sizee,
          color: Color(0xFF929292),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
    );
  }
}

Future<File> createFileOfPdfUrl(String filenamepdf) async {
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
  final filename1 = filenamepdf + ".pdf";
  var bytes1 = await rootBundle.load("assets/" + filenamepdf.trim() + ".pdf");
  String dir1 = (await getApplicationDocumentsDirectory()).path;
  // writeToFile(bytes,'$dir1/$filename1');
  final buffer = bytes1.buffer;
  return new File('$dir1/$filename1').writeAsBytes(
      buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes));
}

Future<File?> downloadFile(String url, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final file = File('${appStorage.path}/$name');

  try {
    Dio? dio;
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: "your base url",
        receiveDataWhenStatusError: true,
        connectTimeout: 120,
        receiveTimeout: 120,
      );

      dio = new Dio(options);
    }

    final response = await dio.get(url,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 120));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  } catch (e) {
    log(e.toString());
    return null;
  }
}
