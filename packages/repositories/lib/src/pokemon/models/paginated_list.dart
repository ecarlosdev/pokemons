/// A model that represents a paginated list of items.
class PaginatedList<T> {
  /// Creates a new paginated list.
  PaginatedList({
    required this.results,
    required this.total,
    required this.nextOffset,
    required this.nextLimit,
  });

  /// The list of items.
  final List<T> results;

  /// The total number of items.
  final int total;

  /// Offset that should be used to fetch the next page.
  final int nextOffset;

  /// Limit that should be used to fetch the next page.
  final int nextLimit;
}
