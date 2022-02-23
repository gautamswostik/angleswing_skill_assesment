import 'package:angleswing_skill_assesment/application/core/entities/failure.dart';
import 'package:flutter/material.dart';

///
class CustomErrorView extends StatelessWidget {
  ///
  const CustomErrorView({
    Key? key,
    required this.failure,
    required this.retry,
  }) : super(key: key);

  ///
  final Failure failure;
  final void Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Margin
          const SizedBox(height: 24.0),

          // Margin
          const SizedBox(height: 24.0),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                failure.reason,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),

          // Margin
          const SizedBox(height: 24.0),

          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 25,
                  color: const Color(0xFF59618B).withOpacity(0.17),
                ),
              ],
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 16.0,
                ),
              ),
              onPressed: retry,
              child: Text(
                'retry'.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

          // Margin
          const SizedBox(height: 24.0),

          //
        ],
      ),
    );
  }
}
