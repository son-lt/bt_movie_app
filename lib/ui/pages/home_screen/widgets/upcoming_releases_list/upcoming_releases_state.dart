part of 'upcoming_releases_cubit.dart';

class UpcomingReleasesState extends Equatable {
  final int listLength;
  final int currentPage;
  final MovieListEntity? data;
  final LoadStatus loadStatus;

  const UpcomingReleasesState({
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

  UpcomingReleasesState copyWith({
    int? listLength,
    int? currentPage,
    MovieListEntity? data,
    LoadStatus? loadStatus,
  }) {
    return UpcomingReleasesState(
      listLength: listLength ?? this.listLength,
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}
