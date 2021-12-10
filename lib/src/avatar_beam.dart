// ignore_for_file: constant_identifier_names

import './utilities.dart';

const _SIZE = 36;

class _AvatarBeamData {
  String wrapperColor;
  String faceColor;
  String backgroundColor;
  int wrapperTranslateX;
  int wrapperTranslateY;
  int wrapperRotate;
  double wrapperScale;
  bool isMouthOpen;
  bool isCircle;
  int eyeSpread;
  int mouthSpread;
  int faceRotate;
  int faceTranslateX;
  int faceTranslateY;
  _AvatarBeamData({
    required this.wrapperColor,
    required this.faceColor,
    required this.backgroundColor,
    required this.wrapperTranslateX,
    required this.wrapperTranslateY,
    required this.wrapperRotate,
    required this.wrapperScale,
    required this.isMouthOpen,
    required this.isCircle,
    required this.eyeSpread,
    required this.mouthSpread,
    required this.faceRotate,
    required this.faceTranslateX,
    required this.faceTranslateY,
  });
}

_AvatarBeamData _generateColors(String name, List<String> colors) {
  final numFromName = getNumber(name);
  final range = colors.length;

  final wrapperColor = getRandomColor(numFromName, colors, range);
  final preTranslateX = getUnit(numFromName, 10, 1);
  final wrapperTranslateX =
      preTranslateX < 5 ? preTranslateX + _SIZE ~/ 9 : preTranslateX;
  final preTranslateY = getUnit(numFromName, 10, 2);
  final wrapperTranslateY =
      preTranslateY < 5 ? preTranslateY + _SIZE ~/ 9 : preTranslateY;

  return _AvatarBeamData(
    wrapperColor: wrapperColor,
    faceColor: getContrast(wrapperColor),
    backgroundColor: getRandomColor(numFromName + 13, colors, range),
    wrapperTranslateX: wrapperTranslateX,
    wrapperTranslateY: wrapperTranslateY,
    wrapperRotate: getUnit(numFromName, 360),
    wrapperScale: 1 + getUnit(numFromName, _SIZE ~/ 12) / 10,
    isMouthOpen: getBoolean(numFromName, 2),
    isCircle: getBoolean(numFromName, 1),
    eyeSpread: getUnit(numFromName, 5),
    mouthSpread: getUnit(numFromName, 3),
    faceRotate: getUnit(numFromName, 10, 3),
    faceTranslateX: wrapperTranslateX > _SIZE / 6
        ? wrapperTranslateX ~/ 2
        : getUnit(numFromName, 8, 1),
    faceTranslateY: wrapperTranslateY > _SIZE / 6
        ? wrapperTranslateY ~/ 2
        : getUnit(numFromName, 7, 2),
  );
}

avatarBeam(String name, List<String> colors,
    {int size = _SIZE, bool square = false}) {
  final data = _generateColors(name, colors);
  return """<svg
  viewBox="0 0 $_SIZE $_SIZE"
  fill="none"
  xmlns="http://www.w3.org/2000/svg"
  width="$size"
  height="$size"
>
  <mask id="mask__beam" maskUnits="userSpaceOnUse" x="0" y="0" width="$_SIZE" height="$_SIZE">
    <rect width="$_SIZE" height="$_SIZE" rx="${square ? '' : _SIZE * 2}" fill="white" />
  </mask>
  <g mask="url(#mask__beam)">
    <rect width="$_SIZE" height="$_SIZE" fill="${data.backgroundColor}" />
    <rect
      x="0"
      y="0"
      width="$_SIZE"
      height="$_SIZE"
      transform="${translate(data.wrapperTranslateX, data.wrapperTranslateY)} ${rotate(data.wrapperRotate, _SIZE ~/ 2, _SIZE ~/ 2)} ${scale(data.wrapperScale)}"
      fill="${data.wrapperColor}"
      rx="${data.isCircle ? _SIZE : _SIZE / 6}"
    />
    <g
      transform="${translate(data.faceTranslateX, data.faceTranslateY)} ${rotate(data.faceRotate, _SIZE ~/ 2, _SIZE ~/ 2)}"
    >
      ${data.isMouthOpen ? ("""
        <path
          d="${'M15 ' + (19 + data.mouthSpread).toString() + 'c2 1 4 1 6 0'}"
          stroke="${data.faceColor}"
          fill="none"
          strokeLinecap="round"
        />
        """) : ("""
        <path
          d="${'M13,' + (19 + data.mouthSpread).toString() + ' a1,0.75 0 0,0 10,0'}"
          fill="${data.faceColor}"
        />
        """)}
      <rect
        x="${14 - data.eyeSpread}"
        y="14"
        width="1.5"
        height="2"
        rx="1"
        stroke="none"
        fill="${data.faceColor}"
      />
      <rect
        x="${20 + data.eyeSpread}"
        y="14"
        width="1.5"
        height="2"
        rx="1"
        stroke="none"
        fill="${data.faceColor}"
      />
    </g>
  </g>
</svg>""";
}
