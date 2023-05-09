import 'package:hcm23_03/shared/app_singletons.dart';
import 'package:mockito/mockito.dart';

class MockNetworkSingleton extends Mock implements NetworkSingleton {}

main() {
  MockNetworkSingleton mockNetworkSingleton = MockNetworkSingleton();
  // group("Test loading", () {
  //   test("Test loading", () {
  //     when(mockNetworkSingleton.isShowingLoading).thenReturn(true);
  //     verify(mockNetworkSingleton.isShowingLoading);
  //     final result = mockNetworkSingleton.isShowingLoading;
  //     expect(result, true);
  //   });
  //   test("Test off loading", () {
  //     when(mockNetworkSingleton.isShowingLoading).thenReturn(false);
  //     verify(mockNetworkSingleton.isShowingLoading);
  //     final result = mockNetworkSingleton.isShowingLoading;
  //     expect(result, true);
  //   });
  // });
}
