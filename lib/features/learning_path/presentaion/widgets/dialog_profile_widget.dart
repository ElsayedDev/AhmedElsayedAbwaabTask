import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forinterview/features/learning_path/data/models/models.dart';
import 'package:forinterview/features/learning_path/logic/bloc/learning_path_bloc.dart';
import 'package:provider/src/provider.dart';

class DialogProfile {
  const DialogProfile(
      {this.color = Colors.purple, this.gifURL = "assets/loading4.gif"});

  final Color color;
  final String gifURL;

  Widget render(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _height = _size.height * 0.5;
    final _width = _size.width * 0.6;
    const TextStyle _textStyle = TextStyle(color: Colors.white);

    return BlocBuilder<LearningPathBloc, LearningPathState>(
      builder: (context, state) {
        final UserModel _user = state.selectedUser!;
        return Dialog(
          child: SizedBox(
            height: _height,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: _height * 0.55,
                  decoration: BoxDecoration(
                    color: color,
                    image: DecorationImage(
                      image: AssetImage(gifURL),
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.softLight,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: _height * 0.45,
                  color: color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        title: Text(
                          _user.name ?? '',
                          style:
                              _textStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '@${_user.username ?? ''} /',
                                    style: _textStyle,
                                  ),
                                  Text(
                                    '${_user.email ?? ''}',
                                    style: _textStyle,
                                  ),
                                ],
                              ),
                              Text('${_user.phone ?? ''}', style: _textStyle)
                            ],
                          ),
                        ),
                      ),
                      if (_user.address != null)
                        ListTile(
                          title: Text('Address',
                              style: _textStyle.copyWith(
                                  fontWeight: FontWeight.bold)),
                          subtitle: DefaultTextStyle(
                            style: _textStyle,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Street: ${_user.address!.street ?? ''}'),
                                Text('Suit: ${_user.address!.suite ?? ''} '),
                                Text('City: ${_user.address!.city ?? ''}'),
                                Text(
                                    'Zipcode: ${_user.address!.zipcode ?? ''}'),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
