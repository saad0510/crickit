import 'dart:async';

Stream<List<T>> combineListStreams<T>(List<Stream<T>> streams) {
  final controller = StreamController<List<T>>();
  final Set<Stream<T>> activeStreams = {};
  final Map<Stream<T>, T> lastValues = {};
  final List<StreamSubscription> subscriptions = [];

  for (final stream in streams) {
    activeStreams.add(stream);

    final subscription = stream.listen(
      (val) {
        lastValues[stream] = val;
        controller.add(
          List.from(lastValues.values),
        );
      },
      onDone: () {
        activeStreams.remove(stream);
        if (activeStreams.isEmpty) controller.close();
      },
    );
    subscriptions.add(subscription);
  }
  controller.onCancel = () {
    for (var subscription in subscriptions) {
      subscription.cancel();
    }
  };
  return controller.stream;
}
