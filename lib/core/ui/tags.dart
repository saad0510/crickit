import 'package:flutter/material.dart';

import '../../app/sizer.dart';
import '../../features/teams/entities/team_position.dart';
import '../../features/teams/entities/team_role.dart';

class TeamPositionTag extends StatelessWidget {
  final TeamPosition position;

  const TeamPositionTag(this.position, {super.key});

  @override
  Widget build(BuildContext context) {
    return LabelTag(
      title: position.toString(),
      color: position.color,
    );
  }
}

class TeamRoleTag extends StatelessWidget {
  final TeamRole role;

  const TeamRoleTag(this.role, {super.key});

  @override
  Widget build(BuildContext context) {
    return LabelTag(
      title: role.toString(),
      color: role.color,
    );
  }
}

class LabelTag extends StatelessWidget {
  const LabelTag({
    super.key,
    required this.title,
    required this.color,
    this.backgroundColor,
    this.shrink = true,
  });

  final String title;
  final Color color;
  final Color? backgroundColor;
  final bool shrink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: backgroundColor ?? color,
        border: Border.all(color: color, width: backgroundColor == null ? 0 : 1),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: shrink ? AppPaddings.tinyX : EdgeInsets.symmetric(horizontal: 8.sp, vertical: 3.sp),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: shrink ? 12.sp : 13.sp,
            fontWeight: FontWeight.w600,
            color: backgroundColor == null ? Colors.white : color,
          ),
        ),
      ),
    );
  }
}

extension TeamPositionColors on TeamPosition {
  Color get color {
    return switch (this) {
      TeamPosition.captain => Colors.black,
      TeamPosition.viceCaptain => Colors.teal,
      TeamPosition.member => Colors.deepOrange,
    };
  }
}

extension TeamRoleColors on TeamRole {
  Color get color {
    return switch (this) {
      TeamRole.batsman => Colors.blue,
      TeamRole.bowler => Colors.red,
      TeamRole.wicketKeeper => Colors.teal,
      TeamRole.allRounder => Colors.deepPurple,
    };
  }
}
