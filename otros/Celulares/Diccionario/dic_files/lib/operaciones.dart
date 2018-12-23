import 'dart:async';
import 'dart:io';

void creaDirectorio(nombre){

  new Directory('$nombre').create(recursive: true)
  // The created directory is returned as a Future.
      .then((Directory directory) {
       print(directory.path);
  });


}


void recorreDirectorio(){
  var systemTempDir = Directory.systemTemp;

  // List directory contents, recursing into sub-directories, but not following
  // symbolic links.
  systemTempDir.list(recursive: true, followLinks: false)
      .listen((FileSystemEntity entity) {
    print(entity.path);
  });
}