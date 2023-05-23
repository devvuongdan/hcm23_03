// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState {
  final int currentPage;
  final List<Task> tasks;
  const HomeState({
    required this.currentPage,
    required this.tasks,
  });

  HomeState copyWith({
    int? currentPage,
    List<Task>? tasks,
  }) {
    return HomeState(
      currentPage: currentPage ?? this.currentPage,
      tasks: tasks ?? this.tasks,
    );
  }
}
