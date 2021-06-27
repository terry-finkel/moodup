import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetInfo extends StatefulWidget {
  @override
  GetInfoView createState() {
    return GetInfoView();
  }
}

class GetInfoView extends State<GetInfo> with SingleTickerProviderStateMixin {
  final List<bool> _isSelected = [true, false];
  int _age = 0;
  int _weight = 0;

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
            ListTile(
              leading: Text('Âge'),
              title: Text(_age > 0 ? '$_age' : '...'),
              onTap: () {
                showAgePicker(context);
              },
            ),
            ListTile(
              leading: Text('Poids'),
              title: Text(_weight > 0 ? '$_weight' : '...'),
              onTap: () {
                showWeightPicker(context);
              },
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
                  Navigator.pushNamed(context, '/sensor');
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

  showAgePicker(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 1, end: 99),
        ]),
        hideHeader: true,
        title: Text("Indiquez votre âge"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          _setAge(picker.getSelectedValues()[0] as int);
        }
    ).showDialog(context);
  }

  showWeightPicker(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 30, end: 300),
        ]),
        hideHeader: true,
        title: Text("Indiquez votre poids"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          _setWeight(picker.getSelectedValues()[0] as int);
        }
    ).showDialog(context);
  }
}
