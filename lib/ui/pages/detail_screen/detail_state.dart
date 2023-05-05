part of 'detail_cubit.dart';

class DetailState extends Equatable {
  final LoadStatus loadStatus;
  final MovieEntity? movieData;
  final CastListEntity? castListData;
  final int listLength;
  final bool isShow;

  const DetailState({
    this.loadStatus = LoadStatus.initial,
    this.movieData,
    this.castListData,
    this.listLength = 5,
    this.isShow = false,
  });

  @override
  List<Object?> get props => [
        loadStatus,
        movieData,
        castListData,
        listLength,
        isShow,
      ];

  DetailState copyWith({
    LoadStatus? loadStatus,
    MovieEntity? movieData,
    CastListEntity? castListData,
    int? listLength,
    bool? isShow,
  }) {
    return DetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      movieData: movieData ?? this.movieData,
      castListData: castListData ?? this.castListData,
      listLength: listLength ?? this.listLength,
      isShow: isShow ?? this.isShow,
    );
  }
}
