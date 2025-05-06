import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.createdDate,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed,
  });
  final int id;
  final String title;
  final String description;
  final String createdDate;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final background = Container(
      padding: const EdgeInsets.only(left: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),

      child: const Icon(Icons.delete, color: Colors.white),
    );

    final secondaryBackground = Container(
      padding: const EdgeInsets.only(right: 10),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.delete, color: Colors.white),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),

      child: Dismissible(
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          onDismissed();
        },
        background: background,
        secondaryBackground: secondaryBackground,
        key: ValueKey(id),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.antiAlias,

            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: onTap,
              onLongPress: onLongPress,
              title: Text(title),
              subtitle: Text(description, maxLines: 1),

              trailing: Text(createdDate),
            ),
          ),
        ),
      ),
    );
  }
}
