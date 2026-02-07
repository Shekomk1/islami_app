import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:islami_app/core/extension/padding_extension.dart';
import 'package:islami_app/core/gen/assets.gen.dart';
import 'package:islami_app/models/sura_data.dart';

class Suracardwidgets extends StatelessWidget {
  final Function onTap;
  final SuraData suraData;

  const Suracardwidgets({
    super.key,
    required this.suraData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Bounceable(
      onTap: () {
        onTap.call();
      },

      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.icons.suraNumber.provider(),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              suraData.suraNumber,
              style: theme.textTheme.titleMedium?.copyWith(),
            ),
          ),
          SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(suraData.suraNameEN, style: theme.textTheme.titleLarge),
              Text(
                "${suraData.suraVersesCount} Verses",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          Spacer(),
          Text(suraData.suraNameAR, style: theme.textTheme.titleLarge),
        ],
      ).setHorizontalPaddingOnWidget(20),
    );
  }
}
