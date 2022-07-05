import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happymovie/helper/api_base_helper.dart';

import '../../../helper/local_data/get_local_data.dart';
import '../../../widgets/snack_bar/custom_snack_bar.dart';
import '../../bottom_navigation_bar.dart/bottom_navigation_bar.dart';

class LoginController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();
  Future<void> loginUserApi(BuildContext context,
      {String? username, String? password}) async {
    await _apiBaseHelper
        .onNetworkRequesting(
      url: "login/",
      methode: METHODE.post,
      body: {"username": "$username", "password": "$password"},
      isAuthorize: false,
    )
        .then((response) async {
      await LocalDataStorage.storeCurrentUser(response['token']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ButtomNavigationBar()),
      );
    }).onError((ErrorModel errorModel, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(customStackBar(
        textStyle: const TextStyle(color: Colors.black, fontSize: 12),
        backgroundColor: Colors.white,
        duration: 3,
        title: '${errorModel.bodyString["message"]}',
      ));
    });
    debugPrint('');
  }
}
