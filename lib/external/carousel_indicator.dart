import 'package:flutter/material.dart';

/// Base Painter class to draw indicator
abstract class BasePainter extends CustomPainter {
  final CarouselIndicator widget;
  final double page;
  final Paint _paint;

  BasePainter(this.widget, this.page, this._paint);

  /// This method will get body to class extending [BasePainter] and this method will draw the sliding indicator which slide over changing index.
  void draw(Canvas canvas, double space, double width, double height,
      double radius, double cornerRadius);

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = widget.color;
    double space = widget.space;
    double width = widget.width;
    double height = widget.height;
    double distance = width + space;
    double radius = width / 2;
    for (int? i = 0, c = widget.count; i! < c!; ++i) {
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: Offset((i * distance) + radius, radius),
                  width: width,
                  height: height),
              Radius.circular(widget.cornerRadius)),
          _paint);
    }

    _paint.color = widget.activeColor;
    draw(canvas, space, width, height, radius, widget.cornerRadius);
  }

  @override
  bool shouldRepaint(BasePainter oldDelegate) {
    return oldDelegate.page != page;
  }
}

/// This class we draw the indicator which slides.
class SlidePainter extends BasePainter {
  SlidePainter(CarouselIndicator widget, double page, Paint paint)
      : super(widget, page, paint);

  @override
  void draw(Canvas canvas, double space, double width, double height,
      double radius, double cornerRadius) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(radius + (page * (width + space)), radius),
                width: width,
                height: height),
            Radius.circular(cornerRadius)),
        _paint);
  }
}

class CarouselIndicator extends StatefulWidget {
  /// width of the indicator
  final double width;

  /// height of the indicator
  final double height;

  /// space between indicators.
  final double space;

  /// count of indicator
  final int? count;

  /// active color
  final Color activeColor;

  /// normal color
  final Color color;

  /// use this to give some radius to the corner indicator
  final double cornerRadius;

  /// duration for slide animation
  final int animationDuration;

  final int? index;

  const CarouselIndicator({
    Key? key,
    this.width = 20.0,
    this.height = 6,
    this.space = 5.0,
    this.count,
    this.cornerRadius = 6,
    this.animationDuration = 300,
    this.color = Colors.white30,
    this.index,
    this.activeColor = Colors.white,
  })  : assert(count != null && count != 0),
        assert(index != null && index >= 0),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CarouselIndicatorState();
  }
}

class _CarouselIndicatorState extends State<CarouselIndicator>
    with TickerProviderStateMixin {
  /// [Tween] object of type double
  late Tween<double> _tween;

  /// [AnimationController] object
  late AnimationController _animationController;

  /// [Aniamtion] object
  late Animation _animation;

  /// [Paint] object to paint our indicator
  Paint _paint = new Paint();

  /// Method to initilize [BasePainter] to paint indicators.
  BasePainter _createPainer() {
    return SlidePainter(widget, _animation.value, _paint);
  }

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox(
      width: widget.count! * widget.width + (widget.count! - 1) * widget.space,
      height: widget.height,
      child: CustomPaint(
        painter: _createPainer(),
      ),
    );

    return IgnorePointer(
      child: child,
    );
  }

  @override
  void initState() {
    /// for initial index=0 we do not want to change any value so setting [_tween] to (0.0,0.0),
    createAnimation(0.0, 0.0);
    super.initState();
  }

  @override
  void didUpdateWidget(CarouselIndicator oldWidget) {
    if (widget.index != oldWidget.index) {
      if (widget.index != 0) {
        _animationController.reset();

        /// for each new index we want to change value so setting [_tween] to (oldWidget.index,widget.index) so animation tween from old position to new position rather not start from 0.0 again and again.
        createAnimation(oldWidget.index!.toDouble(), widget.index!.toDouble());
        _animationController.forward();
      } else {
        _animationController.reset();
        createAnimation(oldWidget.index!.toDouble(), 0.0);
        _animationController.forward();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void createAnimation(double begin, double end) {
    _tween = Tween(begin: begin, end: end);
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration));
    _animation = _tween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }
}
