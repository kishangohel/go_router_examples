import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

part 'page3_state.dart';

class Page3Cubit extends Cubit<Page3State> {
  Page3Cubit() : super(Page3State(counter: 0));

  late final ScrollController scrollController = ScrollController();
  late final PageStorageKey<String> pageStorageKey = const PageStorageKey('Page3Storage');

  void increaseCounter() => emit(state.copyWith(counter: state.counter + 1));

  @override
  Future<void> close() {
    Logger().i('Closing...');
    return super.close();
  }
}
