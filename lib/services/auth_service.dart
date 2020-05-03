import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:jubjub/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthService() {
    _firebaseAuth = FirebaseAuth.instance;

    _googleSignIn = GoogleSignIn(
      scopes: [
        'https://www.googleapis.com/auth/drive',
        // Scope to create a app folder on user Google Drive
        // PS: Folder is not visible
        // 'https://www.googleapis.com/auth/drive.appdata'
      ],
    );
  }

  Future<FirebaseUser> _signInFirebase(AuthCredential credential) async {
    try {
      final authResult = await _firebaseAuth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _firebaseAuth.currentUser();
      assert(user.uid == currentUser.uid);

      return currentUser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signIn() async {
    final isLogged = (await _firebaseAuth.currentUser()) != null;
    try {
      var googleSignInAccount;

      if (isLogged) {
        googleSignInAccount = await _googleSignIn.signInSilently();
      } else {
        googleSignInAccount = await _googleSignIn.signIn();
      }

      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final currentUser = await _signInFirebase(credential);
      final client = _GoogleHttpClient(await googleSignInAccount.authHeaders);
      final user = UserModel(
        client: client,
        email: currentUser.email,
        name: currentUser.displayName,
        photoUrl: currentUser.photoUrl,
      );

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  signOut() {
    _firebaseAuth.signOut();
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
