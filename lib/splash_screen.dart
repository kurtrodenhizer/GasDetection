import 'dart:async';
import 'dart:io';
import 'package:drager/string_file.dart';
import 'package:drager/termofuse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => MyApp(),
  "/termofuse": (BuildContext context) => TCScreen(),
};

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<String> createFileOfJSONTXTUrl(String filenameTXT) async {
    var now = new DateTime.now();

    /*  final url = Flutkart.BASE_URL+"JSON/"+filenameTXT.trim()+".txt";
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    String contents = await file.readAsString();
    return contents;*/
    final filename1 = filenameTXT;
    var bytes1 = await rootBundle.load("assets/" + filenameTXT.trim() + ".txt");
    String dir1 = (await getApplicationDocumentsDirectory()).path;
    // writeToFile(bytes,'$dir1/$filename1');
    final buffer = bytes1.buffer;
    //return new File('$dir1/$filename1').writeAsBytes(buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes));
    File file = new File('$dir1/$filename1');
    await file.writeAsBytes(
        buffer.asUint8List(bytes1.offsetInBytes, bytes1.lengthInBytes));
    String contents = await file.readAsString();
    return contents;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    createFileOfJSONTXTUrl("gasguide_drager").then((file) {
      setState(() {
        Flutkart.gasguideFileText = file;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("products").then((str) {
      setState(() {
        jsonProductStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("more").then((str) {
      setState(() {
        jsonMoreStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-short-term").then((str) {
      setState(() {
        jsonProductShort_TermStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-diffusion").then((str) {
      setState(() {
        jsonProductdiffusionStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-simultest").then((str) {
      setState(() {
        jsonProductSimultestStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-military").then((str) {
      setState(() {
        jsonProductMilitaryStr = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-aerotest").then((str) {
      setState(() {
        jsonProductAerotestStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-micro").then((str) {
      setState(() {
        jsonProductMicroStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-sampling").then((str) {
      setState(() {
        jsonProductSamplingStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pumps").then((str) {
      setState(() {
        jsonProductPumpsStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-cms-chips").then((str) {
      setState(() {
        jsonProductCMSStr = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-single-gas").then((str) {
      setState(() {
        jsonProductSigleGasStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-multi-gas").then((str) {
      setState(() {
        jsonProductMultiGasStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-calibration").then((str) {
      setState(() {
        jsonProductcalibratinStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-contact").then((str) {
      setState(() {
        jsonMoreContactStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data_catex_sensors").then((str) {
      setState(() {
        jsonSensorCatExStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data_electrochemical_sensors").then((str) {
      setState(() {
        jsonSensorElectroStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data_infared_sensors").then((str) {
      setState(() {
        jsonSensorInfraStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data_pid_sensors").then((str) {
      setState(() {
        jsonSensorPIDtr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 3500_videos").then((str) {
      setState(() {
        jsonMorePac3500VStr = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 3500").then((str) {
      setState(() {
        jsonMorePac3500Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 5500").then((str) {
      setState(() {
        jsonMorePac5500Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 5500_videos").then((str) {
      setState(() {
        jsonMorePac5500VStr = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 6000").then((str) {
      setState(() {
        jsonMorePac6000Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 6000_videos").then((str) {
      setState(() {
        jsonMorePac6000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 6500").then((str) {
      setState(() {
        jsonMorePac6500Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 6500_videos").then((str) {
      setState(() {
        jsonMorePac6500VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 8000").then((str) {
      setState(() {
        jsonMorePac8000Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 8000_videos").then((str) {
      setState(() {
        jsonMorePac8000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 8500").then((str) {
      setState(() {
        jsonMorePac8500Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 8500_videos").then((str) {
      setState(() {
        jsonMorePac8500VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 7000").then((str) {
      setState(() {
        jsonMorePac7000Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 7000_videos").then((str) {
      setState(() {
        jsonMorePac7000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 2000").then((str) {
      setState(() {
        jsonMoreXam2000Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-x-am 2000_videos").then((str) {
      setState(() {
        jsonMoreXam2000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 3500").then((str) {
      setState(() {
        jsonMoreXam3500Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-x-am 3500_videos").then((str) {
      setState(() {
        jsonMoreXam3500VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 8000").then((str) {
      setState(() {
        jsonMoreXam8000Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-pid 9500").then((str) {
      setState(() {
        jsonMoreXPid9500Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 8000_videos").then((str) {
      setState(() {
        jsonMoreXam8000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-pac 2500").then((str) {
      setState(() {
        jsonMoreXam2500Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-pac 2500_videos").then((str) {
      setState(() {
        jsonMoreXam2500VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 3000").then((str) {
      setState(() {
        jsonMoreXam3000Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 5000").then((str) {
      setState(() {
        jsonMoreXam5000Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 5000_videos").then((str) {
      setState(() {
        jsonMoreXam5000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 5600").then((str) {
      setState(() {
        jsonMoreXam5600Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-am 5600_videos").then((str) {
      setState(() {
        jsonMoreXam5600VStr = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-x-am 7000").then((str) {
      setState(() {
        jsonMoreXam7000Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-zone").then((str) {
      setState(() {
        jsonMoreXZoneStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-zone_videos").then((str) {
      setState(() {
        jsonMoreXZoneVStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-zone 5500").then((str) {
      setState(() {
        jsonMoreXZone5500Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-zone 5500_videos").then((str) {
      setState(() {
        jsonMoreXZone5500VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-zone 5800").then((str) {
      setState(() {
        jsonMoreXZone5800Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-act 5000").then((str) {
      setState(() {
        jsonMoreXAct5000Str = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("data-x-act 7000").then((str) {
      setState(() {
        jsonMoreXAct7000Str = str;
        var now = new DateTime.now();
      });
    });
    createFileOfJSONTXTUrl("data-x-act 5000_videos").then((str) {
      setState(() {
        jsonMoreXAct5000VStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("chemical_list").then((str) {
      setState(() {
        jsonChemicalStr = str;
        var now = new DateTime.now();
      });
    });

    createFileOfJSONTXTUrl("chemical_subcategory_list").then((str) {
      setState(() {
        jsonChemicalSubStr = str;
        var now = new DateTime.now();
      });
    });
    bool isTCAccepted = false;
    _getTcAccepted().then((isTCAccepted1) {
      isTCAccepted = isTCAccepted1;

      if (isTCAccepted != null && isTCAccepted) {
        Timer(Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, "/termofuse"));
      } else {
        Timer(Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, "/termofuse"));
      }
    });
  }

  Future<bool> _getTcAccepted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // int counter = (prefs.getInt('counter') ?? 0) + 1;
    return prefs.getBool("accepTC") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // To make this screen full screen.
    // It will hide status bar and notch.
    //  SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        body: Container(
//      decoration: BoxDecoration(
//        image: DecorationImage(
//            image: AssetImage('assets/bg_main.png'), fit: BoxFit.cover),
//      ),
            ));
    /* ,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
        ),
      ),
    );*/
  }
}
