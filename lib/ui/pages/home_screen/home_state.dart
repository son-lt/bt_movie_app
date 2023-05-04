part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int currentPage;

  const HomeState({this.currentPage = 0});

  @override
  List<Object?> get props => [
        currentPage,
      ];

  HomeState copyWith({int? currentPage}) {
    return HomeState(currentPage: currentPage ?? this.currentPage);
  }
}
