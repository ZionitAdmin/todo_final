import 'package:flutter/material.dart';
import 'package:todo_practica_final/widgets/custom_container.dart';

class MyDrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? leading;
  final bool isSelected;
  final String? subTitle;
  final Function()? onTap;

  const MyDrawerItem({
    super.key,
    required this.title,
    this.icon = Icons.label,
    this.leading,
    this.isSelected = false,
    this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomContainer(
      color: (isSelected) ? theme.primaryColor : Colors.transparent,
      borderVariant: BorderVariant.end,
      child: ListTile(
        onTap: onTap,
        trailing: leading,
        leading: Icon(icon,
            color: (isSelected) ? theme.colorScheme.onPrimary : null),
        title: Text(title,
            style: (isSelected)
                ? TextStyle(color: theme.colorScheme.onPrimary)
                : null),
        subtitle: (subTitle == null)
            ? null
            : Text(subTitle!,
                style: (isSelected)
                    ? TextStyle(color: theme.colorScheme.onPrimary)
                    : null),
      ),
    );
  }
}
