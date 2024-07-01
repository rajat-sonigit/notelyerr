import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notely/Screens/auth/login.dart';
import 'package:notely/Screens/auth/startscreen.dart';
import 'package:notely/Screens/home.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => StartScreen());
    } else {
      String? displayName = user.displayName ?? "Default Name";
      Get.offAll(() => HomePage(name: displayName));
    }
  }

  void register(String email, String password, String name) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.updateProfile(displayName: name);
        await user.reload();
        user = auth.currentUser;
      }

      Get.snackbar("Success", "User registered successfully!");
    } catch (e) {
      Get.snackbar("Registration Error", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
      Get.snackbar("Login Error", e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
    Get.to(LoginPage());
  }

  void googleSignIn() async {
    GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleuser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    Get.to(HomePage(name: userCredential.user?.displayName));
  }

//   Future<void> signInWithApple(
//       AuthorizationCredentialAppleID credential) async {
//     try {
//       OAuthProvider oAuthProvider = OAuthProvider("apple.com");
//       final OAuthCredential credential = oAuthProvider.credential(
//         idToken: credential.identityToken,
//         accessToken: credential.authorizationCode,
//       );
//       await auth.signInWithCredential(credential);
//     } catch (e) {
//       print("Error signing in with Apple: $e");
//       // Handle error
//     }
//   }
 }
