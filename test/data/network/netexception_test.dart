import 'package:flutter_test/flutter_test.dart';
import 'package:marvelous/data/network/net_exception.dart';

void main() {
  group('NetExceptionType tests', _netExceptionTypeTests);
  group('NetException tests', _netExceptionTests);
}

void _netExceptionTypeTests() {
  test(
    'Create generic type',
    () => expect(
      NetExceptionType.from('Tests'),
      NetExceptionType.generic,
    ),
  );

  test(
    'Create invalid credentials type',
    () => expect(
      NetExceptionType.from('InvalidCredentials'),
      NetExceptionType.invalidCredentials,
    ),
  );

  test(
    'Trims code before testing',
    () => expect(
      NetExceptionType.from('   InvalidCredentials      '),
      NetExceptionType.invalidCredentials,
    ),
  );
}

void _netExceptionTests() {
  test(
    'Creates default exception',
    () => expect(
      const NetException(),
      const NetException(
        type: NetExceptionType.generic,
        code: '',
        message: '',
      ),
    ),
  );

  test(
    'Creates generic exception from code with default message',
    () {
      final exception = NetException.from(code: 'Generic code');

      expect(exception.type, NetExceptionType.generic);
      expect(exception.code, 'Generic code');
      expect(exception.message, '');
    },
  );

  test(
    'Creates generic exception from code with given message',
    () {
      final exception = NetException.from(
        code: 'Generic code 2',
        message: 'Hey',
      );

      expect(exception.type, NetExceptionType.generic);
      expect(exception.code, 'Generic code 2');
      expect(exception.message, 'Hey');
    },
  );

  test(
    'Creates invalid credentials exception from code',
    () {
      final exception = NetException.from(
        code: 'InvalidCredentials',
        message: 'The passed API key is invalid.',
      );

      expect(exception.type, NetExceptionType.invalidCredentials);
      expect(exception.code, 'InvalidCredentials');
      expect(exception.message, 'The passed API key is invalid.');
    },
  );
}
