import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happymovie/helper/api_base_helper.dart';
import 'package:happymovie/helper/local_data/get_local_data.dart';
import 'package:happymovie/page/sign_up/create_password.dart';

import '../../../widgets/snack_bar/custom_snack_bar.dart';
import '../../bottom_navigation_bar.dart/bottom_navigation_bar.dart';

class SignUpController extends GetxController {
  final otpCode = ''.obs;
  final emailText = ''.obs;
  final hash = ''.obs;
  final otpCodeLength = 4.obs;
  final isAPICallProcess = false;
  final isHidePass = true.obs;
  final isHideComfirmPass = true.obs;
  late FocusNode myFocusNode;

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  Future<void> getOtpByEmail(BuildContext context, {String? email}) async {
    debugPrint('email=$email');
    /* final url = dotenv.get('baseUrl');
    var response = await http.post(
      Uri.parse('$url/getotp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"username": "$email"}),
    );
    if (response.statusCode == 200) {
      debugPrint('response statusCode=${response.statusCode}');
      var temp = response;
      debugPrint(temp);
    }*/

    _apiBaseHelper
        .onNetworkRequesting(
      url: "getotp/",
      methode: METHODE.post,
      body: {"username": "$email"},
      isAuthorize: false,
    )
        .then((response) async {
      // debugPrint('hash=${response[0]['data']}');

      if (response != null || response.isNotEmpty) {
        hash.value = response['data'];

        debugPrint('hash=$hash');
      }
    }).onError((ErrorModel errorModel, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(customStackBar(
        textStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        duration: 3,
        title: '${errorModel.bodyString["message"]}',
      ));
    });
  }

  Future<void> createPasswordApi(BuildContext context,
      {String? username, String? password}) async {
    _apiBaseHelper
        .onNetworkRequesting(
      url: "signup/",
      methode: METHODE.post,
      body: {"username": "$username", "password": "$password"},
      isAuthorize: false,
    )
        .then((response) async {
      // debugPrint('hash=${response[0]['data']}');

      if (response != null || response.isNotEmpty) {
        await LocalDataStorage.storeCurrentUser(response['token']);
        var token = await LocalDataStorage.getCurrentUser();

        debugPrint('token=$token');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ButtomNavigationBar()),
        );
      }
    }).onError((ErrorModel errorModel, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(customStackBar(
        textStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        duration: 3,
        title: '${errorModel.bodyString["message"]}',
      ));
    });
  }

  final isExisting = false.obs;
  Future<void> isExistingUerApi(BuildContext context,
      {String? username}) async {
    await _apiBaseHelper
        .onNetworkRequesting(
      url: "existing/",
      methode: METHODE.post,
      body: {"username": "$username"},
      isAuthorize: false,
    )
        .then((response) async {
      debugPrint('work 1 false');
      isExisting.value = false;
    }).onError((ErrorModel errorModel, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(customStackBar(
        textStyle: const TextStyle(color: Colors.black, fontSize: 12),
        backgroundColor: Colors.white,
        duration: 3,
        title: '${errorModel.bodyString["message"]}',
      ));
      isExisting.value = true;
    });
    debugPrint('');
  }

  Future<void> verifyOTP(BuildContext context,
      {String? email, String? otp, String? hash}) async {
    debugPrint('verifyOTP email$email');
    debugPrint('verifyOTP otp$otp');
    debugPrint('verifyOTP hash$hash');
    _apiBaseHelper
        .onNetworkRequesting(
      url: "verify/",
      methode: METHODE.post,
      body: {"username": email, "otp": otp, "hash": hash},
      isAuthorize: false,
    )
        .then((response) {
      debugPrint('token');
      ScaffoldMessenger.of(context).showSnackBar(customStackBar(
        textStyle: const TextStyle(color: Colors.black, fontSize: 12),
        backgroundColor: Colors.white,
        duration: 2,
        title: 'OTP code verify success',
      ));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CreatePasswordPage()),
        );
      });
    }).onError((ErrorModel errorModel, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(customStackBar(
        textStyle: const TextStyle(color: Colors.black, fontSize: 12),
        backgroundColor: Colors.white,
        duration: 3,
        title: '${errorModel.bodyString["message"]}',
      ));

      debugPrint('${errorModel.bodyString["message"]}');
    });
  }
}
    //  _apiBaseHelper
    //     .post(
    //         url: 'getotp', body: {"username": "$email"}, isAuthorize: false)
    //     .then((value) async {
    //   if (value.statusCode == 200) {
    //     // if (value['data'] != null || value['data'].isNotEmpty) {
    //     //   await LocalDataStorage.storeOTPHash(value['data']);
    //     //   var hash = await LocalDataStorage.geteOTPHash();
    //     //   debugPrint('hash=${value['data']}');
    //     // }
    //   } else {
    //     // CustomSnackBar(
    //     //   title: '${value.bodyString["message"]}',
    //     // );
    //   }
    // }).onError((ErrorModel error, stackTrace) {
    //   debugPrint(
    //       'email : ${error.statusCode}=============================${error.bodyString["message"]}');
    //   if (error.statusCode! < 500) {
    //     SnackBar(
    //       content: Text('${error.bodyString["message"]}'),
    //     );
    //   } else {
    //     const SnackBar(
    //       content: Text('Internal server error'),
    //     );
    //   }
    // });
  

 /* Future<void> verifyOTP(BuildContext context, {String? email}) async {
    await _apiBaseHelper.postData(
      url: 'verify',
      body: {
        "username": email,
      },
    ).then((value) {
      debugPrint('phone number : 200=============================');
      if (value.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        CustomSnackBar(
          title: '${value.bodyString["message"]}',
        );
      }
    }).onError((ErrorModel error, stackTrace) {
      debugPrint(
          'phone number : ${error.statusCode}=============================${error.bodyString["message"]}');
      if (error.statusCode! < 500) {
        SnackBar(
          content: Text('${error.bodyString["message"]}'),
        );
      } else {
        CustomSnackBar(
          title: '${error.bodyString["message"]}',
        );
      }
    });
  }*/


