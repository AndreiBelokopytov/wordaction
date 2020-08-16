extension ListUtils<T> on List<T> {
  List<T> distinct() {
    return toSet().toList();
  }
}
