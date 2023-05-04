part of 'detail_cubit.dart';

class DetailState extends Equatable {
  final LoadStatus loadStatus;
  final MovieEntity? movieData;
  final CastListEntity? castListData;

  const DetailState({
    this.loadStatus = LoadStatus.initial,
    this.movieData,
    this.castListData,
  });

  @override
  List<Object?> get props => [
        loadStatus,
        movieData,
        castListData,
      ];

  DetailState copyWith({
    LoadStatus? loadStatus,
    MovieEntity? movieData,
    CastListEntity? castListData,
  }) {
    return DetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      movieData: movieData ?? this.movieData,
      castListData: castListData ?? this.castListData,
    );
  }
}
