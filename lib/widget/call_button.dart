import 'package:flutter/material.dart';

import '../utils/url_utils.dart';

class CallButton extends StatelessWidget {
  final String _url;
  final Color _colour;

  const CallButton(this._url, this._colour);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints.tightFor(width: 24, height: 24),
      padding: const EdgeInsets.all(0),
      icon: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.call, color: _colour),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.call_made,
              size: 16,
              color: _colour
            ),
          )
        ],
      ),
      onPressed: () => UrlUtils.launchWithBrowser(_url),
    );
  }
}
