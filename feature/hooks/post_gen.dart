import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

import 'utils/add_dependency.dart';
import 'utils/inject_to_config.dart';
import 'utils/run_build_runner.dart';
import 'utils/run_pub_get.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final name = context.vars['name'] as String;
  final targetDir = Directory(p.join(Directory.current.path, name));

  final stopwatch = Stopwatch()..start();
  logger.success('\n🚀 Post-generation Hook Started');

  await addCoreDependencyIfMissing(logger, targetDir);

  final pubGetTime = await runPubGet(logger, targetDir);
  final buildRunnerTime = await runBuildRunner(logger, targetDir);

  await injectIntoConfigFeature(logger, name, targetDir);

  logger
    ..info('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━')
    ..info('All Process Completed')
    ..info('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━')
    ..info('\n📦 pub get: ${pubGetTime}s')
    ..info('⚙️  build_runner: ${buildRunnerTime}s')
    ..success('✅ Completed in ${stopwatch.elapsed.inMilliseconds / 1000}s');
}
