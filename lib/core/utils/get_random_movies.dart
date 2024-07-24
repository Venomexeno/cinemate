import 'dart:math';

List<String> getRandomMovies(List<String> list, int count) {
  final random = Random();

  final List<int> indices = List.generate(list.length, (index) => index);
  indices.shuffle(random);

  // Take the first `count` indices from the shuffled list
  final selectedIndices = indices.take(count);

  // Use the selected indices to get the corresponding movies
  return selectedIndices.map((index) => list[index]).toList();
}
