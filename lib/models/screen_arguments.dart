import 'package:finop/const/images_const.dart';

class ScreenArguments {
  String name;
  String companyName;
  String industry;
  String logo;
  String position;
  String companyWebsite;
  String imageUrl;
  String postDescription;
  String postImagePath;
  String equity;

  ScreenArguments({
    this.name = 'David Cobbina',
    this.companyName = 'Finopp',
    this.logo = AppImagePath.accountProfilePhoto,
    this.industry = 'Technology',
    this.position = 'CTO',
    this.imageUrl = AppImagePath.accountProfilePhoto,
    this.companyWebsite = 'www.finopp.com',
    this.postDescription = 'Lorem ipsum dolor sit amet, consectetur adipiscing '
        'elit, sed do eiusmod tempor incididunt ut labore ',
    this.postImagePath = AppImagePath.accountProfilePhoto,
    this.equity = '0%',
  });
}