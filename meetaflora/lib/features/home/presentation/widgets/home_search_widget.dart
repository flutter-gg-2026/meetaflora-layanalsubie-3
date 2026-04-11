import 'package:flutter/material.dart';
import 'package:meetaflora/core/constants/app_colors.dart';

class HomeSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  const HomeSearchWidget({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'search for a plant ...',
          hintStyle: TextStyle(color: AppColors.textSecondary),
          prefixIcon: Icon(Icons.search, color: Color(0xff165D33)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff165D33)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff165D33)),
            borderRadius: BorderRadius.circular(40),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
