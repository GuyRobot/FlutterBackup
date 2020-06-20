import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as image;

class ThanosSnap extends StatefulWidget {
  final Widget child;
  final Offset offset;
  final Duration duration;
  final Offset randomDislocationOffset;
  final int numberOfBuckets;
  final bool snapOnTap;
  final VoidCallback onSnapped;

  ThanosSnap({
    Key key,
    @required this.child,
    this.offset = const Offset(64, -32),
    this.duration = const Duration(milliseconds: 5000),
    this.randomDislocationOffset = const Offset(64, 32),
    this.numberOfBuckets = 16,
    this.snapOnTap = false,
    this.onSnapped,
  }) : super(key: key);

  @override
  ThanosSnapState createState() => ThanosSnapState();
}

class ThanosSnapState extends State<ThanosSnap>
    with SingleTickerProviderStateMixin {
  static const double _singleLayerAnimationLength = 0.6;
  static const double _lastLayerAnimationStart = 1 -
      _singleLayerAnimationLength;
  AnimationController _animationController;

  bool get isGone => _animationController.isCompleted;
  GlobalKey _globalKey = GlobalKey();
  List<double> _randoms;
  List<Uint8List> _layers;
  Size size;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: widget.duration
    );
    if (widget.onSnapped != null) {
      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) widget.onSnapped();
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.snapOnTap ? () => isGone ? reset() : snap() : null,
      child: Stack(
        children: <Widget>[
          if (_layers != null) ..._layers.map(_imageToWidget),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return _animationController.isDismissed ? child : Container();
            },
            child: RepaintBoundary(
              key: _globalKey,
              child: widget.child,
            ),
          ),

        ]
        ,
      )
      ,
    );
  }

  Future<void> snap() async {
    final fullImage = await _getImageFromWidget();

    List<image.Image> _images = List<image.Image>.generate(
        widget.numberOfBuckets, (index) =>
        image.Image(fullImage.width, fullImage.height));
    //for every line of pixels
    for (int y = 0; y < fullImage.height; y++) {
      //generate weight list of probabilities determining
      //to which bucket should given pixels go
      List<int> weights = List.generate(widget.numberOfBuckets, (bucket) =>
          _gauss(y / fullImage.height, bucket / widget.numberOfBuckets));
      int sumOfWeights = weights.fold(0, (sum, el) => sum + el);
      //for every pixel in a line
      for (int x = 0; x < fullImage.width; x++) {
        //get the pixel from fullImage
        int pixel = fullImage.getPixel(x, y);
        //choose a bucket for a pixel
        int imageIndex = _pickABucket(weights, sumOfWeights);
        //set the pixel from chosen bucket
        _images[imageIndex].setPixel(x, y, pixel);
      }
    }
    _layers = await compute<List<image.Image>, List<Uint8List>>(
        _encodeImages, _images);
    //prepare random dislocations and set state
    setState(() {
      _randoms = List.generate(widget.numberOfBuckets, (index) =>
      (math.Random().nextDouble() - 0.5) * 2);
    });
    await Future.delayed(Duration(milliseconds: 120));
    _animationController.forward();
  }

  void reset() {
    setState(() {
      _layers = null;
      _animationController.reset();
    });
  }

  Widget _imageToWidget(Uint8List layer) {
    int index = _layers.indexOf(layer);
    double animationStart = (index / _layers.length) * _lastLayerAnimationStart;
    double animationEnd = animationStart + _singleLayerAnimationLength;

    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Interval(
            animationStart,
            animationEnd,
            curve: Curves.easeOut
        )
    );

    Offset randomOffset = widget.randomDislocationOffset.scale(
        _randoms[index], _randoms[index]);

    Animation<Offset> offsetAnimation =
    Tween<Offset>(
      begin: Offset.zero,
      end: widget.offset + randomOffset,
    ).animate(curvedAnimation);
    return AnimatedBuilder(
      animation: _animationController,
      child: Image.memory(layer),
      builder: (context, child) {
        return Transform.translate(offset: offsetAnimation.value,
          child: Opacity(
            opacity: math.cos(curvedAnimation.value * math.pi / 2),
            child: child,
          ),);
      },
    );
  }

  int _pickABucket(List<int> weights, int sumOfWeights) {
    int rnd = math.Random().nextInt(sumOfWeights);
    int chosenImage = 0;
    for (int i = 0; i < widget.numberOfBuckets; i++) {
      if (rnd < weights[i]) {
        chosenImage = i;
        break;
      }
      rnd -= weights[i];
    }
    return chosenImage;
  }

  Future<image.Image> _getImageFromWidget() async {
    RenderRepaintBoundary renderRepaintBoundary =
    _globalKey.currentContext.findRenderObject();
    size = renderRepaintBoundary.size;
    var img = await renderRepaintBoundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();

    return image.decodeImage(pngBytes);
  }

  int _gauss(double center, double value) =>
      (1000 * math.exp(-(math.pow((value - center), 2) / 0.14))).round();
}

List<Uint8List> _encodeImages(List<image.Image> images) {
  return images.map((img) => Uint8List.fromList(image.encodePng(img))).toList();
}
