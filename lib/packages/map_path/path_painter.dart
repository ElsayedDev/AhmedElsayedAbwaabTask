// ignore_for_file: non_constant_identifier_names

part of 'map_path_card.dart';

enum _PathDirection { _first, _second }

enum _CardPosition { _first, _mid, _last }

/// painter class to draw the flow path
///
/// the flow set to be reponsive for whole screen
class MapPathPainter extends CustomPainter {
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  final int index;
  /* the index of each one for 2 cases
    1- to check if it the first one or not
      - we can up this feature to higher one put I made it flexible for
        the user to custom his chooice

    2- to set the padding for each one

     */

  final _PathDirection pathDirection;
  /* 
    set the direction for each ont
  
  */

  final bool isLast;
  /* to remove the path for the end*/

  final Color firstConnectorColor;
  /* to cast the color for each connectores   */

  final Color? secondConnectorColor;
  /* to cast second */

  final Color notCommpletedConnectorColor;
  /* in case dashed */

  final _CardPosition cardPosition;
  /* enum position for each card */

  final ConnectorType connectorType;
  /* solid or dashed */

  const MapPathPainter({
    this.index = 0,
    this.cardPosition = _CardPosition._first,
    this.pathDirection = _PathDirection._first,
    this.connectorType = ConnectorType.solid,
    this.isLast = false,
    this.firstConnectorColor = Colors.deepOrange,
    this.secondConnectorColor,
    this.notCommpletedConnectorColor = Colors.grey,
  });

  ///
  ///
  /// painter function
  ///

  @override
  void paint(Canvas canvas, Size size) {
    final _size = size.height / 2;

    final Paint paint = Paint()
      ..color = pathDirection == _PathDirection._first
          ? firstConnectorColor
          : secondConnectorColor ?? firstConnectorColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.square;

    ///
    /// to check the paths direction .. first and second cards
    ///
    switch (pathDirection) {

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
      case _PathDirection._first:

        /// in case first card
        _leftPath(
          canvas,
          paint,
          _size,
          index,
          connectorType,
          cardPosition,
          notCommpletedConnectorColor,
        );

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

      case _PathDirection._second:

        /// in case first card
        _rightPath(
          canvas,
          paint,
          _size,
          index,
          connectorType,
          cardPosition,
          notCommpletedConnectorColor,
        );

        break;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
