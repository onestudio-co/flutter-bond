import 'package:flutter/material.dart';
import 'package:taleb/core/resources/taleb_sizes.dart';

class TalebImageNews extends StatelessWidget {
  const TalebImageNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
        ),
      ),
      child: SizedBox(
        height: TalebSizes.h240,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
