
int getVisibleSeatNumber(int index) {
  // Number of columns per row and the hidden column and row
  const int columnsPerRow = 12;
  const int hiddenColumn = 9;
  const int hiddenRow = 5;

  // Calculate row and column in the original grid
  int row = index ~/ columnsPerRow;
  int column = index % columnsPerRow;

  // Calculate the number of visible columns per row
  int visibleColumnsPerRow = columnsPerRow - 1;

  // Adjust row and column offsets for hidden row and column
  int rowOffset = row >= hiddenRow ? 1 : 0;
  int columnOffset = column >= hiddenColumn ? 1 : 0;

  // Calculate the visible index
  int visibleIndex =
      (row - rowOffset) * visibleColumnsPerRow + (column - columnOffset);

  return visibleIndex + 1; // Convert from 0-based to 1-based indexing
}
