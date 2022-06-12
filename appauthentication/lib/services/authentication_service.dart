
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class   DomainSetting {
    static String AUTH0_DOMAIN ="dev-czgkk69l.us.auth0.com";
}


class AuthenticationSetting  {
  String _AUTH0_CLIENT_ID = '5OnSRTDHf647F0A27bXPDg42y508sJn1';
  String _AUTH0_REDIRECT_URI = 'com.example.appauthentication://login-demo';
  String _AUTH0_ISSUER = 'https://${DomainSetting.AUTH0_DOMAIN}';
}



class AuthenticationService  extends AuthenticationSetting  {
  bool isBusy = false;
  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();


  Future<void> login() async{

    if(!isBusy) {

      try{

        final AuthorizationTokenResponse? _authToken  = await appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
            _AUTH0_CLIENT_ID,
            _AUTH0_REDIRECT_URI,
            issuer: 'https://${DomainSetting.AUTH0_DOMAIN}',
            scopes: ['openid', 'profile', 'offline_access']
        ));
        final String? IdTokenUsers = _authToken!.idToken;

        if(IdTokenUsers != null) {
           print(IdTokenUsers);
        }

      } catch(e, s){
        print("ERROR OF AUTHENTICATION");
      }
    }

    isBusy = true;
    return ;
  }

}