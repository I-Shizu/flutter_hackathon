import 'package:uuid/uuid.dart';

String returnUuidV4() {
  const Uuid uuid = Uuid();
  return uuid.v4();
}
