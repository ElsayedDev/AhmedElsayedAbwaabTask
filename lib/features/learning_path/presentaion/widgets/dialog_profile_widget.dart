import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forinterview/features/learning_path/data/models/models.dart';
import 'package:forinterview/features/learning_path/logic/bloc/learning_path_bloc.dart';

/// dialog widget after click on the card
///
class LearningProfileProfileCardDialog {
  /// recive the data form the [LearningPathWidget]
  const LearningProfileProfileCardDialog(
      {this.color = Colors.purple, this.gifURL = "assets/loading4.gif"});

  final Color color;
  final String gifURL;

  Widget render(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    /// responsive ui for other devices
    final _height = _size.height * 0.5;
    final _width = _size.width * 0.6;

    return BlocBuilder<LearningPathBloc, LearningPathState>(
      builder: (context, state) {
        /// recive only the selected one
        final UserModel _user = state.selectedUser!;

        return Dialog(
          child: SizedBox(
            height: _height,
            width: _width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// top Gif photo
                _DialogPhotoWIdget(
                    height: _height, color: color, gifURL: gifURL),

                /// the rest informations
                _DialogInfoWidget(height: _height, color: color, user: _user)
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DialogInfoWidget extends StatelessWidget {
  /// quick made a data in the UI, the best to repearate it
  const _DialogInfoWidget({
    Key? key,
    required double height,
    required this.color,
    required UserModel user,
  })  : _height = height,
        _user = user,
        super(key: key);

  final double _height;
  final Color color;
  final UserModel _user;

  @override
  Widget build(BuildContext context) {
    const TextStyle _textStyle = TextStyle(color: Colors.white);
    Widget _AddressInformationWidget() {
      if (_user.address != null)
        return ListTile(
          title: Text('Address',
              style: _textStyle.copyWith(fontWeight: FontWeight.bold)),
          subtitle: DefaultTextStyle(
            style: _textStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Street: ${_user.address!.street ?? ''}'),
                Text('Suit: ${_user.address!.suite ?? ''} '),
                Text('City: ${_user.address!.city ?? ''}'),
                Text('Zipcode: ${_user.address!.zipcode ?? ''}'),
              ],
            ),
          ),
        );
      return SizedBox();
    }

    return Container(
      height: _height * 0.45,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            title: Text(
              _user.name ?? '',
              style: _textStyle.copyWith(fontWeight: FontWeight.bold),
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
          _AddressInformationWidget()
        ],
      ),
    );
  }
}

class _DialogPhotoWIdget extends StatelessWidget {
  /// return the gif photo
  const _DialogPhotoWIdget({
    Key? key,
    required double height,
    required this.color,
    required this.gifURL,
  })  : _height = height,
        super(key: key);

  final double _height;
  final Color color;
  final String gifURL;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
