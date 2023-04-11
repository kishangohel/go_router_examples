part of 'page3_cubit.dart';

class Page3State {
  final int counter;

  Page3State({required this.counter});

  Page3State copyWith({
    int? counter,
  }) {
    return Page3State(
      counter: counter ?? this.counter,
    );
  }
}
