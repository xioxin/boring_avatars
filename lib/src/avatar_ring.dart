// ignore_for_file: constant_identifier_names

import './utilities.dart';

const _COLORS = 5;
const _SIZE = 90;

List<String> _generateColors(String name, List<String> colors) {
  final numFromName = getNumber(name);
  final range = colors.length;
  final colorsShuffle = List.generate(
      _COLORS, (i) => getRandomColor(numFromName + (i + 1), colors, range));
  final List<String> iconColors = [
    colorsShuffle[0],
    colorsShuffle[1],
    colorsShuffle[1],
    colorsShuffle[2],
    colorsShuffle[2],
    colorsShuffle[3],
    colorsShuffle[3],
    colorsShuffle[0],
    colorsShuffle[4],
  ];
  return iconColors;
}

avatarRing(String name, List<String> colors,
    {int size = _SIZE, bool square = false}) {
  final cellColors = _generateColors(name, colors);
  return """<svg
  viewBox="0 0 $_SIZE $_SIZE"
  fill="none"
  xmlns="http://www.w3.org/2000/svg"
  width="$size"
  height="$size"
>
  <mask id="mask__ring" maskUnits="userSpaceOnUse" x="0" y="0" width="$_SIZE" height="$_SIZE">
    <rect width="$_SIZE" height="$_SIZE" rx="${square ? '' : _SIZE * 2}" fill="white" />
  </mask>
  <g mask="url(#mask__ring)">
    <path d="M0 0h90v45H0z" fill="${cellColors[0]}" />
    <path d="M0 45h90v45H0z" fill="${cellColors[1]}" />
    <path d="M83 45a38 38 0 00-76 0h76z" fill="${cellColors[2]}" />
    <path d="M83 45a38 38 0 01-76 0h76z" fill="${cellColors[3]}" />
    <path d="M77 45a32 32 0 10-64 0h64z" fill="${cellColors[4]}" />
    <path d="M77 45a32 32 0 11-64 0h64z" fill="${cellColors[5]}" />
    <path d="M71 45a26 26 0 00-52 0h52z" fill="${cellColors[6]}" />
    <path d="M71 45a26 26 0 01-52 0h52z" fill="${cellColors[7]}" />
    <circle cx="45" cy="45" r="23" fill="${cellColors[8]}" />
  </g>
</svg>""";
}
