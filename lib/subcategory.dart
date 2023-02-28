import 'package:drager/string_file.dart';
import 'package:drager/subsubcategory.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SubcategoryScreen extends StatefulWidget {
  //final List<Subcategory> subcategorylist;
  final DataList product;

  // In the constructor, require a Todo.
  SubcategoryScreen({Key? key, required this.product}) : super(key: key);

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.title,
          style: TextStyle(color: Color(0xFF000000)),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
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
        itemCount: widget.product.subcategory.length,
        padding: const EdgeInsets.all(8.0),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          // return Divider();
          return InkWell(
            onTap: () {
              DataCategory? dc;

              if (widget.product.subcategory[index].cat == "ShortTerm") {
                DataCategory shortTermlist =
                    dataCategoryFromJson(jsonProductShort_TermStr);
                dc = shortTermlist;
              } else if (widget.product.subcategory[index].cat == "Diffusion") {
                DataCategory diffusionlist =
                    dataCategoryFromJson(jsonProductdiffusionStr);
                dc = diffusionlist;
              } else if (widget.product.subcategory[index].cat == "Simultest") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductSimultestStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Military") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductMilitaryStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Aerotest") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductAerotestStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Micro") {
                DataCategory Slist = dataCategoryFromJson(jsonProductMicroStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Sampling") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductSamplingStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Pumps") {
                DataCategory Slist = dataCategoryFromJson(jsonProductPumpsStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "CatEx") {
                dc = dataCategoryFromJson(jsonSensorCatExStr);
              } else if (widget.product.subcategory[index].cat ==
                  "ElectroChem") {
                dc = dataCategoryFromJson(jsonSensorElectroStr);
              } else if (widget.product.subcategory[index].cat == "Infared") {
                dc = dataCategoryFromJson(jsonSensorInfraStr);
              } else if (widget.product.subcategory[index].cat == "Pid") {
                dc = dataCategoryFromJson(jsonSensorPIDtr);
              } else if (widget.product.subcategory[index].cat == "pac 3500") {
                dc = dataCategoryFromJson(jsonMorePac3500Str);
              } else if (widget.product.subcategory[index].cat == "pac 5500") {
                dc = dataCategoryFromJson(jsonMorePac5500Str);
              } else if (widget.product.subcategory[index].cat == "pac 6000") {
                dc = dataCategoryFromJson(jsonMorePac6000Str);
              } else if (widget.product.subcategory[index].cat == "pac 6500") {
                dc = dataCategoryFromJson(jsonMorePac6500Str);
              } else if (widget.product.subcategory[index].cat == "pac 7000") {
                dc = dataCategoryFromJson(jsonMorePac7000Str);
              } else if (widget.product.subcategory[index].cat == "pac 8000") {
                dc = dataCategoryFromJson(jsonMorePac8000Str);
              } else if (widget.product.subcategory[index].cat == "pac 8500") {
                dc = dataCategoryFromJson(jsonMorePac8500Str);
              } else if (widget.product.subcategory[index].cat == "x-am 2000") {
                dc = dataCategoryFromJson(jsonMoreXam2000Str);
              } else if (widget.product.subcategory[index].cat == "pac 2500") {
                dc = dataCategoryFromJson(jsonMoreXam2500Str);
              } else if (widget.product.subcategory[index].cat == "pac 3500") {
                dc = dataCategoryFromJson(jsonMoreXam3500Str);
              } else if (widget.product.subcategory[index].cat == "pac 8000") {
                dc = dataCategoryFromJson(jsonMoreXam8000Str);
              } else if (widget.product.subcategory[index].cat == "x-am 5000") {
                dc = dataCategoryFromJson(jsonMoreXam5000Str);
              } else if (widget.product.subcategory[index].cat == "x-am 5600") {
                dc = dataCategoryFromJson(jsonMoreXam5600Str);
              } else if (widget.product.subcategory[index].cat == "x-zone") {
                dc = dataCategoryFromJson(jsonMoreXZoneStr);
              } else if (widget.product.subcategory[index].cat ==
                  "x-zone 5500") {
                dc = dataCategoryFromJson(jsonMoreXZone5500Str);
              } else if (widget.product.subcategory[index].cat ==
                  "x-zone 5800") {
                dc = dataCategoryFromJson(jsonMoreXZone5800Str);
              } else if (widget.product.subcategory[index].cat == "x-am 7000") {
                dc = dataCategoryFromJson(jsonMoreXam7000Str);
              } else if (widget.product.subcategory[index].cat == "x-am 3000") {
                dc = dataCategoryFromJson(jsonMoreXam3000Str);
              } else if (widget.product.subcategory[index].cat ==
                  "x-act 5000") {
                dc = dataCategoryFromJson(jsonMoreXAct5000Str);
              } else if (widget.product.subcategory[index].cat ==
                  "x-act 7000") {
                dc = dataCategoryFromJson(jsonMoreXAct7000Str);
              } else if (widget.product.subcategory[index].cat ==
                  "x-pid 9500") {
                dc = dataCategoryFromJson(jsonMoreXPid9500Str);
              }

              if (dc != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubSubcategoryScreen(
                            datalist: dc!.data,
                            title: widget.product.subcategory[index].title,
                          )),
                );
              } else if (widget.product.subcategory[index].cat ==
                  "Sensor Compatibility Chart") {
                //Sensor Compatibility Chart
                createFileOfPdfUrl(widget.product.subcategory[index].cat)
                    .then((file) {
                  setState(() {
                    //  pathPDF = file.path;
                    //   pr.hide();
                    var now = new DateTime.now();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFScreen(
                              file.path,
                              widget.product.subcategory[index].cat,
                              widget.product.subcategory[index].cat)),
                    );
                  });
                });
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      widget.product.subcategory[index].title,
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
              widget.product.subcategory[index].title,
              style: TextStyle(
                  fontSize: 14.0,fontStyle: FontStyle.normal,
                  color: Colors.black,// insert your font size here
                  fontWeight: FontWeight.bold
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
            onTap: ()
            {
              DataCategory dc;
              if (widget.product.subcategory[index].cat == "ShortTerm") {
                DataCategory shortTermlist =
                    dataCategoryFromJson(jsonProductShort_TermStr);
                dc = shortTermlist;
              } else if (widget.product.subcategory[index].cat == "Diffusion") {
                DataCategory diffusionlist =
                    dataCategoryFromJson(jsonProductdiffusionStr);
                dc = diffusionlist;
              } else if (widget.product.subcategory[index].cat == "Simultest") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductSimultestStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Military") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductMilitaryStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Aerotest") {
                DataCategory Slist =
                    dataCategoryFromJson(jsonProductAerotestStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "Pumps") {
                DataCategory Slist = dataCategoryFromJson(jsonProductPumpsStr);
                dc = Slist;
              } else if (widget.product.subcategory[index].cat == "CatEx") {
                dc = dataCategoryFromJson(jsonSensorCatExStr);

              } else if (widget.product.subcategory[index].cat == "ElectroChem") {
                dc = dataCategoryFromJson(jsonSensorElectroStr);

              } else if (widget.product.subcategory[index].cat == "Infared") {
                dc = dataCategoryFromJson(jsonSensorInfraStr);

              } else if (widget.product.subcategory[index].cat == "Pid") {
                dc = dataCategoryFromJson(jsonSensorPIDtr);

              }else if (widget.product.subcategory[index].cat == "pac 3500") {
                dc = dataCategoryFromJson(jsonMorePac3500Str);

              }else if (widget.product.subcategory[index].cat == "pac 5500") {
                dc = dataCategoryFromJson(jsonMorePac5500Str);

              }else if (widget.product.subcategory[index].cat == "pac 7000") {
                dc = dataCategoryFromJson(jsonMorePac7000Str);

              }else if (widget.product.subcategory[index].cat == "x-am 2000") {
                dc = dataCategoryFromJson(jsonMoreXam2000Str);

              }else if (widget.product.subcategory[index].cat == "pac 2500") {
                dc = dataCategoryFromJson(jsonMoreXam2500Str);

              }else if (widget.product.subcategory[index].cat == "x-am 5000") {
                dc = dataCategoryFromJson(jsonMoreXam5000Str);

              }else if (widget.product.subcategory[index].cat == "x-am 5600") {
                dc = dataCategoryFromJson(jsonMoreXam5600Str);

              }else if (widget.product.subcategory[index].cat == "x-zone") {
                dc = dataCategoryFromJson(jsonMoreXZoneStr);

              }else if (widget.product.subcategory[index].cat == "x-am 7000") {
                dc = dataCategoryFromJson(jsonMoreXam7000Str);

              }else if (widget.product.subcategory[index].cat == "x-am 3000") {
                dc = dataCategoryFromJson(jsonMoreXam3000Str);

              }else if (widget.product.subcategory[index].cat == "x-act 5000") {
                dc = dataCategoryFromJson(jsonMoreXAct5000Str);

              }

              if (dc != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubSubcategoryScreen(
                            datalist: dc.data,
                            title: widget.product.subcategory[index].title,
                          )),
                );
              }else if(widget.product.subcategory[index].cat == "Sensor Compatibility Chart"){//Sensor Compatibility Chart
                createFileOfPdfUrl(widget.product.subcategory[index].cat).then((file) {
                  setState(() {
                  //  pathPDF = file.path;
                    //   pr.hide();
                    var now = new DateTime.now();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFScreen(file.path,widget.product.subcategory[index].cat)),
                    );
                  });
                });
              }
            },
          );*/
        },
      ),
    );
  }
}
