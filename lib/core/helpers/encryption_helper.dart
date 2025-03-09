import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static final key = Key.fromUtf8('32-character-long-key'); // Use a secure key
  static final iv = IV.fromLength(16); // Initialization Vector

  static String encrypt(String plainText) {
    final encrypter = Encrypter(AES(key));
    return encrypter.encrypt(plainText, iv: iv).base64;
  }

  static String decrypt(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    return encrypter.decrypt64(encryptedText, iv: iv);
  }
}
