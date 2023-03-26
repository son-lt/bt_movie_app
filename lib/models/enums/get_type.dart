enum GetType {
  popular,
  upcoming,
  credits,
}

extension GetTypeExtension on GetType {
  String get type {
    switch (this) {
      case GetType.popular:
        return 'popular';
      case GetType.upcoming:
        return 'upcoming';
      case GetType.credits:
        return 'credits';
    }
  }
}
