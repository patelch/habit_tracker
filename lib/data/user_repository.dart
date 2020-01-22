import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker/model/user.dart';

class UserRepository {

  final FirebaseAuth _firebaseAuth;

  UserRepository({ FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> register({String email, String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signIn({String email, String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<void> updateUserInfo({FirebaseUser user, String name, String photoUrl}) async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = name;
    updateInfo.photoUrl = photoUrl;

    await user.updateProfile(updateInfo);
    return await user.reload();
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<User> getUser() async {
    final currentUser = await _firebaseAuth.currentUser();

    return User(
      name: currentUser.displayName,
      email: currentUser.email,
      photoUrl: currentUser.photoUrl,
    );
  }


}