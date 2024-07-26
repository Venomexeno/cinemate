import 'dart:math';

List<String> getRandomMovies() {
  final Random random = Random();
  final Set<int> numbers = {};

  // Generate unique random numbers
  while (numbers.length < 6) {
    numbers.add(random.nextInt(20) + 1);
  }
  // Create the list of filenames based on the unique numbers
  final List<String> movieFilenames = numbers.map((number) => 'assets/images/movies_list/movie_$number.jpg').toList();

  return movieFilenames;
}
