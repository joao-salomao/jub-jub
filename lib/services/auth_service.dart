import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthService() {
    //   _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn(
      scopes: ['https://www.googleapis.com/auth/drive'],
    );
  }

  Future signInGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    // final GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleSignInAccount.authentication;

    await googleSignInAccount.authentication;

    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );

    // AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);

    var client = _GoogleHttpClient(await googleSignInAccount.authHeaders);
    return client;
  }

  signOutGoogle() {
    //  _firebaseAuth.signOut();
    _googleSignIn.signOut();
  }
}


class _GoogleHttpClient extends IOClient {
  Map<String, String> _headers;

  _GoogleHttpClient(this._headers) : super();

  @override
  send(http.BaseRequest request) =>
      super.send(request..headers.addAll(_headers));

  @override
  Future<http.Response> head(Object url, {Map<String, String> headers}) =>
      super.head(url, headers: headers..addAll(_headers));
}
