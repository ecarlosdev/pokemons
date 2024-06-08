///  The type of screen based on the shortest side of the device.
enum ScreenType {
  /// If the shortest side is less than 600.
  small,

  /// If the shortest side is less than 1200.
  medium,

  /// If the shortest side is greater than or equal to 1200.
  large,
}
