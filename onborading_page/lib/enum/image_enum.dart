enum ImageEnum {
  // ignore: constant_identifier_names
  im_one("im_one"),
  // ignore: constant_identifier_names
  im_two("im_two"),
  // ignore: constant_identifier_names
  im_three("im_three");

  final String _path;
  const ImageEnum(this._path);
  String get imagePath => "assets/$_path.png";
}
