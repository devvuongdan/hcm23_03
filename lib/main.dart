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

void main() {
  runApp(const MyApp());
}
//========================== BLOC with EVENT ================================
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider<_CounterBloc>(
//         create: (context) => _CounterBloc(),
//         child: const MyHomePage(title: "My Remote"),
//       ),
//     );
//   }
// }
// abstract class CounterEvent {}

// class Increment extends CounterEvent {}

// class Decrement extends CounterEvent {}

// class Mute extends CounterEvent {}

// class _CounterBloc extends Bloc<CounterEvent, int> {
//   _CounterBloc() : super(50) {
//     on<Increment>((event, emit) => emit(state + 1));
//     on<Decrement>((event, emit) => emit(state - 1));
//     on<Mute>((event, emit) => emit(0));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
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
//             BlocBuilder<_CounterBloc, int>(builder: (context, count) {
//               return Text(
//                 'Current volumn value is $count',
//                 style: Theme.of(context).textTheme.headline5,
//               );
//             })
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 counterBloc.add(Increment());
//               },
//               tooltip: 'Increment',
//               child: const Icon(Icons.volume_up_rounded),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 counterBloc.add(Decrement());
//               },
//               tooltip: 'Decrement',
//               child: const Icon(Icons.volume_down),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 counterBloc.add(Mute());
//               },
//               tooltip: 'Mute',
//               child: const Icon(Icons.volume_off_rounded),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//========================= CUBIT =======================
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increase() => emit(state + 1);
  void decrease() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App using Cubit"),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) => Center(
          // child: Text(
          //   "$state",
          //   style: Theme.of(context).textTheme.headline1,
          // ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: ((context, state) {
                return Container(
                    margin: EdgeInsets.only(bottom: 8),
                    height: 60,
                    width: double.infinity,
                    color: Color.fromARGB(255, 227, 196, 196),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Product $state",
                          style: Theme.of(context).textTheme.headline6),
                    ));
              }),
              itemCount: state,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increase();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().decrease();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
