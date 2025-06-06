import 'dart:convert';
import 'dart:typed_data';

class Formatter {
  ///Método para retornar um Uint8List a partir de uma imagem em formato base64String.
  static Uint8List? imagemBase64(String? base64) {
    if (base64 == null) return null; 
    return base64Decode(base64);
  }
}