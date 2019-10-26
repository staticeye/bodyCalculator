import 'package:flutter/material.dart';

class BMICalculator extends  StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMICalculator>{
  double _calculation;
  String _calcResults;
  String _results = "";

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void _calculateBMI(){
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (height != null && weight != null){
      setState(() {
        height = height * 12;
        _calculation = (weight / (height*height)) * 703;
        _calcResults = _calculation.toStringAsFixed(2);

        if (_calculation < 18.5){
            _results = "You are Under Weight";
        }else if (_calculation >= 18.5 && _calculation <= 24.9){
            _results = "Wow, Good Fit";
        }else if (_calculation >= 25.0 && _calculation <= 29.9){
            _results = "Obse, You are Overweight";
        }else{
            _results = "Is this really? Your weight is too much";
        }
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        title: Text("Body Calculator"),
      ),
      body: ListView(
        
        padding: const EdgeInsets.all(3.5),
        children: <Widget>[
          Image.asset("assets/images/AppIcon.png",
          height: 120.0,
          width: 150.0),

          Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _ageFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Age",
                    icon: Icon(Icons.event,
                    color: Colors.teal,)
                  ),
                ),
                TextField(
                  controller: _heightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Height in Feet",
                    icon: Icon(Icons.arrow_upward,
                    color: Colors.teal,)
                  ),
                ),
                TextField(
                  controller: _weightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Weight in Pounds",
                    icon: Icon(Icons.get_app,
                    color: Colors.teal,)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.5),
                ),
                FlatButton(
                  onPressed: _calculateBMI,
                  child: new Text(
                    "Calculate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      letterSpacing: 2.0
                    ),
                  ),
                  color: Colors.teal[300],
                  textColor: Colors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_calcResults != null ? "$_calcResults" : "",
                style: new TextStyle(
                  color: Colors.teal,
                  fontSize: 44.5,
                  fontWeight: FontWeight.w800,

                ),
                ),

                Text(_results != null ? _results : "",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),)


                
              ],
            ),
          )

        ],
      ),
    );
  }

}