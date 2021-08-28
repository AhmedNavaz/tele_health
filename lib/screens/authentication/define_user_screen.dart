import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';

class DefineUserScreen extends StatefulWidget {
  const DefineUserScreen({Key? key}) : super(key: key);

  @override
  _DefineUserScreenState createState() => _DefineUserScreenState();
}

var _selected;

class _DefineUserScreenState extends State<DefineUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Choose Account Type',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _selected == 0 ? blue : Colors.grey.shade400,
                        width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/patient.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text(
                          'Patient',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selected = 0;
                  });
                },
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _selected == 1 ? blue : Colors.grey.shade400,
                        width: 2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/doctor.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text(
                          'Doctor',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selected = 1;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (_selected != null) {
                navigationController.navigateTo('/auth-body');
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text('Continue'),
            ),
            style: ElevatedButton.styleFrom(
              primary: _selected == null ? Colors.grey : blue,
            ),
          )
        ],
      ),
    );
  }
}
