// import 'package:flutter/material.dart';

// import 'app.dart';
// import 'features/authentication/data/resource/sqlite_helper.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hcm23DBHelper.init();
//   runApp(
//     const MyApp(),
//   );
// }

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const StateManagement());
// }

// abstract class CounterEvent {}

// class Increment extends CounterEvent {}

// class _CounterBloc extends Bloc<CounterEvent, int> {
//   _CounterBloc() : super(0) {
//     on<Increment>(((event, emit) => emit(state + 1)));
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//       // home: BlocProvider<_CounterBloc>(
//       //   create: (context) => _CounterBloc(),
//       //   child: const MyHomePage(title: 'State Management using Bloc'),
//       // ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     // setState(() {
//     //   _counter++;
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final counterBloc = BlocProvider.of<_CounterBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocBuilder<_CounterBloc, int>(builder: (context, counter) {
//               return Text(
//                 '$counter',
//                 style: Theme.of(context).textTheme.headline4,
//               );
//             })
//             // const Text(
//             //   'You have pushed the button this many times:',
//             // ),
//             // Text(
//             //   '$_counter',
//             //   style: Theme.of(context).textTheme.headline4,
//             // ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // onPressed: _incrementCounter,
//         onPressed: () {
//           counterBloc.add(Increment());
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class StateManagement extends StatelessWidget {
//   const StateManagement({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider<_CounterBloc>(
//         create: (context) => _CounterBloc(),
//         child: const MyHomePage(title: 'State Management using Bloc'),
//       ),
//     );
//   }
// }

void main() {
  runApp(const StateManagement());
}

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class Mute extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(50) {
    on<Increment>((event, emit) {
      emit(state + 1);
    });

    on<Decrement>((event, emit) {
      emit(state - 1);
    });

    on<Mute>((event, emit) {
      emit(0);
    });
  }
}

class StateManagement extends StatelessWidget {
  const StateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const RemoteControl(),
      ),
    );
  }
}

class RemoteControl extends StatelessWidget {
  const RemoteControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Remote Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, int>(
              builder: (context, count) {
                return Text(
                  'Volume Level: $count',
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(Decrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            width: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(Mute());
            },
            tooltip: 'Mute',
            child: const Icon(Icons.volume_mute),
          ),
        ],
      ),
    );
  }
}
