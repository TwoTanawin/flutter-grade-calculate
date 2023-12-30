import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _inputController = TextEditingController();
  TextEditingController _outputController = TextEditingController();

  String getGrade(int score) {
    if (score >= 80 && score <= 100) {
      return 'A';
    } else if (score >= 60 && score <= 79) {
      return 'B';
    } else if (score >= 50 && score <= 59) {
      return 'C';
    } else if (score >= 0 && score <= 49) {
      return 'F';
    } else {
      return 'Invalid score';
    }
  }

  void _submitText() {
    setState(() {
      // Append the new text to the existing text
      // _outputController.text += '\n${_inputController.text}';
      // Split the input string by commas
      List<String> values = _inputController.text.split(',');
      int inx = 0;
      // _outputTextSpans.clear();
      for (String value in values) {
        inx++;
        // _outputController.text += '\n${inx},${value}';
        String grade = getGrade(int.parse(value));
        _outputController.text += '\n ${inx} student grade : ${grade}';
      }
    });
  }

  void _clearText() {
    setState(() {
      _inputController.clear();
      _outputController.clear();
    });
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _inputController,
          decoration: InputDecoration(labelText: 'Input Text'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _submitText,
          child: Text('Submit'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _clearText,
          child: Text('Clear'),
        ),
      ],
    );
  }

  Widget _buildOutputSection() {
    return Container(
      width: 300.0,
      height: 200.0,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          RichText(
            text: TextSpan(
              text: _outputController.text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rich Text Box App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildOutputSection(),
            SizedBox(height: 16),
            _buildInputSection(),
          ],
        ),
      ),
    );
  }
}
