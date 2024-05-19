import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_color.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
    this.sufixText = "See all",
    this.onSufixClick,
  });

  final String title;
  final String sufixText;
  final void Function()? onSufixClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        InkWell(
          onTap: onSufixClick,
          child: Text(
            sufixText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
