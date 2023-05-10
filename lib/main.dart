// Đặt tên biến
// Comment
// Main entryPoint

// Constants in dart
/*
Trong Dart, từ khóa "const" được sử dụng để khai báo các giá trị hằng số.
Các hằng số này được xác định và tính toán trong thời gian biên dịch
(compile-time), và giá trị của chúng không thay đổi trong quá trình chạy
(runtime) của chương trình.

Việc sử dụng "const" có các lợi ích sau:
Hiệu suất tốt: Vì các giá trị const được tính toán trong thời gian biên dịch,
chúng đã được giải quyết trước khi chạy chương trình. Điều này giúp cải thiện
hiệu suất và tăng tốc độ thực thi của chương trình.
Tối ưu hóa bộ nhớ: Các giá trị const được lưu trữ trong một bộ nhớ chỉ đọc
(read-only memory) và được chia sẻ giữa các phiên bản của chúng. Điều này giảm
thiểu việc cấp phát bộ nhớ và giúp tiết kiệm tài nguyên hệ thống.
Sử dụng trong so sánh: Các giá trị const có thể được sử dụng trong các phép so
sánh để kiểm tra tính đồng nhất của các đối tượng. Bởi vì các giá trị const được 
tính toán trong thời gian biên dịch, việc so sánh chúng sẽ hiệu quả và không 
tốn thời gian thực thi trong quá trình chạy chương trình.
Các giá trị const trong Dart được lưu trữ trong bộ nhớ chỉ đọc
(read-only memory), được gọi là "constant pool". Điều này giúp chúng được
truy cập một cách nhanh chóng và chia sẻ giữa các đối tượng trong chương trình.

Constant pool trong Dart được lưu trữ trong vùng bộ nhớ chỉ đọc
(read-only memory) của chương trình. Thông thường, constant pool nằm trong phần 
mã thực thi (executable code) của chương trình, chính xác là trong phần mã máy 
(machine code) đã được tạo ra từ mã nguồn Dart.
Khi chương trình được thực thi, constant pool sẽ được tải vào bộ nhớ chỉ đọc, 
và các giá trị const sẽ được truy cập từ đó. Vùng bộ nhớ chỉ đọc là một vùng bộ 
nhớ không thể thay đổi trong quá trình chạy chương trình, nghĩa là giá trị của 
các hằng số không thể thay đổi.
Việc lưu trữ constant pool trong bộ nhớ chỉ đọc giúp tiết kiệm tài nguyên bộ 
nhớ và tăng tốc độ thực thi chương trình, vì các giá trị const đã được giải 
quyết và tính toán trước khi chương trình chạy. Đồng thời, constant pool cũng 
cho phép chia sẻ các giá trị const giữa các đối tượng trong chương trình, giảm 
thiểu việc cấp phát bộ nhớ lại cho các giá trị const tương tự.

Trong Dart, constant pool không cố định nằm ở một segment cụ thể trên RAM. Việc 
lưu trữ constant pool và các giá trị const được quản lý bởi máy ảo Dart 
(Dart Virtual Machine) hoặc bộ biên dịch Dart (Dart Compiler) và phụ thuộc vào 
cài đặt cụ thể của nền tảng chạy.
Thông thường, constant pool và các giá trị const được lưu trữ trong các vùng 
bộ nhớ chỉ đọc (read-only memory) hoặc trong phần mã thực thi của chương trình. 
Các thông tin chi tiết về cách bộ nhớ được quản lý và phân phối trong một hệ 
thống Dart cụ thể sẽ khác nhau tùy thuộc vào nền tảng và triển khai cụ thể.
Vì vậy, không có một segment cụ thể trên RAM được chỉ định cho constant pool 
trong Dart. Nó có thể được lưu trữ trong các vùng nhớ chỉ đọc khác nhau, tùy 
thuộc vào triển khai của Dart trên từng nền tảng và hệ điều hành cụ thể.

Từ khóa "const" trong Dart tương đương với các ngôn ngữ lập trình khác như 
Java, C++, hoặc C# với các khái niệm tương tự như "const" hoặc "final". 
Tuy nhiên, có một số khác biệt nhỏ giữa cách Dart xử lý hằng số và cách các 
ngôn ngữ khác xử lý chúng. Dưới đây là một số điểm khác nhau chính:

- Thời gian biên dịch và thời gian chạy:
  Trong Dart, từ khóa "const" được sử dụng để khai báo các giá trị hằng số tính 
  toán trong thời gian biên dịch.
  Trong một số ngôn ngữ khác, như C++, Java, hoặc C#, từ khóa "const" được sử 
  dụng để khai báo các giá trị hằng số đã được biết trong thời gian biên dịch.

- Vị trí lưu trữ:
  Trong Dart, constant pool và các giá trị const được lưu trữ trong bộ nhớ chỉ 
  đọc (read-only memory).
  Trong một số ngôn ngữ khác, như Java, C++, hoặc C#, các giá trị hằng số 
  thường được lưu trữ trong vùng bộ nhớ chỉ đọc hoặc trong vùng bộ nhớ dữ liệu 
  tĩnh.

- Quyền truy cập và phạm vi:
  Trong Dart, các giá trị const có thể được truy cập từ bất kỳ nơi nào trong 
  phạm vi chương trình.
  Trong một số ngôn ngữ khác, quyền truy cập và phạm vi của các hằng số có thể 
  được quy định rõ ràng, ví dụ như từ khóa "public", "private" hoặc "protected".

Lưu ý rằng các khái niệm về hằng số có thể có sự khác nhau chi tiết giữa các 
ngôn ngữ lập trình khác nhau. Điều này phụ thuộc vào ngữ cảnh và cú pháp của 
mỗi ngôn ngữ cụ thể.
*/

/*
Trong Dart, có hai cách để thực hiện vòng lặp: for-loop và for-in. Dưới đây là 
sự khác nhau giữa hai loại vòng lặp này:

For-loop (vòng lặp for):
For-loop được sử dụng để lặp qua một khoảng giá trị hoặc một danh sách cụ thể.
Cú pháp: for (initializer; condition; increment) { /* statements */ }
Thông qua việc chỉ định biểu thức khởi tạo (initializer), điều kiện kiểm tra 
(condition) và biểu thức tăng/giảm (increment), ta có thể điều khiển cách vòng 
lặp hoạt động.
Ví dụ:
dart
Copy code
for (int i = 0; i < 5; i++) {
  print(i);
}
- For-in (vòng lặp for-in):
  For-in được sử dụng để lặp qua các phần tử của một danh sách, một mảng hoặc 
một đối tượng có khả năng lặp lại (iterable).
  Cú pháp: for (var element in iterable) { /* statements */ }
  Trong vòng lặp này, mỗi phần tử trong iterable được gán cho biến "element", và 
các câu lệnh trong khối vòng lặp được thực thi cho mỗi phần tử.
Ví dụ:
var numbers = [1, 2, 3, 4, 5];
for (var number in numbers) {
  print(number);
}
- Sự khác nhau chính giữa for-loop và for-in là:

  For-loop cho phép kiểm soát chính xác các yếu tố như khởi tạo, điều kiện kiểm 
tra và tăng/giảm, cho phép lặp qua một khoảng giá trị cụ thể.
  For-in làm việc với các iterable và cung cấp một cách tiện lợi để lặp qua các 
phần tử trong danh sách, mảng hoặc đối tượng có khả năng lặp lại.
  Lựa chọn sử dụng for-loop hoặc for-in phụ thuộc vào yêu cầu cụ thể của vấn đề 
và loại dữ liệu mà bạn muốn lặp qua.

*/
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
