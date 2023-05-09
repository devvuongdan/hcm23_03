// import 'package:hcm23_03/shared/app_singletons.dart';

// Future<T?> localInterceptor<T>(
//   Future<T>? function, {
//   bool isShowloading = true,
//   void Function(T)? onSuccess,
//   void Function()? onFailure,
// }) async {
//   try {
//     if (isShowloading && !NetworkSingletonImpl.shared.isShowingLoading$) {
//       // Todo: Implemement show loading
//       NetworkSingletonImpl.shared.isLoading = true;
//     }
//     final result = await function;

//     if (isShowloading && !NetworkSingletonImpl.shared.isShowingLoading$) {
//       // Todo: Implemement hide loading
//       NetworkSingletonImpl.shared.isLoading = false;
//     }
//     if (result != null) {
//       onSuccess?.call(result);
//     }

//     return result;
//   } catch (e) {
//     if (isShowloading && !NetworkSingletonImpl.shared.isShowingLoading$) {
//       // Todo: Implemement hide loading
//       NetworkSingletonImpl.shared.isLoading = false;
//     }
//     onFailure?.call();

//     return null;
//   }
// }
