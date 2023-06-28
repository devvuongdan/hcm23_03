import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);

//   void increment() => emit(state + 1);

//   void decrement() => emit(state - 1);
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Counter App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => CounterCubit(),
//         child: const MyHomePage(),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final counterCubit = BlocProvider.of<CounterCubit>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             BlocBuilder<CounterCubit, int>(
//               builder: (context, count) {
//                 return Text(
//                   'Count: $count',
//                   style: Theme.of(context).textTheme.headline4,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               counterCubit.increment();
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               counterCubit.decrement();
//             },
//             tooltip: 'Decrement',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void addCard() => emit(state + 1);

  void removeCard() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Card'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, count) {
                return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Product ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubit.addCard();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              counterCubit.removeCard();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
