import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/model/common.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';


// profile page

class SellPageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SellPageHomeState();
  }
}

class _SellPageHomeState extends State<SellPageHome> {

  //Controllers
  final TextEditingController dishNameController = new TextEditingController();
  final TextEditingController dishDescController = new TextEditingController();
  final TextEditingController quantityController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();

  String dishName = "";
  String dishDesc = "";
  int quantity = 0;
  int price = 0;
  int finalOrderBy = 0;
  int prepTime = 0;
  int startTime = 0;
  int endTime = 0;

  String sellStartTimeHolder = 'Sell Start Time';
  String sellEndTimeHolder = 'Sell End Time';
  String prepTimeHolder = 'Prep Time';
  String finalOrderByTimeHolder = 'Final Order By';


  int _valueAptOff = 0;
  bool rememberMe = false;
  final sellURL = "http://10.0.2.2:9998/api/Dish/SaveUserDish";
  int _currentStep = 0;

  //---------------Start of image picker
  File _selectedFile;
  bool _inProcess = false;


  Widget getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
          _selectedFile,
          width: 150,
          height: 150,
          fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        "images/addimage.png",
        width: 150,
        height: 150,
        fit: BoxFit.fill,
      );
    }
  }

  getImage(ImageSource source) async {
    this.setState((){
      _inProcess = true;
    });
    File image = (await ImagePicker.pickImage(source: source));
    if(image != null){
      File cropped = (await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.greenAccent,
            toolbarTitle: "Cropper",
            statusBarColor: Colors.green.shade900,
            backgroundColor: Colors.white,
          )
      ));

      this.setState((){
        _selectedFile = cropped;
        _inProcess = false;
      });
    } else {
      this.setState((){
        _inProcess = false;
      });
    }
  }
  //--------------End of Image Picker

  //sell function

  Future sellItem(int UserId, String UserDishDescription, int LinkedDish, int Quantity,
      int Price, int OrderByTime,int SellStartTime, int SellEndTime,int Recurring,
      int CanBeDelivered, String UserImagePath, int AddressId, int IsActive, int DishId,
      String DishName, String DishCategory, String DishDescription, String DishLocality,
      String DefaultImagePath) async {
    Map map = {
      "UserId": UserId.toString(),
      "UserDishDescription":UserDishDescription,
      "LinkedDish":LinkedDish.toString(),
      "Quantity":Quantity.toString(),
      "Price":Price.toString(),
      "OrderByTime":OrderByTime.toString(),
      "SellStartTime":SellStartTime.toString(),
      "SellEndTime":SellEndTime.toString(),
      "Recurring":Recurring.toString(),
      "CanBeDelivered":CanBeDelivered.toString(),
      "UserImagePath":UserImagePath,
      "AddressId":AddressId.toString(),
      "IsActive":IsActive.toString(),
      "DishId":DishId.toString(),
      "DishName":DishName,
      "DishCategory":DishCategory,
      "DishDescription":DishDescription,
      "DishLocality":DishLocality,
      "DefaultImagePath":DefaultImagePath,
    };

    debugPrint("SellCall");

    var response = await http.post(sellURL, body: map);
    int statusCode = response.statusCode;
    debugPrint(statusCode.toString());

  }

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
                child: new Text("Location : "),
              ),
            ),
            Stack(
              children: <Widget>[
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
                        if(this._currentStep == 1)
                        {
                          debugPrint("First click on continue");
                          dishName = dishNameController.text;
                          dishDesc = dishDescController.text;
                          //photo
                          //send photo to s3, get URL and save to string
                          //validation here

                        }
                        if(this._currentStep == 2)
                        {
                          debugPrint("Second click on continue");
                          quantity = int.parse(quantityController.text);
                          price = int.parse(priceController.text);

                          //validation here

                        }
                      }
                      else{
                        debugPrint('Final Continue');
                        sellItem(1,dishDesc, 123,quantity, price, finalOrderBy, startTime, endTime, 1,1,"Aloo gobi.jpg", 2, 1 ,3 , dishName,"Vegetarian",dishDesc,"North India","Aloo gobi.jpg" );

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
                (_inProcess)?Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ):Center(),
              ],
            )


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
                autofocus: true,
                controller: dishNameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Dish Description'),
                controller: dishDescController,
              ),
              new Padding(padding: EdgeInsets.all(10)),
              new Text(
                "Select Dish Photo",
                textAlign : TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              new Container(
                child: getImageWidget(),
                height: 110,
                width: 110,
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),side: BorderSide(color: Colors.greenAccent)),
                      child: new Text('Camera'),
                      onPressed: (){ getImage(ImageSource.camera);}
                  ),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),side: BorderSide(color: Colors.greenAccent)),
                      child: new Text('Gallery'),
                      onPressed: (){ getImage(ImageSource.gallery); }
                  ),
                ],
              )
            ],
          )
      ),
      Step(
        isActive: _currentStep >= 1,
        title: const Text('Selling Details'),
        content: Column(
            children: <Widget>[
              new Text(
                "Quantity and Price",
                textAlign : TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity', hintText: "Number of plates you want to sell"),
                controller: quantityController,
                keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price Per Plate'),
                controller: priceController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly],
              ),
              new Padding(padding: EdgeInsets.all(10)),
              new Text(
                "Time",
                textAlign : TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              Row(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),side: BorderSide(color: Colors.greenAccent)),
                      child: new Text(finalOrderByTimeHolder),
                      onPressed: (){
                        showTimePicker(
                            context: context, initialTime: new TimeOfDay.now()).then((time){
                          setState(() {
                            var covertthis = time.format(context).replaceAll(RegExp(':'), '');
                            covertthis = covertthis.replaceAll(RegExp(' AM'), '');
                            covertthis = covertthis.replaceAll(RegExp(' PM'), '');
                            finalOrderBy = int.parse(covertthis);
                            finalOrderByTimeHolder =  finalOrderByTimeHolder + " : " + finalOrderBy.toString() + " Hrs ";
                          });
                        });
                      }

                  ),
                  Spacer(),
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),side: BorderSide(color: Colors.greenAccent)),
                      child: new Text(prepTimeHolder),
                      onPressed: (){
                        showTimePicker(
                            context: context, initialTime: new TimeOfDay.now()).then((time){
                          setState(() {
                            var covertthis = time.format(context).replaceAll(RegExp(':'), '');
                            covertthis = covertthis.replaceAll(RegExp(' AM'), '');
                            covertthis = covertthis.replaceAll(RegExp(' PM'), '');
                            prepTime = int.parse(covertthis);
                            prepTimeHolder =  prepTimeHolder + " : " + prepTime.toString()+ " Hrs ";
                          });
                        });
                      }
                  ),
                ],
              ),
              new Padding(padding: EdgeInsets.all(10)),
              Row(
                children: <Widget>[
                  RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),side: BorderSide(color: Colors.greenAccent)),
                      child: new Text(sellStartTimeHolder),
                      onPressed: (){
                        showTimePicker(
                          context: context, initialTime: new TimeOfDay.now()).then((time){
                        setState(() {
                          var covertthis = time.format(context).replaceAll(RegExp(':'), '');
                          covertthis = covertthis.replaceAll(RegExp(' AM'), '');
                          covertthis = covertthis.replaceAll(RegExp(' PM'), '');
                          startTime = int.parse(covertthis);
                          sellStartTimeHolder =  sellStartTimeHolder + " : " + startTime.toString()+ " Hrs ";
                        });
                      });
                      }
                  ),
                  Spacer(),
                  RaisedButton(
                    color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(18.0),side: BorderSide(color: Colors.greenAccent)),
                      child: new Text(sellEndTimeHolder),
                      onPressed: (){
                        showTimePicker(
                            context: context, initialTime: new TimeOfDay.now()).then((time){
                              setState(() {
                                var covertthis = time.format(context).replaceAll(RegExp(':'), '');
                                covertthis = covertthis.replaceAll(RegExp(' AM'), '');
                                covertthis = covertthis.replaceAll(RegExp(' PM'), '');
                                endTime = int.parse(covertthis);
                                sellEndTimeHolder =  sellEndTimeHolder + " : " + endTime.toString()+ " Hrs ";
                              });
                        });
                    }
                  ),
                ],
              ),
            ]
        ),
      ),
      Step(
        isActive: _currentStep >= 2 ,
        title: const Text('Confirm Selling'),
        content: new Container(
          height: 200,
            decoration: new BoxDecoration(
              color: Colors.teal[50],
              border: Border.all(
              color: Colors.green,
              width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(left: 10)),
                  new Container(
                    child: getImageWidget(),
                    height: 110,
                    width: 110,
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.only(left: 10)),
                  new Container(
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(padding: EdgeInsets.only(top: 10)),
                          Text(dishName,style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 22,fontWeight: FontWeight.w600,letterSpacing: 1,),),
                          Divider(),
                          Text(dishDesc,style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 10,fontWeight: FontWeight.w600,letterSpacing: 1,),maxLines: 3,),
                          Divider(),
                          new Row(
                            children: <Widget>[
                              Text("‎₹"+price.toString() +"/-", style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 1,),),
                              new Padding(padding: EdgeInsets.only(left:40)),
                              Text("Limit : " + quantity.toString(), style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 15,fontWeight: FontWeight.w600,letterSpacing: 1,),)
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              new Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //new Padding(padding: EdgeInsets.only(left: 25,top: 30)),
                        new Text(finalOrderByTimeHolder, style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 12,fontWeight: FontWeight.w600,letterSpacing: 1,),),
                        new Padding(padding: EdgeInsets.only(left: 10)),
                        new Text(prepTimeHolder, style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 12,fontWeight: FontWeight.w600,letterSpacing: 1,),),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //new Padding(padding: EdgeInsets.only(left: 25)),
                        new Text(sellStartTimeHolder, style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 12,fontWeight: FontWeight.w600,letterSpacing: 1,),),
                        new Padding(padding: EdgeInsets.only(left: 10)),
                        new Text(sellEndTimeHolder, style: TextStyle(color: Colors.black,fontFamily: 'Raleway',fontSize: 12,fontWeight: FontWeight.w600,letterSpacing: 1,),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    ];
    return _steps;
  }
}



