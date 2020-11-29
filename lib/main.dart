import 'package:flutter/material.dart';




void main () {

  runApp(new MaterialApp(
      title: 'Tip Calculator',
      home: new TipCalculator()


  ));
}


class TipCalculator extends StatelessWidget {

  double billAmount = 0.0;
  double tipPercentage = 0.0;





  @override
  Widget build (BuildContext context) {



    TextField billAmountField = new TextField(
        decoration: InputDecoration (
          labelText: "Bill amount(\$)"
        ),

      keyboardType: TextInputType.number,
      onChanged: (text) {
        try {

          billAmount = double.parse(text);
        } catch (exception) {
          billAmount = 0.0;
        }

      }


    );




    TextField tipPercentageField = new TextField(
        decoration: InputDecoration (
        labelText: "Tip %",
        hintText: "15"
        ),
        keyboardType: TextInputType.number,
        onChanged: (text) {

          try {
            tipPercentage = double.parse(text);
          } catch (exception) {

            tipPercentage = 0.0;
          }
      }
      
    );
    
    RaisedButton calculateButton = new RaisedButton(
        child : new Text("Calculate"),
        onPressed: () {
          double calculatedTip = billAmount * tipPercentage / 100.0;
          double total = billAmount + calculatedTip;

          AlertDialog dialog = new AlertDialog(

            content: new Text ("Tip: \$$calculatedTip \n"
                    "Total: \$$total")
          );

          showDialog(context: context, child: dialog);

        } //on pressed event handler

    );


    Container container = new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: [billAmountField, tipPercentageField, calculateButton]

      )

    );

    AppBar appBar = new AppBar(title: new Text ("Tip Calculator"));

    Scaffold scaffold = new Scaffold (appBar: appBar,
        body: container);

    return scaffold;



  } // end build method

} // end class