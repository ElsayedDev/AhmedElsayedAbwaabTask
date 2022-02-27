part of 'map_path_card.dart';

_leftPath(
  Canvas canvas,
  Paint paint,
  double _size,
  int index,
  ConnectorType connectorType,
  _CardPosition cardPosition,
  Color notCommpletedConnectorColor,
) {
  /// padding increased
  final double _increasedPadding = _size * index;

  /// left rect
  final _leftRect = Rect.fromCenter(
    center: Offset(_size, _size + _increasedPadding),
    height: _size,
    width: _size,
  );

  /// right rect
  final Rect _rightRect = Rect.fromCenter(
    center: Offset(_size * 5, 0 + _increasedPadding),
    height: _size,
    width: _size,
  );

  ///
  /// coordinates for line
  final _startX_line = _size * 5;
  final _startY_line = _size * 0.5 + _increasedPadding;
  final _endX_line = _size * 4;

  /* 
  
  
  
  
  
  
  
  
  
  
   */

  switch (connectorType) {

    /// in case the solid connctor selected
    case ConnectorType.solid:

      /// for each position ..
      ///
      ///
      /// [_CardPosition._first] if the first card of the flow
      ///
      /// [_CardPosition._mid] whole the flow
      ///
      /// [_CardPosition._last] the last card of the flow
      ///
      ///

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
          _drawDashedArc(canvas, paint, _rightRect, notCommpletedConnectorColor,
              startAngle: 2, endAngle: 0.5);

          _drawDashedLine(
            canvas,
            paint,
            notCommpletedConnectorColor,
            startX: _startX_line,
            endX: _endX_line,
            startY: _size * 0.5 + _increasedPadding,
          );

          if (cardPosition == _CardPosition._mid) {
            continue leftDashed;
          }

          break;

        leftDashed:
        case _CardPosition._first:
          _drawDashedArc(canvas, paint, _leftRect, notCommpletedConnectorColor,
              startAngle: 1, endAngle: 0.5);

          break;
      }
      break;
  }
}

_rightPath(
    Canvas canvas,
    Paint paint,
    double _size,
    int index,
    ConnectorType connectorType,
    _CardPosition cardPosition,
    Color notCommpletedConnectorColor) {
  /// padding increased
  final double _increasedPadding = _size * (index - 1);

  final _startX_line = _size;
  final _startY_line = _size * 1.5 + _increasedPadding;
  final _endX_line = _size * 2;

  /// left rect
  final Rect _leftRect = Rect.fromCenter(
    center: Offset(_size, _size + _increasedPadding),
    height: _size,
    width: _size,
  );

  /// righ rect
  final Rect _rightRect = Rect.fromCenter(
    center: Offset(_size * 5, _size * 2 + _increasedPadding),
    height: _size,
    width: _size,
  );

  /* 
  
  
  
  
  
  
  
  
  
  
   */

  switch (connectorType) {
    case ConnectorType.solid:

      /// for each position ..
      ///
      ///
      /// [_CardPosition._first] if the first card of the flow
      ///
      /// [_CardPosition._mid] whole the flow
      ///
      /// [_CardPosition._last] the last card of the flow
      ///
      ///
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
            notCommpletedConnectorColor,
            startX: _endX_line,
            endX: _startX_line,
            startY: _startY_line,
          );

          _drawDashedArc(
            canvas,
            paint,
            _leftRect,
            notCommpletedConnectorColor,
            startAngle: 0.5,
            endAngle: 0.5,
          );

          if (cardPosition == _CardPosition._mid) {
            continue leftDashed;
          }

          break;

        leftDashed:
        case _CardPosition._first:
          _drawDashedArc(
            canvas,
            paint,
            _rightRect,
            notCommpletedConnectorColor,
            startAngle: -2.5,
            endAngle: 0.5,
          );

          break;
      }
      break;
  }
}

void _drawDashedArc(
    Canvas canvas, Paint paint, Rect rect, Color notCommpletedConnectorColor,
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

void _drawDashedLine(
    Canvas canvas, Paint paint, Color notCommpletedConnectorColor,
    {required double startX, required double endX, required double startY}) {
  /// the width and space
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
