extension ListX<T> on List<T> {
  List<T> swap(T e1, T e2) => [...this]
    ..[indexOf(e1)] = e2
    ..[indexOf(e2)] = e1;
}
