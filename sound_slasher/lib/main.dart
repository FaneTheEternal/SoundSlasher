import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

const VKSVG = 'assets/SVG/VK.com-logo.svg';
const DiscordSVG = 'assets/SVG/Discord-Logo-Color.svg';
const ChromeSVG = 'assets/SVG/Google_Chrome_icon.svg';
const SpotyfySVG = 'assets/SVG/spotify_Logo.svg';
const InstagramSVG = 'assets/SVG/instagram.svg';
const TelegramSVG = 'assets/SVG/Telegram_logo.svg';

const ANDROID_CHANNEL = 'sound_slasher.flutter.dev/sound_slasher';

void main() {
  runApp(SoundSlasherApp());
}

class SoundSlasherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SoundSlasher(),
    );
  }
}

class SoundSlasher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sound Slasher',
            style: TextStyle(
              fontFamily: 'Space Superstars',
              fontSize: 28,
            ),
          ),
        ),
      ),
      body: Sliders(),
    );
  }
}

class Sliders extends StatefulWidget {
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SoundAppSlider(
              svg: VKSVG,
            ),
            SoundAppSlider(
              svg: DiscordSVG,
            ),
            SoundAppSlider(
              svg: ChromeSVG,
            ),
            SoundAppSlider(
              svg: SpotyfySVG,
            ),
            SoundAppSlider(
              svg: InstagramSVG,
            ),
            SoundAppSlider(
              svg: TelegramSVG,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Divider(
          color: Colors.black,
          height: 50,
          thickness: 5,
          indent: 30,
          endIndent: 30,
        ),
        Row(
          children: [
            SoundSystemSlider(
                icon: Icons.notifications
            ),
            SoundSystemSlider(
              icon: Icons.call,
            ),
            SoundSystemSlider(
              icon: Icons.alarm,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}

class SoundAppSlider extends StatefulWidget {
  final String svg;

  SoundAppSlider({this.svg});

  @override
  _SoundAppSliderState createState() => _SoundAppSliderState();
}

class _SoundAppSliderState extends State<SoundAppSlider> {
  double _currentValue = 20;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: -1,
              child: Slider(
                value: _currentValue,
                min: 0,
                max: 100,
                label: _currentValue.round().toString(),
                onChanged: (double newValue) {
                  setState(() {
                    _currentValue = newValue;
                  });
                },
              ),
            ),
            Container(
              child: SvgPicture.asset(
                widget.svg,
                width: 50,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SoundSystemSlider extends StatefulWidget {
  final IconData icon;

  SoundSystemSlider({this.icon});

  @override
  _SoundSystemSliderState createState() => _SoundSystemSliderState();
}

class _SoundSystemSliderState extends State<SoundSystemSlider> {
  double _currentValue = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              label: _currentValue.round().toString(),
              onChanged: (double newValue) {
                setState(() {
                  _currentValue = newValue;
                });
              },
            ),
          ),
          Icon(
            widget.icon,
            size: 50,
          )
        ],
      ),
    );
  }
}
