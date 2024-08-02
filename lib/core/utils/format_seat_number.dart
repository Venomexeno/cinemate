String formatSeatNumber(int seatNumber) {
  const seatRows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  int row = (seatNumber - 1) ~/ 11; // Find the row index
  int seat = (seatNumber - 1) % 11 + 1; // Find the seat number within the row
  return '${seatRows[row]}$seat';
}