import 'dart:io';

import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/size_const.dart';
import 'package:finop/const/string_const.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/screens/app/navigation_home_screen.dart';
import 'package:finop/widgets/SetupStepsWidget.dart';
import 'package:finop/widgets/finopp_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupInvestorScreen extends StatefulWidget {
//  static const String ROUTE_NAME = '/';
  static const String ROUTE_NAME = '/setupInvestor';

  @override
  _SetupInvestorScreenState createState() => _SetupInvestorScreenState();
}

class _SetupInvestorScreenState extends State<SetupInvestorScreen>
    with TickerProviderStateMixin {
  int step = 1;
  String subtitle = StringConst.SETUP_BASIC_INFO;
  TextEditingController _companyName = TextEditingController();
  TextEditingController _founders = TextEditingController();
  TextEditingController _industry = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _postalCode = TextEditingController();
  String industryDropdownValue = 'Technology';
  String locationDropdownValue = 'Ghana';

  File _imageFile;
  dynamic _pickImageError;
  bool _isImageSet = false;
  String _retrieveDataError;

  bool _isLoading;
  bool _isOnBasicInfo;
  bool _isOnLocationInfo;
  bool _isOnSetupProfilePhoto;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _isOnBasicInfo = true;
    _isOnLocationInfo = false;
    _isOnSetupProfilePhoto = false;
    _initializeStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _isLoading,
          child: Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      AppImagePath.finoppLogo,
                      height: 35,
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      StringConst.SETUP_TITLE,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 14.0),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                SetupSteps(
                  activeStep: step,
                ),
                SizedBox(height: 30.0),
                _isOnBasicInfo ? basicInfo() : Container(),
                _isOnLocationInfo ? locationInfo() : Container(),
                _isOnSetupProfilePhoto ? setupProfilePhoto() : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputText(String fieldName, String hintText,
      TextEditingController controller, bool obSecure,
      {int maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: textWithBlack,
        ),
        SizedBox(height: 10.0),
        TextField(
          style: textWithBlack,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              hintStyle: regularHintStyle,
              contentPadding: EdgeInsets.all(18.0),
              labelStyle: TextStyle(
                fontSize: TEXT_NORMAL_SIZE,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                height: 0,
              ),
              border: InputBorder.none),
          maxLines: maxLines,
          obscureText: obSecure,
        )
      ],
    );
  }

  Widget chipsInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Industry',
          textAlign: TextAlign.start,
          style: textWithBlack,
        ),
        SizedBox(height: 10.0),
        ChipsInput(
          keyboardAppearance: Brightness.dark,
          textCapitalization: TextCapitalization.words,
          enabled: true,
          maxChips: 6,
          textStyle: textWithBlack,
          decoration: InputDecoration(
            filled: true,
            hintText: "Add industries you're interested in",
            hintStyle: regularHintStyle,
            border: InputBorder.none,
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
              title: Text(profile),
              onTap: () => state.selectSuggestion(profile),
            );
          },
        ),
      ],
    );
  }

  Widget basicInfo() {
    return Expanded(
      flex: 1,
      child: ListView(
        children: <Widget>[
          inputText("Company", 'Enter you company name', _companyName, false),
          SizedBox(height: 24.0),
          chipsInput(),
          SizedBox(height: 24.0),
          inputText(
            "Description",
            'Tell us about your company \n(e.g., what you look for in a startup)',
            _description,
            false,
            maxLines: 4,
          ),
          SizedBox(
            height: 40.0,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FinoppPrimaryButton(
              width: MediaQuery.of(context).size.width / 3,
              action: _proceedToNextStep,
            ),
          ),
        ],
      ),
    );
  }

  Widget locationInfo() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
            inputText("Postal Code", '00233', _postalCode, false),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: <Widget>[
                    skipButton(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FinoppPrimaryButton(
                          width: MediaQuery.of(context).size.width /3,
                          action: _proceedToNextStep,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setupProfilePhoto() {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showBottomModalSheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32.0),
                width: MediaQuery.of(context).size.width,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey),
                ),
                child: _isImageSet ? _previewImage() : tapToChooseImage(),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: <Widget>[
                    skipButton(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FinoppPrimaryButton(
                          width: MediaQuery.of(context).size.width /3,
                          action: _proceedToNextStep,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
          FontAwesomeIcons.cameraRetro,
          size: 80,
        ),
        SizedBox(height: 10.0),
        Text(
          StringConst.TAP_TO_ADD_PHOTO,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget skipButton() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          child: FlatButton(
            onPressed: () {
              _skipStep();
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

  void showBottomModalSheet() {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _onImageButtonPressed(ImageSource.gallery),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.images,
                            size: 40.0,
                            color: kFINOP_DARK_SHADE,
                          ),
                          SizedBox(height: 10),
                          Text('Album')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => _onImageButtonPressed(ImageSource.camera),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.camera,
                            size: 40.0,
                            color: kFINOP_DARK_SHADE,
                          ),
                          SizedBox(height: 10),
                          Text('Camera')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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

  Future<String> _getCurrentStep() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentStep = prefs.getString(StringConst.SETUP_STEP_KEY);
    return currentStep;
  }

  void _initializeStep() async {
    String currentStep = await _getCurrentStep();
    if (currentStep == StringConst.BASIC_INFO_STEP_VALUE) {
      _increaseProgressStep(1, StringConst.SETUP_BASIC_INFO);
      _showCurrentScreen(basicInfo: true);
    } else if (currentStep == StringConst.LOCATION_STEP_VALUE) {
      _increaseProgressStep(3, StringConst.SETUP_LOCATION_SUB);
      _showCurrentScreen(locationInfo: true);
    } else if (currentStep == StringConst.PROFILE_PHOTO_STEP_VALUE) {
      _increaseProgressStep(5, StringConst.SETUP_PROFILE_PHOTO);
      _showCurrentScreen(logoInfo: true);
    }
  }

  void _addCurrentStep(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConst.SETUP_STEP_KEY, value);
  }

  void _turnOnProgressIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  void _turnOffProgressIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  void _proceedToNextStep() async {
    _turnOnProgressIndicator();
    String currentStep = await _getCurrentStep();
    print("CURRENT STEP:: $currentStep");

    Future.delayed(const Duration(seconds: 2), () {
      if (currentStep == StringConst.BASIC_INFO_STEP_VALUE) {
        _addCurrentStep(StringConst.LOCATION_STEP_VALUE);
        _turnOffProgressIndicator();
        _increaseProgressStep(3, StringConst.SETUP_LOCATION_SUB);
        _showCurrentScreen(locationInfo: true);
      } else if (currentStep == StringConst.LOCATION_STEP_VALUE) {
        _addCurrentStep(StringConst.PROFILE_PHOTO_STEP_VALUE);
        _turnOffProgressIndicator();
        _increaseProgressStep(5, StringConst.SETUP_PROFILE_PHOTO);
        _showCurrentScreen(logoInfo: true);
      } else if (currentStep == StringConst.PROFILE_PHOTO_STEP_VALUE) {
        _addCurrentStep(StringConst.SETUP_COMPLETE_VALUE);
        Navigator.pushNamed(context, NavigationHomeScreen.ROUTE_NAME);
      }
    });
  }

  void _showCurrentScreen(
      {bool basicInfo = false, bool locationInfo = false, logoInfo = false}) {
    setState(() {
      _isOnBasicInfo = basicInfo;
      _isOnLocationInfo = locationInfo;
      _isOnSetupProfilePhoto = logoInfo;
    });
  }

  void _skipStep() async {
    String currentStep = await _getCurrentStep();
    print("CURRENT STEP:: $currentStep");

    if (currentStep == StringConst.BASIC_INFO_STEP_VALUE) {
      _addCurrentStep(StringConst.LOCATION_STEP_VALUE);
      _showCurrentScreen(locationInfo: true);
    } else if (currentStep == StringConst.LOCATION_STEP_VALUE) {
      _addCurrentStep(StringConst.PROFILE_PHOTO_STEP_VALUE);
      _showCurrentScreen(logoInfo: true);
    } else if (currentStep == StringConst.PROFILE_PHOTO_STEP_VALUE) {
      _addCurrentStep(StringConst.SETUP_COMPLETE_VALUE);
      Navigator.pushNamed(context, NavigationHomeScreen.ROUTE_NAME);
    }
  }

  void _increaseProgressStep(int nextStep, String subtitle) {
    setState(() {
      this.step = nextStep;
      this.subtitle = subtitle;
    });
  }
}
