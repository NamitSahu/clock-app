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
              buildMenuButton('Clock', 'assets/clock_icon.png'),
              buildMenuButton('Alarm,', 'assets/alarm_icon.png'),
              buildMenuButton('Timer,', 'assets/timer_icon.png'),
              buildMenuButton('Stopwatch,', 'assets/stopwatch_icon.png'),
            ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Clock",
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Text(
                          formatedTime,
                          style: const TextStyle(
                              fontFamily: 'avenir',
                              color: Colors.white,
                              fontSize: 64),
                        ),
                        Text(
                          formatedDate,
                          style: const TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Align(
                        alignment: Alignment.center,
                        child: ClockView(
                          size: MediaQuery.of(context).size.height / 4,
                        ),
                      )),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Timezone",
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 24),
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
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMenuButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image,
              scale: 1.5,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'avenir', color: Colors.white, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
