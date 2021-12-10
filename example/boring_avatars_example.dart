import 'package:boring_avatars/boring_avatars.dart';

void main() {
  final avatar = BoringAvatars('hello world');
  print(avatar);

  print(BoringAvatars('hello world') ==
      BoringAvatars('hello world', style: BoringAvatarStyle(size: 60)));
}
