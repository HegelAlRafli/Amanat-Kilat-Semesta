import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, this.isOnePage = false}) : super(key: key);

  final bool? isOnePage; // khusus buat loading 1 page
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: isOnePage! ? Colors.white : Colors.white.withOpacity(0.55),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
