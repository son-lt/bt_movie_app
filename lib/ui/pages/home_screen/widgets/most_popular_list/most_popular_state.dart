part of 'most_popular_cubit.dart';

class MostPopularState extends Equatable {
  final int listLength;
  final int currentPage;
  final MovieListEntity? data;
  final LoadStatus loadStatus;

  const MostPopularState({
    this.listLength = AppConfigs.listLength,
    this.currentPage = 0,
    this.data,
    this.loadStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
        listLength,
        currentPage,
        data,
        loadStatus,
      ];

  MostPopularState copyWith({
    int? listLength,
    int? currentPage,
    MovieListEntity? data,
    LoadStatus? loadStatus,
  }) {
    return MostPopularState(
      listLength: listLength ?? this.listLength,
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}
