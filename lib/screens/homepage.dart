import 'package:clock_app/screens/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var formatedTime = DateFormat("HH:mm").format(now);
    var formatedDate = DateFormat("EEE, d MMM").format(now);
    var timezoneString = now.timeZoneOffset.toString().split(".").first;
    var offSetSign = "";
    if (!timezoneString.startsWith('-')) {
      offSetSign = '+';
      print(timezoneString);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){}, child: Column(
                children: [
                  FlutterLogo(),
                  Text("Clock", style: TextStyle(color: Colors.white, fontSize: 14.0),),
                  
                ],
              ),
              )
            ],
          ),
          VerticalDivider(color: Colors.white54, width: 1,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatedTime,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    formatedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  ),
                  const Text(
                    "Clock",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const ClockView(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    "Timezone",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "UTC$offSetSign$timezoneString",
                        style: const TextStyle(color: Colors.white, fontSize: 24),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
