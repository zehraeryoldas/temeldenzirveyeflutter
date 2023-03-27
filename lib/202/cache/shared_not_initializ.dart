class SharedNotInitializeException implements Exception {
  //bunları extends edemiyoruz çümkü birebir aynısı olmasını istiyoruz.
  @override
  String toString() {
    // TODO: implement toString
    return 'Your preferences has not initialized right now';
  }
}
