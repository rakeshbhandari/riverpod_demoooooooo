import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo001/screens/future_provider_page.dart';

//greetingProvider provides the value
final greetingProvider = Provider((ref) => 'hello riverpod!');
final numberProvider = StateProvider<int>((ref) => 10);

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);

    final number = ref.watch(numberProvider);

    ref.listen<int>(numberProvider, (prev, next) {
      if (next == 14) {
        // print('$next was changed from previous state of $prev');
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Congratulations! You reached 14")));
      } else if (next == 0) {
        // print('$next was changed from previous state of $prev');
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Congratulations! You reached 0.")));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //multiple ways to use provider , can use the final value or another way
          Text('The value is $greeting'),
          Text('This is ${ref.watch(greetingProvider)}'),
          ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state++;
              },
              child: const Text('increment')),
          ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state--;
              },
              child: const Text('decrement')),
          ElevatedButton(
              onPressed: () {
                ref.invalidate(numberProvider);
              },
              child: const Text('refresh')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FutureProviderPage()),
                );
              },
              child: const Text('fetching data')),
          Text('the value is $number.', style: const TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
