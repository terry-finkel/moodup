import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInfo extends StatefulWidget {
  @override
  GetInfoView createState() {
    return GetInfoView();
  }
}

class GetInfoView extends State<GetInfo> with SingleTickerProviderStateMixin {
  final List<bool> _isSelected = [true, false];
  int _age = 1;
  int _weight = 30;

  void _setAge(int age) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('age', age);

    setState(() {
      _age = age;
    });
  }

  void _setGender(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('gender', index == 0 ? 'M' : 'F');

    setState(() {
      _isSelected[index] = true;
      _isSelected[1 - index] = false;
    });
  }

  void _setWeight(int weight) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('weight', weight);

    setState(() {
      _weight = weight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Up!"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Merci de renseigner les informations suivantes:"),
            Row(
              children: [
                Text("Âge: "),
                NumberPicker(
                  value: _age,
                  minValue: 1,
                  maxValue: 99,
                  haptics: true,
                  axis: Axis.horizontal,
                  itemWidth: 50,
                  onChanged: (value) => {
                    _setAge(value)
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                Text("Poids: "),
                NumberPicker(
                  value: _weight,
                  minValue: 30,
                  maxValue: 300,
                  haptics: true,
                  axis: Axis.horizontal,
                  itemWidth: 50,
                  onChanged: (value) => {
                    _setWeight(value)
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            ToggleButtons(
              children: <Widget>[
                Text('M'),
                Text('F'),
              ],
              isSelected: _isSelected,
              onPressed: (int index) {
                _setGender(index);
              },
            ),
            (_age > 0 && _weight > 0) ? ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/evaluate', arguments: {
                  "bpm": -1.0,
                  "stress": -1.0
                });
              },
              child: Icon(
                  Icons.navigate_next_rounded
              ),
            ) : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
