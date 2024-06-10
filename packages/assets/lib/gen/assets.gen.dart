/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow-right-rounded.svg
  SvgGenImage get arrowRightRounded =>
      const SvgGenImage('assets/icons/arrow-right-rounded.svg');

  /// File path: assets/icons/favorite-filled.svg
  SvgGenImage get favoriteFilled =>
      const SvgGenImage('assets/icons/favorite-filled.svg');

  /// File path: assets/icons/favorite-sm.svg
  SvgGenImage get favoriteSm =>
      const SvgGenImage('assets/icons/favorite-sm.svg');

  /// File path: assets/icons/favorite.svg
  SvgGenImage get favorite => const SvgGenImage('assets/icons/favorite.svg');

  /// File path: assets/icons/hamburger-menu.svg
  SvgGenImage get hamburgerMenu =>
      const SvgGenImage('assets/icons/hamburger-menu.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        arrowRightRounded,
        favoriteFilled,
        favoriteSm,
        favorite,
        hamburgerMenu,
        search
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/pokemon_types
  $AssetsImagesPokemonTypesGen get pokemonTypes =>
      const $AssetsImagesPokemonTypesGen();
}

class $AssetsImagesPokemonTypesGen {
  const $AssetsImagesPokemonTypesGen();

  /// File path: assets/images/pokemon_types/bug.png
  AssetGenImage get bug =>
      const AssetGenImage('assets/images/pokemon_types/bug.png');

  /// File path: assets/images/pokemon_types/dark.png
  AssetGenImage get dark =>
      const AssetGenImage('assets/images/pokemon_types/dark.png');

  /// File path: assets/images/pokemon_types/dragon.png
  AssetGenImage get dragon =>
      const AssetGenImage('assets/images/pokemon_types/dragon.png');

  /// File path: assets/images/pokemon_types/electric.png
  AssetGenImage get electric =>
      const AssetGenImage('assets/images/pokemon_types/electric.png');

  /// File path: assets/images/pokemon_types/fairy.png
  AssetGenImage get fairy =>
      const AssetGenImage('assets/images/pokemon_types/fairy.png');

  /// File path: assets/images/pokemon_types/fighting.png
  AssetGenImage get fighting =>
      const AssetGenImage('assets/images/pokemon_types/fighting.png');

  /// File path: assets/images/pokemon_types/fire.png
  AssetGenImage get fire =>
      const AssetGenImage('assets/images/pokemon_types/fire.png');

  /// File path: assets/images/pokemon_types/flying.png
  AssetGenImage get flying =>
      const AssetGenImage('assets/images/pokemon_types/flying.png');

  /// File path: assets/images/pokemon_types/ghost.png
  AssetGenImage get ghost =>
      const AssetGenImage('assets/images/pokemon_types/ghost.png');

  /// File path: assets/images/pokemon_types/grass.png
  AssetGenImage get grass =>
      const AssetGenImage('assets/images/pokemon_types/grass.png');

  /// File path: assets/images/pokemon_types/ground.png
  AssetGenImage get ground =>
      const AssetGenImage('assets/images/pokemon_types/ground.png');

  /// File path: assets/images/pokemon_types/ice.png
  AssetGenImage get ice =>
      const AssetGenImage('assets/images/pokemon_types/ice.png');

  /// File path: assets/images/pokemon_types/normal.png
  AssetGenImage get normal =>
      const AssetGenImage('assets/images/pokemon_types/normal.png');

  /// File path: assets/images/pokemon_types/poison.png
  AssetGenImage get poison =>
      const AssetGenImage('assets/images/pokemon_types/poison.png');

  /// File path: assets/images/pokemon_types/psychic.png
  AssetGenImage get psychic =>
      const AssetGenImage('assets/images/pokemon_types/psychic.png');

  /// File path: assets/images/pokemon_types/rock.png
  AssetGenImage get rock =>
      const AssetGenImage('assets/images/pokemon_types/rock.png');

  /// File path: assets/images/pokemon_types/steel.png
  AssetGenImage get steel =>
      const AssetGenImage('assets/images/pokemon_types/steel.png');

  /// File path: assets/images/pokemon_types/stellar.png
  AssetGenImage get stellar =>
      const AssetGenImage('assets/images/pokemon_types/stellar.png');

  /// File path: assets/images/pokemon_types/water.png
  AssetGenImage get water =>
      const AssetGenImage('assets/images/pokemon_types/water.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bug,
        dark,
        dragon,
        electric,
        fairy,
        fighting,
        fire,
        flying,
        ghost,
        grass,
        ground,
        ice,
        normal,
        poison,
        psychic,
        rock,
        steel,
        stellar,
        water
      ];
}

class Assets {
  Assets._();

  static const String package = 'assets';

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  static const String package = 'assets';

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/assets/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  static const String package = 'assets';

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/assets/$_assetName';
}
