/// Support for doing something awesome.
///
/// More dartdocs go here.
library boring_avatars;

import 'package:collection/collection.dart';
import 'src/avatar_bauhaus.dart';
import 'src/avatar_beam.dart';
import 'src/avatar_marble.dart';
import 'src/avatar_pixel.dart';
import 'src/avatar_ring.dart';
import 'src/avatar_sunset.dart';

const _defaultColors = ["#A3A948", "#EDB92E", "#F85931", "#CE1836", "#009989"];

enum BoringAvatarType {
  marble,
  beam,
  pixel,
  sunset,
  bauhaus,
  ring,
}

class BoringAvatarStyle extends Object {
  final BoringAvatarType type;
  final List<String> colors;
  final int size;
  final bool square;
  const BoringAvatarStyle(
      {this.type = BoringAvatarType.marble,
      this.colors = _defaultColors,
      this.size = 60,
      this.square = false});

  BoringAvatarStyle copyWith(
      {BoringAvatarType? type, List<String>? colors, int? size, bool? square}) {
    return BoringAvatarStyle(
        type: type ?? this.type,
        colors: colors ?? this.colors,
        size: size ?? this.size,
        square: square ?? this.square);
  }

  @override
  bool operator ==(Object other) =>
      other is BoringAvatarStyle &&
      type == other.type &&
      size == other.size &&
      square == other.square &&
      ListEquality().equals(colors, other.colors);

  @override
  int get hashCode => Object.hashAll([type, size, square, ...colors]);
}

class BoringAvatars {
  final BoringAvatarStyle style;
  final String name;
  const BoringAvatars(this.name, {this.style = const BoringAvatarStyle()});
  String get svg {
    switch (style.type) {
      case BoringAvatarType.bauhaus:
        return avatarBauhaus(name, style.colors,
            size: style.size, square: style.square);
      case BoringAvatarType.marble:
        return avatarMarble(name, style.colors,
            size: style.size, square: style.square);
      case BoringAvatarType.beam:
        return avatarBeam(name, style.colors,
            size: style.size, square: style.square);
      case BoringAvatarType.pixel:
        return avatarPixel(name, style.colors,
            size: style.size, square: style.square);
      case BoringAvatarType.ring:
        return avatarRing(name, style.colors,
            size: style.size, square: style.square);
      case BoringAvatarType.sunset:
        return avatarSunset(name, style.colors,
            size: style.size, square: style.square);
    }
  }

  @override
  String toString() => svg;

  @override
  bool operator ==(Object other) =>
      other is BoringAvatars && name == other.name && style == other.style;

  @override
  int get hashCode => Object.hash(name, style);
}
