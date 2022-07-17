import 'dart:io';
import 'dart:isolate' as iso;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()..get('/', _rootHandler);

// handlers
Response _rootHandler(Request req) {
  return Response.ok('Hello, World!');
}

/// Similar with the previous example but here we create the routing in our new class 'Service' and we call its handler.
Future<void> onIsolateMain(message) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // setup the router
  final _handler = Pipeline().addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final server = await shelf_io.serve(_handler, ip, 8080, shared: true);
  print('Server listening on port ${server.port}');
}

Future<void> main() async {
  print('Spinning up isolates');

  spawnOffIsolates(3);

  print('press any key to exit');
  stdin.readByteSync();
}

void spawnOffIsolates(int numIsolates) {
  // spawn off isolates
  for (int i = 0; i < numIsolates; i++) {
    iso.Isolate.spawn(onIsolateMain, "$i");
  }
}
