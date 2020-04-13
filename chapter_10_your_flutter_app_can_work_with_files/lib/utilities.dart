import 'dart:math';

String makeRandomText(int numberOfWords) {
  List<String> words = <String>[];
  List<String> characters = 'abcdefghijklmnopqrstuvwxyz'.split('');
  for (int i = 1; i <= numberOfWords; i++) {
    String word = "";
    for (int c = 0; c <= Random().nextInt(12); c++) {
      word += characters[Random().nextInt(characters.length)];
    }
    words.add(word);
  }
  return words.join(" ") + ".";
}
