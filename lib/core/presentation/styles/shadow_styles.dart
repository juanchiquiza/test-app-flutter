import 'package:flutter/material.dart';
import 'package:test_app/core/presentation/styles/colors_app.dart';

/// Shadow used in cards
final cardShadow = <BoxShadow>[
  BoxShadow(
    blurRadius: 7,
    color: Colors.black.withOpacity(0.10),
    offset: const Offset(0, 3),
  ),
];
