class FileDownloadException implements Exception {
  //exceptionu kendimize göre özelleştirmiş olduk.
  @override
  String toString() {
    // TODO: implement toString
    return 'File download has failed!';
  }
}
