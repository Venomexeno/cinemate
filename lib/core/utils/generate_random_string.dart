import 'dart:math';

String generateRandomString() {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
    14,
        (_) => characters.codeUnitAt(random.nextInt(characters.length)),
  ));
}