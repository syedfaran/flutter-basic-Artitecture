enum NotifierState { initial, loading, loaded }

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}