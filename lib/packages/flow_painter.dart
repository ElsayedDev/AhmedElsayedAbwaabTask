// ignore_for_file: non_constant_identifier_names

part of 'flow_chart.dart';

enum _FlowDirection { _first, _second }

enum _CardPosition { _first, _mid, _last }

// This is the Painter class
class FlowPaint extends CustomPainter {
  final int index;
  final _FlowDirection flowDirection;
  final bool isLast;
  final Color firstConnectorColor;
  final Color? secondConnectorColor;
  final Color notCommpletedConnectorColor;

  final _CardPosition cardPosition;
  final ConnectorType connectorType;

  const FlowPaint({
    this.index = 0,
    this.cardPosition = _CardPosition._first,
    this.flowDirection = _FlowDirection._first,
    this.connectorType = ConnectorType.solid,
    this.isLast = false,
    this.firstConnectorColor = Colors.deepOrange,
    this.secondConnectorColor,
    this.notCommpletedConnectorColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final _size = size.height / 2;

    Paint paint = Paint()
      ..color = flowDirection == _FlowDirection._first
          ? firstConnectorColor
          : secondConnectorColor ?? firstConnectorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.square;

    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////// Left position ///////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////
    switch (flowDirection) {
      case _FlowDirection._first:
        final double _increase = _size * index;

        final _leftRect = Rect.fromCenter(
          center: Offset(_size, _size + _increase),
          height: _size,
          width: _size,
        );

        final Rect _rightRect = Rect.fromCenter(
          center: Offset(_size * 5, 0 + _increase),
          height: _size,
          width: _size,
        );

        ///
        /// coordinates for line
        final _startX_line = _size * 5;
        final _startY_line = _size * 0.5 + _increase;
        final _endX_line = _size * 4;

        switch (connectorType) {
          case ConnectorType.solid:
            switch (cardPosition) {
              case _CardPosition._mid:

              case _CardPosition._last:
                canvas.drawLine(Offset(_startX_line, _startY_line),
                    Offset(_endX_line, _startY_line), paint);

                canvas.drawArc(
                  _rightRect,
                  0,
                  math.pi * 0.5,
                  false,
                  paint,
                );

                if (cardPosition == _CardPosition._mid) {
                  continue leftSolid;
                }

                break;

              leftSolid:
              case _CardPosition._first:
                canvas.drawArc(
                  _leftRect,
                  math.pi,
                  math.pi * 0.5,
                  false,
                  paint,
                );

                break;
            }

            break;

          case ConnectorType.dashed:
            switch (cardPosition) {
              case _CardPosition._mid:

              case _CardPosition._last:
                _drawDashedArc(canvas, paint, _rightRect,
                    startAngle: 2, endAngle: 0.5);

                _drawDashedLine(
                  canvas,
                  paint,
                  startX: _startX_line,
                  endX: _endX_line,
                  startY: _size * 0.5 + _increase,
                );

                if (cardPosition == _CardPosition._mid) {
                  continue leftDashed;
                }

                break;

              leftDashed:
              case _CardPosition._first:
                _drawDashedArc(canvas, paint, _leftRect,
                    startAngle: 1, endAngle: 0.5);

                break;
            }
            break;
        }
        break;

      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////// Right position //////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////////////

      case _FlowDirection._second:
        final double _increase = _size * (index - 1);

        final _startX_line = _size;
        final _startY_line = _size * 1.5 + _increase;
        final _endX_line = _size * 2;

        final Rect _leftRect = Rect.fromCenter(
          center: Offset(_size, _size + _increase),
          height: _size,
          width: _size,
        );

        final Rect _rightRect = Rect.fromCenter(
          center: Offset(_size * 5, _size * 2 + _increase),
          height: _size,
          width: _size,
        );

        switch (connectorType) {
          case ConnectorType.solid:
            switch (cardPosition) {
              case _CardPosition._mid:

              case _CardPosition._last:
                canvas.drawArc(
                  _leftRect,
                  math.pi * 0.5,
                  math.pi * 0.5,
                  false,
                  paint,
                );

                canvas.drawLine(Offset(_startX_line, _startY_line),
                    Offset(_endX_line, _startY_line), paint);

                if (cardPosition == _CardPosition._mid) {
                  continue leftSolid;
                }

                break;

              leftSolid:
              case _CardPosition._first:
                canvas.drawArc(
                  _rightRect,
                  math.pi * -2.5,
                  math.pi * 0.5,
                  false,
                  paint,
                );

                break;
            }

            break;

          case ConnectorType.dashed:
            switch (cardPosition) {
              case _CardPosition._mid:

              case _CardPosition._last:
                _drawDashedLine(
                  canvas,
                  paint,
                  startX: _endX_line,
                  endX: _startX_line,
                  startY: _startY_line,
                );

                _drawDashedArc(canvas, paint, _leftRect,
                    startAngle: 0.5, endAngle: 0.5);

                if (cardPosition == _CardPosition._mid) {
                  continue leftDashed;
                }

                break;

              leftDashed:
              case _CardPosition._first:
                _drawDashedArc(canvas, paint, _rightRect,
                    startAngle: -2.5, endAngle: 0.5);

                break;
            }
            break;
        }
        break;
    }
  }

  void _drawDashedLine(Canvas canvas, Paint paint,
      {required double startX, required double endX, required double startY}) {
    const int _dashWidth = 10;
    const int _dashSpace = 4;

    while (endX < startX) {
      // Draw a small line.
      canvas.drawLine(
        Offset(endX, startY),
        Offset(endX + _dashSpace, startY),
        paint..color = notCommpletedConnectorColor,
      );

      // Update the starting X
      endX += _dashWidth + _dashSpace;
    }
  }

  void _drawDashedArc(Canvas canvas, Paint paint, Rect rect,
      {required double startAngle, required double endAngle}) {
    // Chage to your preferred size
    const double _dashWidth = .06;
    const double _dashSpace = .05;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double _startX = 0;
    double _startY = .05;

    // Repeat drawing until we reach the right edge.
    // In our example, size.with = 300 (from the SizedBox)
    while (_startX < 0.5) {
      // Draw a small line.

      canvas.drawArc(
        rect,
        math.pi * (startAngle + _startX),
        /*  */
        math.pi * endAngle * (_startX - _startY),
        false,
        paint..color = notCommpletedConnectorColor,
      );
      // Update the starting X
      _startX += _dashWidth + _dashSpace;
      _startY += _dashWidth + _dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
