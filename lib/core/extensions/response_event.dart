import '../api_helper/api_response.dart';

extension ToResponseEvent on ApiResponse {
  toInitial() {
    status = Status.initial;
  }

  toLoading() {
    status = Status.initial;
  }

  bool isError() {
    return status == Status.error;
  }

  bool isNotError() {
    return status != Status.error;
  }

  bool isCompleted() {
    return status == Status.completed;
  }

  bool isNotCompleted() {
    return status != Status.completed;
  }

  bool isLoading() {
    return status == Status.loading;
  }

  bool isNotLoading() {
    return status != Status.loading;
  }
}
