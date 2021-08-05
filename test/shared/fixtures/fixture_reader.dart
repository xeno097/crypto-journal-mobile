import 'dart:io';

String fixtureReader(String name) =>
    File('test/shared/fixtures/$name').readAsStringSync();
