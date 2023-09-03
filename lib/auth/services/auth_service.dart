import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservice {
  //Ggoogle Sign In
  signInWithGoogle() async {
    //begin interractive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn(
      serverClientId:
          '240679996887-h7o2feh0ufr9ifeop66963j3t21avtbh.apps.googleusercontent.com',
    ).signIn();

    final GoogleSignInAuthentication? gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
