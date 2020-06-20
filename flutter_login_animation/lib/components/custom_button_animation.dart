import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomButtonAnimation extends StatefulWidget {
  final String label;
  final Color background;
  final Color borderColor;
  final Color fontColor;
  final Function onTap;
  final Widget child;

  const CustomButtonAnimation(
      {Key key,
      this.label,
      this.background,
      this.borderColor,
      this.fontColor,
      this.onTap,
      this.child})
      : super(key: key);

  @override
  _CustomButtonAnimationState createState() => _CustomButtonAnimationState();
}

class _CustomButtonAnimationState extends State<CustomButtonAnimation>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;
  bool _isHideText = false;


  @override
  void initState() {
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 32.0).animate(_scaleController)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(
            child: widget.child,
            type: PageTransitionType.fade
        )).then((value) {
          _scaleController.reverse().then((value) {
            _isHideText = false;
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isHideText = true;
        });
        _scaleController.forward();
      },
      child: AnimatedBuilder(
        animation: _scaleController,
        builder: (context, child) => Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              height: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: widget.borderColor, width: 1),
              ),
              child:  !_isHideText? Text(
                widget.label,
                style: TextStyle(
                  color: widget.fontColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ) : Container(),
            )),
      ),
    );
  }
}
