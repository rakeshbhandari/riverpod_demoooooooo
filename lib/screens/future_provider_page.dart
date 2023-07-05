import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo001/model/api_model.dart';
import 'package:riverpod_demo001/services/api_service.dart';
import 'package:riverpod_demo001/widgets/card_widget.dart';

final suggestionfutureProvider =
    FutureProvider.autoDispose<Suggestion>((ref) async {
  final ApiService = ref.watch(apiserviceProvider);
  return ApiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionfutureProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider ho hai'),
        ),
        body: Center(
            child: suggestionRef.when(
          data: (data) {
            return cardWidget(data);
          },
          error: (error, _) {
            return Text(error.toString());
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        )));
  }
}
