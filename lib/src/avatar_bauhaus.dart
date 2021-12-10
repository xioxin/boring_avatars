// ignore_for_file: constant_identifier_names

import './utilities.dart';

const _ELEMENTS = 4;
const _SIZE = 80;

class _AvatarBauhausData {
  String color;
  int translateX;
  int translateY;
  int rotate;
  bool isSquare;
  _AvatarBauhausData({
    required this.color,
    required this.translateX,
    required this.translateY,
    required this.rotate,
    required this.isSquare,
  });
}

List<_AvatarBauhausData> _generateColors(String name, List<String> colors) {
  assert(colors.length == _ELEMENTS);
  final numFromName = getNumber(name);
  final range = colors.length;
  final elementsProperties = List.generate(
      _ELEMENTS,
      (i) => _AvatarBauhausData(
          color: getRandomColor(numFromName + i, colors, range),
          translateX: getUnit(numFromName * (i + 1), _SIZE ~/ 2 - (i + 17), 1),
          translateY: getUnit(numFromName * (i + 1), _SIZE ~/ 2 - (i + 17), 2),
          rotate: getUnit(numFromName * (i + 1), 360),
          isSquare: getBoolean(numFromName, 2)));
  return elementsProperties;
}

avatarBauhaus(String name, List<String> colors,
    {int size = _SIZE, bool square = false}) {
  final properties = _generateColors(name, colors);
  return """<svg
  viewBox="0 0 $_SIZE $_SIZE"
  fill="none"
  xmlns="http://www.w3.org/2000/svg"
  width="$_SIZE"
  height="$_SIZE"
>
  <mask id="mask__bauhaus" maskUnits="userSpaceOnUse" x="0" y="0" width="$_SIZE" height="$_SIZE">
    <rect width="$_SIZE" height="$_SIZE" rx="${square ? '' : _SIZE * 2}" fill="white" />
  </mask>
  <g mask="url(#mask__bauhaus)">
    <rect width="$_SIZE" height="$_SIZE" fill="${properties[0].color}" />
    <rect
      x="${(_SIZE - 60) / 2}"
      y="${{(_SIZE - 20) / 2}}"
      width="$_SIZE"
      height="${properties[1].isSquare ? _SIZE : _SIZE / 8}"
      fill=${properties[1].color}
      transform="${translate(properties[1].translateX, properties[1].translateY)} ${rotate(properties[1].rotate, _SIZE ~/ 2, _SIZE ~/ 2)}"
    />
    <circle
      cx="${_SIZE / 2}"
      cy="${_SIZE / 2}"
      fill="${properties[2].color}"
      r="${_SIZE / 5}"
      transform="${translate(properties[2].translateX, properties[2].translateY)}"
    />
    <line
      x1="0"
      y1="${_SIZE / 2}"
      x2="$_SIZE"
      y2="${_SIZE / 2}"
      strokeWidth="2"
      stroke="${properties[3].color}"
      transform="${translate(properties[3].translateX, properties[3].translateY)} ${rotate(properties[3].rotate, _SIZE ~/ 2, _SIZE ~/ 2)}"
    />
  </g>
</svg>""";
}
