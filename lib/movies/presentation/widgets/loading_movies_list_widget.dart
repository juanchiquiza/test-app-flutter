import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import '/core/presentation/styles/colors_app.dart';
import '/core/presentation/styles/shadow_styles.dart';

/// Loading Movies list
class LoadingMoviesListWidget extends StatelessWidget {
  /// Constructor
  const LoadingMoviesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade300,
        child: ListView.builder(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, __) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              margin: const EdgeInsets.only(right: 12, left: 4),
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: cardShadow,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Row(
                  children: const [
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
