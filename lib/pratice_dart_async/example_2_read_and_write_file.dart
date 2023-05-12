import 'dart:io';

// Future<void> main() async {
//   final File file = File("lib/pratice_dart_async/example.json");
//   final String fileString = file.readAsStringSync();
//   print(fileString);
//   final String newString = fileString.replaceAll("AT", "HCM23");
//   final File newFile = File("lib/pratice_dart_async/example2.json");
// }

void main() async {
  const data = 'Hello, world!';
  await writeFile('lib/pratice_dart_async/example2output.txt', data);
  print('Data written to file.');
}

Future<void> writeFile(String path, String data) async {
  final file = File(path);
  await file.writeAsString(data);
}
