import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:async';
import 'dart:isolate';
import 'package:archive/archive_io.dart';

class ZipService {
  Isolate _isolate;
  SendPort _sendPort;

  Completer<File> _zipFileCompleter;
  Completer<void> _unzipFileCompleter;

  final _isolateReady = Completer<void>();

  Future<void> get isReady => _isolateReady.future;

  Future<void> _init() async {
    final receivePort = ReceivePort();
    final errorPort = ReceivePort();

    errorPort.listen(print);

    receivePort.listen(_handleMessage);
    _isolate = await Isolate.spawn(
      _isolateEntry,
      receivePort.sendPort,
      onError: errorPort.sendPort,
    );
  }

  void dispose() {
    assert(_isolate != null);
    _isolate.kill();
  }

  // Envia uma mensagem para a thread secundária pra ela
  // criar o arquivo zip
  Future<File> createZipFile(String filename, List<File> files) async {
    await _init();

    _zipFileCompleter = Completer<File>();
    _sendPort.send({'filename': filename, 'files': files});

    final result = await _zipFileCompleter.future;

    dispose();

    return result;
  }

  Future<void> unzipFile(File file) async {
    await _init();

    _unzipFileCompleter = Completer<void>();
    _sendPort.send(file);

    await _unzipFileCompleter.future;

    dispose();
  }

  void _handleMessage(dynamic message) {
    if (message is SendPort) {
      _sendPort = message;
      _isolateReady.complete();
      return;
    }

    // Se for um arquivo então o processo de zipagem foi concluído
    if (message is File) {
      _zipFileCompleter.complete(message);
    }

    // Se for string e o valor for unzipEvent então o evento de está completo
    if (message is String && message == 'unzipEvent') {
      _unzipFileCompleter.complete();
    }
  }

  static void _isolateEntry(dynamic message) {
    SendPort sendPort;
    final receivePort = ReceivePort();

    receivePort.listen((dynamic message) async {
      try {
        if (message is Map<String, dynamic>) {
          File zipFile = _zipFiles(message['filename'], message['files']);
          sendPort.send(zipFile);
          return;
        }

        if (message is File) {
          await _unzipFiles(message);
          sendPort.send("unzipEvent");
        }
      } catch (e) {
        print(e);
      }
    });

    // Se for uma porta de envio então é a minha main thread inicializando
    // e enviando a sua SendPort para que a outra thread possa enviar mensagens
    // pra ela. É necessário que a outra thread envie a sua SendPort também para
    // que a main thread possa enviar mensagens.
    if (message is SendPort) {
      sendPort = message;
      sendPort.send(receivePort.sendPort);
      return;
    }
  }

  static Future<void> _unzipFiles(File file) async {
    assert(file != null);
    final archive = ZipDecoder().decodeBytes((await file.readAsBytes()));

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File('/storage/emulated/0/JubJub/Files/$filename')
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory('/storage/emulated/0/JubJub/Files/$filename')
          ..createSync(recursive: true);
      }
    }
  }

  static File _zipFiles(String filename, List<File> files) {
    assert(filename != null);
    assert(files != null);
    assert(files.length > 0);

    final encoder = ZipFileEncoder();
    encoder.create(filename);
    files.forEach(encoder.addFile);
    encoder.close();

    return File(filename);
  }
}
