import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// profile page

class SellPageOffice extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SellPageOfficeState();
  }
}

class _SellPageOfficeState extends State<SellPageOffice>{

  int _valueAptOff = 0;
  bool rememberMe = false;

  final String url = 'http://10.0.2.2:9998/api/User/SaveUser';
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
            child: Column(
              //scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.fromLTRB(16, 16 , 16, 0),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: new Text("Company Name : "),
                  ),
                ),

                Stepper(
                  type: StepperType.vertical,
                  steps: _mySteps(),
                  currentStep: this._currentStep,
                  onStepTapped: (step){
                    setState(() {
                      this._currentStep = step;
                    });
                  },
                  onStepContinue: (){
                    setState(() {
                      if(this._currentStep < this._mySteps().length - 1){
                        this._currentStep = this._currentStep + 1;
                        if(this._currentStep == 0)
                        {

                        }
                        if(this._currentStep == 1)
                        {
                          debugPrint('second continue');
                          debugPrint(_valueAptOff.toString());
                        }
                      }
                      else{
                        //registration(FirstName,LastName,PhoneNumber,eMail,DOB,iPrimaryUsage,iAdditionalPhone,password,iParentUserID,FlatBlock,Address,Landmark,City,Pincode,State, Country,iAddressType,iLongitude,iLattitude,IsVerified);
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if(this._currentStep > 0){
                        this._currentStep = this._currentStep - 1;
                      }else{
                        this._currentStep = 0;
                      }
                    });
                  },
                ),

              ],)

        );
  }
  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
          title: const Text('Dish'),
          isActive: _currentStep >= 0,
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Dish Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dish Description'),
              ),

            ],
          )
      ),
      Step(
        isActive: _currentStep >= 1,
        title: const Text('Quantity, Price & Time'),
        content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity', hintText: "Number of plates you want to sell"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price Per Plate'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Final Order By'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preparation Time'),
              ),
            ]
        ),
      ),
      Step(
        isActive: _currentStep >= 2 ,
        title: const Text('Confirm Selling'),
        content: Column(
          children: <Widget>[

          ],
        ),
      ),
    ];
    return _steps;
  }
}