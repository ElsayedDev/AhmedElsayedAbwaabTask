// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'dart:math' as math;

part 'path_painter.dart';
part 'pathes_style_funcions.dart';

///
/// solid for completed path
/// dashed for uncompleted pah
///
enum ConnectorType { solid, dashed }

class MapPathCard {
  final int index;

  final int length;
  /* 
     1- to check if it the first one or not
      - we can up this feature to higher one put I made it flexible for
        the user to custom his chooice

    2- to set the padding for each one

     */

  final ConnectorType connectorType;
  /* dashed or solid form the main widget  */

  final Widget child;
  /* the Text widget or the main centerd one */

  const MapPathCard({
    required this.index,
    required this.length,
    required this.child,
    this.connectorType = ConnectorType.solid,
  });

  Widget render(BuildContext context) {
    /// the scale of each axis

    /* 
    
    
     */

    final double _scale_for_h = 1.3;
    final double _scale_for_w = 1.5;

    /* 
    


    */
    /// size for screen
    final _size = MediaQuery.of(context).size;

    /// the height
    final _height = _size.height * 0.6 * _scale_for_h;

    /// the width
    final _width = _size.width * 0.6 * _scale_for_w;

    /// of the paint
    final _sizePaint = Size(_height / 4.5, _width / 2.6);

    /// space between each card
    final _formalSpacing = _sizePaint.height / 2;

    /// left card padding
    final _leftPadding = index % 2 == 0 ? _formalSpacing : _formalSpacing * 2;

    /// the dynamic flow for each one
    final _PathDirection flowDirection =
        index % 2 == 0 ? _PathDirection._first : _PathDirection._second;

    /// the dynamic position for each one
    final _CardPosition _cardPosition = index == 0
        ? _CardPosition._first
        : index != (length - 1)
            ? _CardPosition._mid
            : _CardPosition._last;

    return Stack(
      children: [
        /// the path
        _FlowPathWidget(
            index: index,
            flowDirection: flowDirection,
            cardPosition: _cardPosition,
            connectorType: connectorType,
            sizePaint: _sizePaint),

        /// the card
        _CardWidget(
            leftPadding: _leftPadding,
            formalSpacing: _formalSpacing,
            index: index,
            height: _height,
            width: _width,
            connectorType: connectorType,
            child: child),

        /// the left icon
        _LeadingIconWidget(
          formalSpacing: _formalSpacing,
          index: index,
          height: _height,
          flowDirection: flowDirection,
          width: _width,
          connectorType: connectorType,
        )
      ],
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget({
    Key? key,
    required double leftPadding,
    required double formalSpacing,
    required this.index,
    required double height,
    required double width,
    required this.connectorType,
    required this.child,
  })  : _leftPadding = leftPadding,
        _formalSpacing = formalSpacing,
        _height = height,
        _width = width,
        super(key: key);

  final double _leftPadding;
  final double _formalSpacing;
  final int index;
  final double _height;
  final double _width;
  final ConnectorType connectorType;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: _leftPadding, top: _formalSpacing * index),
      child: SizedBox(
        height: _height / 10,
        width: _width / 1.7,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: connectorType == ConnectorType.dashed
                    ? Colors.grey
                    : Colors.orange,
                width: 3,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  offset: const Offset(0, 4),
                  blurRadius: 9,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

class _FlowPathWidget extends StatelessWidget {
  const _FlowPathWidget({
    Key? key,
    required this.index,
    required this.flowDirection,
    required _CardPosition cardPosition,
    required this.connectorType,
    required Size sizePaint,
  })  : _cardPosition = cardPosition,
        _sizePaint = sizePaint,
        super(key: key);

  final int index;
  final _PathDirection flowDirection;
  final _CardPosition _cardPosition;
  final ConnectorType connectorType;
  final Size _sizePaint;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MapPathPainter(
        index: index,
        pathDirection: flowDirection,
        cardPosition: _cardPosition,
        firstConnectorColor: Colors.orange,
        connectorType: connectorType,
      ),
      size: _sizePaint,
    );
  }
}

class _LeadingIconWidget extends StatelessWidget {
  const _LeadingIconWidget({
    Key? key,
    required double formalSpacing,
    required this.index,
    required double height,
    required this.flowDirection,
    required double width,
    required this.connectorType,
  })  : _formalSpacing = formalSpacing,
        _height = height,
        _width = width,
        super(key: key);

  final double _formalSpacing;
  final int index;
  final double _height;
  final _PathDirection flowDirection;
  final double _width;
  final ConnectorType connectorType;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _formalSpacing * index + _height / 28,
      left: flowDirection == _PathDirection._first
          ? _width - _width / 1.2
          : _width - _width / 1.55,
      child: CircleAvatar(
        radius: 12,
        child: connectorType == ConnectorType.dashed
            ? const Text(
                "?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            : const Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              ),
        backgroundColor:
            connectorType == ConnectorType.solid ? Colors.orange : Colors.grey,
      ),
    );
  }
}
