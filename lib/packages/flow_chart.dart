import 'package:flutter/material.dart';

import 'dart:math' as math;

part 'flow_painter.dart';

enum ConnectorType { solid, dashed }

class FlowCard {
  final int index;
  final int length;
  final ConnectorType connectorType;
  final Widget child;

  FlowCard({
    required this.index,
    required this.length,
    required this.child,
    this.connectorType = ConnectorType.solid,
  });

  Widget render(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _height = _size.height * 0.6 * 1.3;

    final _width = _size.width * 0.6 * 1.5;

    final _sizePaint = Size(_height / 4.5, _width / 2.6);

    final _formalSpacing = _sizePaint.height / 2;

    final _leftPadding = index % 2 == 0 ? _formalSpacing : _formalSpacing * 2;

    final _FlowDirection flowDirection =
        index % 2 == 0 ? _FlowDirection._first : _FlowDirection._second;

    final _CardPosition _cardPosition = index == 0
        ? _CardPosition._first
        : index != (length - 1)
            ? _CardPosition._mid
            : _CardPosition._last;

    return Stack(
      children: [
        CustomPaint(
          painter: FlowPaint(
            index: index,
            flowDirection: flowDirection,
            cardPosition: _cardPosition,
            firstConnectorColor: Colors.orange,
            connectorType: connectorType,
          ),
          size: _sizePaint,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: _leftPadding, top: _formalSpacing * index),
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
        ),
        Positioned(
          top: _formalSpacing * index + _height / 28,
          left: flowDirection == _FlowDirection._first
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
            backgroundColor: connectorType == ConnectorType.solid
                ? Colors.orange
                : Colors.grey,
          ),
        )
      ],
    );
  }
}
