class ApiResponse<T> {
  late Status status;
  late T data;
  dynamic message;
  StackTrace? stackTrace;

  ApiResponse.initial(this.message) : status = Status.initial;

  ApiResponse.loading(this.message) : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;
  /// teken düsmüsse
  // ApiResponse.error(this.message, this.stackTrace) : status = Status.error {
    // if (message is UnauthorisedException&&Constants.tokenIsInvalid==false) {
    //
    //   Get.offAll(SessionTimeoutPage());
    //
    //   print("UnauthorisedException yakalandı: ${message}");
    // }
    //
    // FirebaseCrashlytics.instance.recordError(this.message, this.stackTrace);
  // }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, completed, error, initial }
