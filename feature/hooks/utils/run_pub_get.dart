import 'dart:io';

import 'package:mason/mason.dart';

import 'logs/print_section.dart';

Future<double> runPubGet(Logger logger, Directory dir) async {
  printSectionHeader(logger, '📦 Step 1: Running `flutter pub get`');

  final sw = Stopwatch()..start();
  final result = await Process.run('flutter', [
    'pub',
    'get',
  ], workingDirectory: dir.path);

  stdout.write(result.stdout);
  stderr.write(result.stderr);

  final elapsed = sw.elapsed.inMilliseconds / 1000;
  return elapsed;
}
