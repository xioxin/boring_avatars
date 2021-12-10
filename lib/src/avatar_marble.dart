// ignore_for_file: constant_identifier_names

import './utilities.dart';

const _ELEMENTS = 3;
const _SIZE = 80;

class _AvatarMarbleData {
  String color;
  int translateX;
  int translateY;
  int rotate;
  double scale;
  _AvatarMarbleData({
    required this.color,
    required this.translateX,
    required this.translateY,
    required this.rotate,
    required this.scale,
  });
}

List<_AvatarMarbleData> _generateColors(String name, List<String> colors) {
  final numFromName = getNumber(name);
  final range = colors.length;
  final elementsProperties = List.generate(
      _ELEMENTS,
      (i) => _AvatarMarbleData(
            color: getRandomColor(numFromName + i, colors, range),
            translateX: getUnit(numFromName * (i + 1), _SIZE ~/ 10, 1),
            translateY: getUnit(numFromName * (i + 1), _SIZE ~/ 10, 2),
            scale: 1.2 + getUnit(numFromName * (i + 1), _SIZE ~/ 20) / 10,
            rotate: getUnit(numFromName * (i + 1), 360, 1),
          ));
  return elementsProperties;
}

avatarMarble(String name, List<String> colors,
    {int size = _SIZE, bool square = false}) {
  final properties = _generateColors(name, colors);
  return """<svg
  viewBox="0 0 $_SIZE $_SIZE"
  fill="none"
  xmlns="http://www.w3.org/2000/svg"
  width="$size"
  height="$size"
>
  <mask id="mask__marble" maskUnits="userSpaceOnUse" x="0" y="0" width="$_SIZE" height="$_SIZE">
    <rect width="$_SIZE" height="$_SIZE" rx="${square ? '' : _SIZE * 2}" fill="white" />
  </mask>
  <g mask="url(#mask__marble)">
    <rect width="$_SIZE" height="$_SIZE" rx="2" fill="${properties[0].color}" />
    <path
      filter="url(#prefix__filter0_f)"
      d="M32.414 59.35L50.376 70.5H72.5v-71H33.728L26.5 13.381l19.057 27.08L32.414 59.35z"
      fill="${properties[1].color}"
      transform="${translate(properties[1].translateX, properties[1].translateY)} ${rotate(properties[1].rotate, _SIZE ~/ 2, _SIZE ~/ 2)} ${scale(properties[2].scale)}"
    />
    <path
      filter="url(#prefix__filter0_f)"
      style="mix-blend-mode: overlay"
      d="M22.216 24L0 46.75l14.108 38.129L78 86l-3.081-59.276-22.378 4.005 12.972 20.186-23.35 27.395L22.215 24z"
      fill="${properties[2].color}"
      transform="${translate(properties[2].translateX, properties[2].translateY)} ${rotate(properties[2].rotate, _SIZE ~/ 2, _SIZE ~/ 2)} ${scale(properties[2].scale)}"
    />
  </g>
  <defs>
    <filter
      id="prefix__filter0_f"
      filterUnits="userSpaceOnUse"
      colorInterpolationFilters="sRGB"
    >
      <feFlood floodOpacity="0" result="BackgroundImageFix" />
      <feBlend in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
      <feGaussianBlur stdDeviation="7" result="effect1_foregroundBlur" />
    </filter>
  </defs>
</svg>
""";
}
