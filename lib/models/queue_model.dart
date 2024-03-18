import 'dart:async';

class QueueModel {
  final Completer completer;
  final Future<void> Function() action;

  QueueModel({
    required this.completer,
    required this.action,
  });
}