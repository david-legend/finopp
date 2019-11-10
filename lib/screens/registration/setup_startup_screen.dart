import 'dart:io';

import 'package:finop/const/_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupStartUpScreen extends StatefulWidget {
//  static const String ROUTE_NAME = '/';

  static const String ROUTE_NAME = '/setupStartUp';

  @override
  _SetupStartUpScreenState createState() => _SetupStartUpScreenState();
}

class _SetupStartUpScreenState extends State<SetupStartUpScreen>
    with TickerProviderStateMixin {
  String industryDropdownValue = 'Technology';
  String locationDropdownValue = 'Ghana';

  File _imageFile;
  dynamic _pickImageError;
  bool _isImageSet = false;
  String _retrieveDataError;

  bool _isLoading;
  bool _isOnBasicInfo;
  bool _isOnLocationInfo;
  bool _isOnSetupLogo;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _isOnBasicInfo = true;
    _isOnLocationInfo = false;
    _isOnSetupLogo = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              SpinKitChasingDots
//              SpinKitDoubleBounce
              _isLoading
                  ? SpinKitWave(
                    color: Colors.green,
                    type: SpinKitWaveType.center,
                    size: 50.0,
                    controller: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 1000)),
                  )
                  : Container(),
              _isOnBasicInfo ? basicInfo() : Container(),
              _isOnLocationInfo ? locationInfo() : Container(),
              _isOnSetupLogo ? setupLogo() : Container(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kFINOP_ORANGE,
        tooltip: 'Proceed',
        onPressed: () {
          _proceedToNextStep();
        },
        label: const Text('Proceed'),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget chipsInput() {
    return ChipsInput(
//              initialValue: [''],
      keyboardAppearance: Brightness.dark,
      textCapitalization: TextCapitalization.words,
      enabled: true,
      maxChips: 10,
      textStyle: TextStyle(height: 1.5, fontFamily: "Roboto", fontSize: 16),
      decoration: InputDecoration(
        // prefixIcon: Icon(Icons.search),
        // hintText: formControl.hint,
        labelText: "Industries",
        // enabled: false,
        // errorText: field.errorText,
      ),
      findSuggestions: (String query) {
        if (query.length != 0) {
          var lowercaseQuery = query.toLowerCase();
          List<String> industry = [];
          industry.add(lowercaseQuery);
          return industry;
        }
        return [];
      },
      onChanged: (data) {
        print(data);
      },
      chipBuilder: (context, state, profile) {
        return InputChip(
          key: ObjectKey(profile),
          label: Text(profile),
          onDeleted: () => state.deleteChip(profile),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, profile) {
        return ListTile(
          key: ObjectKey(profile),
//          leading: Icon(Icons.security),
          title: Text(profile),
          onTap: () => state.selectSuggestion(profile),
        );
      },
    );
  }

  Widget basicInfo() {
    return Expanded(
      flex: 1,
      child: Container(
          child: Column(
        children: <Widget>[
          Text(
            StringConst.SETUP_BASIC_INFO,
            textAlign: TextAlign.center,
            style: setupHeadingStyle,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: false,
              hintText: 'Name of your comapany?',
              labelText: 'Company name *',
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 24.0),
          chipsInput(),
          SizedBox(height: 24.0),
          DropdownButton<String>(
            value: industryDropdownValue,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            hint: Text(' Choose Industry'),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            underline: Container(
              height: 2,
              color: Colors.grey,
            ),
            onChanged: (String newValue) {
              setState(() {
                industryDropdownValue = newValue;
              });
            },
            items: <String>['Technology', 'Agriculture', 'Forestry', 'Oil ']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 24.0),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  'Tell us about your startup (e.g., what your startup does.)',
              labelText: 'Description',
            ),
            maxLines: 4,
          ),
          skipButton(),
        ],
      )),
    );
  }

  Widget locationInfo() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              StringConst.SETUP_LOCATION,
              textAlign: TextAlign.center,
              style: setupHeadingStyle,
            ),
            SizedBox(height: 12.0),
            Text(
              StringConst.SETUP_LOCATION_SUB,
              textAlign: TextAlign.center,
              style: setupSubtitleStyle,
            ),
            SizedBox(height: 24.0),
            DropdownButton<String>(
              value: locationDropdownValue,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              hint: Text(' Country/Region'),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String newValue) {
                setState(() {
                  locationDropdownValue = newValue;
                });
              },
              items: <String>[
                'Ghana',
                'Nigeria',
                'Egypt',
                'Kenya',
                'Rwanda',
                'South Africa'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: false,
                hintText: 'Postal Code (Optional)',
                labelText: 'Postal Code (Optional)',
              ),
              keyboardType: TextInputType.text,
            ),
            skipButton(),
          ],
        ),
      ),
    );
  }

  Widget setupLogo() {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Text(
              StringConst.SETUP_PROFILE_PHOTO,
              textAlign: TextAlign.center,
              style: setupHeadingStyle,
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                _onImageButtonPressed(ImageSource.gallery);
                print("add logo");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                width: MediaQuery.of(context).size.width,
                height: 400.0,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: _isImageSet ? _previewImage() : tapToChooseImage(),
              ),
            ),
            skipButton(),
          ],
        ),
      ),
    );
  }

  Widget tapToChooseImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.camera_enhance,
          size: 80,
        ),
        SizedBox(height: 10.0),
        Text(
          StringConst.TAP_TO_ADD_PHOTO,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget skipButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 12.0),
          child: FlatButton(
            onPressed: () {
              skipStep();
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onImageButtonPressed(ImageSource source) async {
    try {
      _imageFile = await ImagePicker.pickImage(source: source);

      if (_imageFile != null) {
        setState(() {
          _isImageSet = true;
        });
      } else {
        setState(() {
          _isImageSet = false;
        });
      }
    } catch (e) {
      _pickImageError = e;
    }
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      print(_imageFile);
      return Image.file(_imageFile);
    } else if (_pickImageError != null) {
      return Container();
    } else {
      return Container();
    }
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<String> checkCurrentStep() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentStep = prefs.getString(StringConst.SETUP_STEP_KEY);
    return currentStep;
  }

  void addCurrentStep(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConst.SETUP_STEP_KEY, value);
  }

  void turnOnProgressIndicator() {
    setState(() {
      _isLoading = true;
      _isOnBasicInfo = false;
      _isOnLocationInfo = false;
      _isOnSetupLogo = false;
    });
  }

  void turnOffProgressIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  void _proceedToNextStep() async {
    turnOnProgressIndicator();
    String currentStep = await checkCurrentStep();
    print("CURRENT STEP:: $currentStep");

    Future.delayed(const Duration(seconds: 2), () {
      if (currentStep == StringConst.BASIC_INFO_STEP_VALUE) {
        addCurrentStep(StringConst.LOCATION_STEP_VALUE);
        turnOffProgressIndicator();
        showCurrentScreen(locationInfo: true);
      } else if (currentStep == StringConst.LOCATION_STEP_VALUE) {
        addCurrentStep(StringConst.PROFILE_PHOTO_STEP_VALUE);
        turnOffProgressIndicator();
        showCurrentScreen(logoInfo: true);
      } else if (currentStep == StringConst.PROFILE_PHOTO_STEP_VALUE) {
        //take user into app
      }
    });

  }

  void showCurrentScreen(
      {bool basicInfo = false, bool locationInfo = false, logoInfo = false}) {
    setState(() {
      _isOnBasicInfo = basicInfo;
      _isOnLocationInfo = locationInfo;
      _isOnSetupLogo = logoInfo;
    });
  }

  void skipStep() async {
    String currentStep = await checkCurrentStep();
    print("CURRENT STEP:: $currentStep");

    if (currentStep == StringConst.BASIC_INFO_STEP_VALUE) {
      addCurrentStep(StringConst.LOCATION_STEP_VALUE);
      showCurrentScreen(locationInfo: true);
    } else if (currentStep == StringConst.LOCATION_STEP_VALUE) {
      addCurrentStep(StringConst.PROFILE_PHOTO_STEP_VALUE);
      showCurrentScreen(logoInfo: true);
    } else if (currentStep == StringConst.PROFILE_PHOTO_STEP_VALUE) {
      //take user into app
    }
  }
}
