import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class UserRepository {
  Future<Either<AuthException, String>> login(String email, String password);

  //Future<Either<Exception, String>> re(String email, String password);

  // Future<void> signOut();

  // Future<void> resetPassword(String email);

  // Future<void> updateProfile(String displayName, String photoUrl);

  // Future<void> updatePassword(String password);

  // Future<void> updateEmail(String email);

  // Future<void> deleteAccount();

  // Future<void> sendEmailVerification();

  // Future<void> reloadUser();

  // Future<void> reauthenticate(String password);

  // Future<void> sendPasswordResetEmail(String email);

  // Future<void> sendEmailVerificationAgain();

  // Future<void> updatePhoneNumber(String phoneNumber);

  // Future<void> verifyPhoneNumber(String phoneNumber, String verificationId, String smsCode);

  // Future<void> updateProfilePhoto(String photoUrl);

  // Future<void> updateProfileDisplayName(String displayName);

  // Future<void> updateProfileEmail(String email);

  // Future<void> updateProfilePhoneNumber(String phoneNumber);

  // Future<void> updateProfilePassword(String password);

  // Future<void> updateProfileEmailAndPassword(String email, String password);

  // Future<void> updateProfileEmailAndPhoneNumber(String email, String phoneNumber);

  // Future<void> updateProfilePasswordAndPhoneNumber(String password, String phoneNumber);

  // Future<void> updateProfileEmailPasswordAndPhoneNumber(String email, String password, String phoneNumber);

  // Future<void> updateProfileEmailAndPasswordAndPhoneNumber(String email, String password, String phoneNumber);

  // Future<void> updateProfileEmailAndPasswordPhoneNumberAndPhotoUrl(String email, String password, String phoneNumber, String photoUrl);

  // Future<void> updateProfileEmailAndPasswordPhoneNumberPhotoUrlAndDisplayName(
  //     String email, String password, String phoneNumber, String photoUrl, String displayName);

  // Future<void> updateProfileEmailAndPasswordPhoneNumberPhotoUrlDisplayNameAndUid(
  //     String email, String password, String phoneNumber, String photoUrl, String displayName, String uid);

  // Future<void> updateProfileEmailAndPasswordPhoneNumberPhotoUrlDisplayNameUidAndProviderId(
  //     String email, String password, String phoneNumber, String photoUrl, String displayName, String uid, String providerId);

  // Future<void> updateProfileEmailAndPasswordPhoneNumberPhotoUrlDisplayNameUidProviderIdAndToken(
  //     String email, String password, String phoneNumber, String photoUrl, String displayName, String uid, String providerId, String token);

  // Future<void> updateProfileEmailAndPasswordPhoneNumberPhotoUrlDisplayNameUidProviderIdTokenAndRefreshToken(String email, String password,
  // String phoneNumber, String photoUrl, String displayName, String uid, String providerId, String token, String refreshToken);
}
