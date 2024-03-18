import 'dart:async';

import '../models/queue_model.dart';

class QueueProvider {
  final _queueList = <QueueModel>[];

  void add({
    required Future<void> Function() callback,
  }) {
    final queueModel = QueueModel(
      completer: Completer(),
      action: callback,
    );
    if (_queueList.isEmpty) {
      _startAction(queueModel);
    }
    _queueList.add(queueModel);
  }

  Future<void> _startAction(QueueModel queueModel) async {
    await queueModel.action();
    queueModel.completer.complete();
    _queueList.removeWhere((e) => e.completer.isCompleted);
    if (_queueList.isNotEmpty) {
      _startAction(_queueList.first);
    }
  }
}
