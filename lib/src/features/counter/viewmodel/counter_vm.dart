import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_vm.g.dart';

@Riverpod(keepAlive: true)
class CounterViewModel extends _$CounterViewModel {
  @override
  int build() {
    return 0;
  }

  void increment() {  
    state++;
  }
}