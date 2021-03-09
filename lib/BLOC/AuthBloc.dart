import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:password_hash/password_hash.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

import 'package:SlTrade/networking/Response.dart';
import 'package:SlTrade/repository/AuthRepository.dart';
import 'package:SlTrade/models/AuthModel.dart';

import 'package:cipher2/cipher2.dart';

class AuthBloc {
  AuthPreloginModelRepository _authPreloginModelRepository;
  StreamController _authPreloginModelController;

  StreamSink<Response<AuthPreloginModel>> get authSink =>
      _authPreloginModelController.sink;

  Stream<Response<AuthPreloginModel>> get authStream =>
      _authPreloginModelController.stream;

  AuthBloc() {
    _authPreloginModelController =
        StreamController<Response<AuthPreloginModel>>();
    _authPreloginModelRepository = AuthPreloginModelRepository();
    preLoginRequest();
  }

  preLoginRequest() async {
    authSink.add(Response.loading('Pre login request.'));

    try {
      var authResponse = await _authPreloginModelRepository.fetchPreLoginData();
      var _response = AuthPreloginModel.fromJson(authResponse);

      var generator = new PBKDF2();

      var passwordHash = generator.generateKey(
          "secretkey", _response.salt, _response.iterations, _response.keysize);
      var tokenHash = generator
          .generateKey(_response.token, _response.salt, _response.iterations,
              _response.keysize)
          .toString();

      // final encryptedString = await Cipher2.encryptAesCbc128Padding7(
      //     passwordHash, tokenHash, _response.iv);
      //   Uint8List bytes = Uint8List.fromList(passwordHash);
      // StringBuffer buffer = new StringBuffer();
      // for (int i = 0; i < bytes.length;) {
      //   int firstWord = (bytes[i] << 8) + bytes[i + 1];
      //   if (0xD800 <= firstWord && firstWord <= 0xDBFF) {
      //     int secondWord = (bytes[i + 2] << 8) + bytes[i + 3];
      //     buffer.writeCharCode(
      //         ((firstWord - 0xD800) << 10) + (secondWord - 0xDC00) + 0x10000);
      //     i += 4;
      //   } else {
      //     buffer.writeCharCode(firstWord);
      //     i += 2;
      //   }
      // }

      print("}}}}}}}}}}}}}}}}}}}}}}}}");
      // print(buffer.toString());
      // String s = new String.fromCharCodes(passwordHash);
      // var outputAsUint8List = new Uint8List.fromList(s.codeUnits);
      // print(String.fromCharCodes(outputAsUint8List));
      // print(Utf8Decoder().convert(passwordHash));
      // var test = new String.fromCharCodes(passwordHash);
      // print(test);
      // print(AsciiDecoder().convert(passwordHash));
      print(hex.encode(passwordHash));
      print("}}}}}}}}}}}}}}}}}}}}}}}}");

      authSink.add(Response.completed(_response));
    } catch (e) {
      authSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _authPreloginModelController?.close();
  }
}
