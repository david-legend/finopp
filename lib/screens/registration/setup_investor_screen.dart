import 'dart:io';

import 'package:finop/const/color_const.dart';
import 'package:finop/const/string_const.dart';
import 'package:finop/const/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SetupInvestorScreen extends StatefulWidget {
  static const String ROUTE_NAME = '/';

  @override
  _SetupInvestorScreenState createState() => _SetupInvestorScreenState();
}

class _SetupInvestorScreenState extends State<SetupInvestorScreen> {
  String industryDropdownValue = 'Technology';
  String locationDropdownValue = 'Ghana';

  File _imageFile;
  dynamic _pickImageError;
  bool _isImageSet = false;
  String _retrieveDataError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
          child: Column(
            children: <Widget>[
              basicInfo(),
//              locationInfo(),
//              setupProfilePhoto(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kFINOP_ORANGE,
        tooltip: 'Proceed',
        onPressed: () {},
        label: const Text('Proceed'),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget basicInfo() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              items: <String>[
                'Technology',
                'Agriculture',
                'Forestry',
                'Oil '
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
                border: OutlineInputBorder(),
                hintText:
                    'Tell us about your company (e.g., what type of businesses'
                    ' are you looking to invest in.)',
                labelText: 'Description',
              ),
              maxLines: 4,
            ),
            skipButton(),
          ],
        ),
      ),
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

  Widget setupProfilePhoto() {
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
                showBottomModalSheet();
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
      flex: 1,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: FlatButton(
          onPressed: () {},
          child: Container(
            margin: EdgeInsets.only(bottom: 12.0),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () =>  _onImageButtonPressed(ImageSource.camera),
                    child: Icon(
                      Icons.camera_alt,
                      size: 40.0,
                      color: kFINOP_DARK_BLUE,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () =>  _onImageButtonPressed(ImageSource.gallery),
                    child: Icon(
                      Icons.photo_library,
                      size: 40.0,
                      color: kFINOP_DARK_BLUE,
                    ),
                  )
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
}
