import 'package:bloc/bloc.dart';

/// A `CounterCubit` which manages an `int` as its state.
class CounterModel extends Cubit<int> {
  /// The initial state of the `CounterCubit` is 0.
  CounterModel() : super(0);

  /// When increment is called, the current state
  /// of the cubit is accessed via `state` and
  /// a new `state` is emitted via `emit`.
  void increment() => emit(state + 1);

  Future<void> decrement() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
