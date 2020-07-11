import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _currentStep = 0;

  final String url = "http://10.0.2.2:9998/api/User/SaveUser";

  final TextEditingController firstnameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController dobController = new TextEditingController();
  int iPrimaryUsage = 0;
  int iAdditionalPhone = 0;
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confpasswordController = new TextEditingController();
  int iParentUserID = 0;
  final TextEditingController AddressLine1Controller = new TextEditingController();
  final TextEditingController AddressLine2Controller = new TextEditingController();
  final TextEditingController LandmarkController = new TextEditingController();
  final TextEditingController CityController = new TextEditingController();
  final TextEditingController StateController = new TextEditingController();
  final TextEditingController PinCodeController = new TextEditingController();
  final TextEditingController CountryController = new TextEditingController();
  int iAddressType = 0;
  double iLongitude = 0.0;
  double iLattitude = 0.0;
  int IsVerified = 0;

  Future registration(String FirstName, String LastName, int PhoneNumber, String EmailID, String DOB, int PrimaryUsage,int AdditionalPhone, String UserPassword,int ParentUserID, String AddressLine1,String AddressLine2, String Landmark, String City,int PinCode, String State, String Country, int AddressType, double Longitude,double Lattitude, int IsVerified) async
  {
    Map map = {"FirstName": FirstName,"LastName" : LastName, "PhoneNumber" : PhoneNumber.toString(), "EmailID" : EmailID, "DOB" : DOB, "PrimaryUsage" : PrimaryUsage.toString(), "AdditionalPhone" : AdditionalPhone.toString(), "UserPassword" : UserPassword, "ParentUserID" : ParentUserID.toString(), "AddressLine1" : AddressLine1, "AddressLine2" : AddressLine2, "Landmark" : Landmark, "City" : City, "PinCode" : PinCode.toString(), "State" : State, "Country" : Country, "AddressType" : AddressType.toString(), "Longitude" : Longitude.toString(), "Lattitude" : Lattitude.toString() , "IsVerified" : IsVerified.toString()};

    var response = await http.post(url, body: map);
    int statusCode = response.statusCode;
    debugPrint(statusCode.toString());
    debugPrint(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBodyBehindAppBar: true,
      appBar: new AppBar(
          centerTitle : true,
        title: new Text("Create an Account"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme : IconThemeData(
        color: Colors.black)
      ),
      body: Stepper(
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
                debugPrint('first continue');


                //check if both password same

                //check mail or phone validation

                //check all mandatory input field filled

              }

              if(this._currentStep == 1)
                {
                  debugPrint('second continue');

                  //invoke a message to detect location
                  //get lattitude and longitude - get city and all from there
                }
            }
            else{

              debugPrint('final continue');
              String FirstName = firstnameController.text;
              String LastName = lastnameController.text;
              int PhoneNumber = int.parse(phoneController.text);
              String eMail = emailController.text;
              String DOB = dobController.text;
              String password = passwordController.text;
              String FlatBlock = AddressLine1Controller.text;
              String Address = AddressLine2Controller.text;
              String Landmark = LandmarkController.text;
              String City = CityController.text;
              int Pincode = int.parse(PinCodeController.text);
              String State = StateController.text;
              String Country = CountryController.text;

              registration(FirstName,LastName,PhoneNumber,eMail,DOB,iPrimaryUsage,iAdditionalPhone,password,iParentUserID,FlatBlock,Address,Landmark,City,Pincode,State, Country,iAddressType,iLongitude,iLattitude,IsVerified);

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
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
    Step(
      title: const Text('New Account'),
      isActive: _currentStep >= 0,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name *'),
            controller: firstnameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last Name *'),
            controller: lastnameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone Number *'),
            controller: phoneController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email Address'),
            controller: emailController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Date of Birth *'),
            controller: dobController,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password *'),
            controller: passwordController,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Confirm Password *'),
            controller: confpasswordController,
          ),
        ],
      ),
    ),
    Step(
      isActive: _currentStep >= 1,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Flat No. & Block'),
            controller: AddressLine1Controller,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Apartment'),
            controller: AddressLine2Controller,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Landmark'),
            controller: LandmarkController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'City'),
            controller: CityController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'PinCode'),
            controller: PinCodeController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'State'),
            controller: StateController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Country'),
            controller: CountryController,
          ),
        ],
      ),
    ),
    Step(
      isActive: _currentStep >= 2 ,
      title: const Text('You'),
      subtitle: const Text("Personalize"),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];
  return _steps;
  }
}