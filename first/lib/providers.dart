
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataState {         // State class to hold all data-related fields
  final List<String> data;
  final bool isLoading;
  final bool isLoadingDown;
  final bool isLoadingUP;
  DataState({
    this.data = const [],
    this.isLoading = true,
    this.isLoadingDown = false,
    this.isLoadingUP = false,
  });
  DataState copyWith({
    List<String>? data,
    bool? isLoading,
    bool? isLoadingDown,
    bool? isLoadingUP,
  }) {
    return DataState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      isLoadingDown: isLoadingDown ?? this.isLoadingDown,
      isLoadingUP: isLoadingUP?? this.isLoadingUP,
    );
  }
}
class DataNotifier extends StateNotifier<DataState> { //data matching
  DataNotifier() : super(DataState()) {
    fetchInitialData();
  }

  final int minItem = 1;
  final int maxItem = 2000;

  Future<void> fetchInitialData() async {
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(
      data: List.generate(20, (index) => 'Item ${index+1}'),
      isLoading: false,
    );
  }

  Future<void> fetchDataDown() async {
    if (state.isLoadingDown || (state.data.isNotEmpty && state.data.length >= maxItem))
        return;

    state = state.copyWith(isLoadingDown:true);

    await Future.delayed(Duration(seconds: 2));
    final currentMax = state.data.length;
    final end = (currentMax + 10 > maxItem) ? maxItem : currentMax + 10;

    state = state.copyWith(
      data: [
        ...state.data,
        ...List.generate(end - currentMax, (index) => 'Item ${currentMax + index + 1}')
      ],
      isLoadingDown: false,
    );
  }

  Future<void> fetchDataUp() async {
    if (state.isLoadingUP|| (state.data.isNotEmpty && int.parse(state.data.first.split(' ').last) <= minItem)) return;
    state = state.copyWith(isLoadingUP: true);
    await Future.delayed(Duration(seconds: 2));
    final currentMin = int.parse(state.data.first.split(' ').last);
    final start = (currentMin - 10 < minItem) ? minItem : currentMin - 10;
    state = state.copyWith(
      data: [
        ...List.generate(currentMin - start, (index) => 'Item ${start + index}'),
        ...state.data,
      ],
      isLoadingUP: false,
    );
  }
}
final dataProvider = StateNotifierProvider<DataNotifier, DataState>((ref) {
  return DataNotifier();
});

final searchProvider = StateProvider<String>((ref) => '');
