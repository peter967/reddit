// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit/core/constants/constants.dart';
import 'package:reddit/core/constants/firebse_constants.dart';
import 'package:reddit/core/failure.dart';
import 'package:reddit/core/type_defs.dart';
import 'package:reddit/models/user_model.dart';

class AuthRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _signIn;
  AuthRepo({
    required firestore,
    required auth,
    required signIn,
  })  : _auth = auth,
        _firestore = firestore,
        _signIn = signIn;
  CollectionReference get _user =>
      _firestore.collection(FirebaseConstants.userCollection);
  Stream<User?> get authStateChange => _auth.authStateChanges();
  FutureEither<UserModel> signInWithGoogle() async {
    UserModel userModel;
    try {
      final GoogleSignInAccount? user = await _signIn.signIn();
      final googleAuth = await user?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          name: userCredential.user!.displayName ?? 'No Name',
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
          banner: Constants.bannerDefault,
          uid: userCredential.user!.uid,
          isAuthenticated: true,
          Karma: 0,
          awards: [],
        );
        await _user.doc(userCredential.user!.uid).set(
              userModel.toMap(),
            );
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }

      print(userCredential.user?.email);
      return right(userModel);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _user.doc(uid).snapshots().map(
          (event) => UserModel.fromMap(event.data() as Map<String, dynamic>),
        );
  }

  void logOut() async {
    await _signIn.signOut();
    await _auth.signOut();
  }
}
