// ignore_for_file: constant_identifier_names

import './utilities.dart';

const _ELEMENTS = 4;
const _SIZE = 80;

class _AvatarSunsetData {
  String color;
  _AvatarSunsetData({
    required this.color,
  });
}

List<_AvatarSunsetData> _generateColors(String name, List<String> colors) {
  final numFromName = getNumber(name);
  final range = colors.length;
  final elementsProperties = List.generate(
      _ELEMENTS,
      (i) => _AvatarSunsetData(
            color: getRandomColor(numFromName % (i + 13), colors, range),
          ));
  return elementsProperties;
}

avatarSunset(String name, List<String> colors,
    {int size = _SIZE, bool square = false}) {
  final properties = _generateColors(name, colors);
  name = name.replaceAll(RegExp(r'\s', dotAll: true), '');
  return """<svg
  viewBox="0 0 $_SIZE $_SIZE"
  fill="none"
  xmlns="http://www.w3.org/2000/svg"
  width="$size"
  height="$size"
>
  <mask id="mask__sunset" maskUnits="userSpaceOnUse" x="0" y="0" width="$_SIZE" height="$_SIZE">
    <rect width="$_SIZE" height="$_SIZE" rx="${square ? '' : _SIZE * 2}" fill="white" />
  </mask>
  <g mask="url(#mask__sunset)">
    <path fill="${'url(#gradient_paint0_linear_' + name + ')'}" d="M0 0h80v40H0z" />
    <path fill="${'url(#gradient_paint1_linear_' + name + ')'}" d="M0 40h80v40H0z" />
  </g>
  <defs>
    <linearGradient
      id="${'gradient_paint0_linear_' + name}"
      x1="${_SIZE / 2}"
      y1="0"
      x2="${_SIZE / 2}"
      y2="${_SIZE / 2}"
      gradientUnits="userSpaceOnUse"
    >
      <stop stopColor="${properties[0].color}" />
      <stop offset="${1}" stopColor="${properties[1].color}" />
    </linearGradient>
    <linearGradient
      id="${'gradient_paint1_linear_' + name}"
      x1="${_SIZE / 2}"
      y1="${_SIZE / 2}"
      x2="${_SIZE / 2}"
      y2="$_SIZE"
      gradientUnits="userSpaceOnUse"
    >
      <stop stopColor="${properties[2].color}" />
      <stop offset="${1}" stopColor="${properties[3].color}" />
    </linearGradient>
  </defs>
</svg>""";
}
