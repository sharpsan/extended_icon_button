import 'dart:async';

import 'package:flutter/material.dart';

/// Adds [onLongPress] and [onLongHold] to [IconButton].
class IconButtonExtended extends StatefulWidget {
  const IconButtonExtended({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize,
    this.visualDensity,
    this.padding,
    this.alignment,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback,
    this.constraints,
    this.style,
    this.isSelected,
    this.selectedIcon,
    this.onLongPress,
    this.onLongHold,
    this.longHoldDebounce = const Duration(milliseconds: 200),
  });

  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? splashRadius;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final void Function()? onPressed;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? tooltip;
  final bool? enableFeedback;
  final BoxConstraints? constraints;
  final ButtonStyle? style;
  final bool? isSelected;
  final Widget? selectedIcon;
  final Widget icon;
  final VoidCallback? onLongPress;
  final VoidCallback? onLongHold;
  final Duration longHoldDebounce;

  @override
  State<IconButtonExtended> createState() => _IconButtonExtendedState();
}

class _IconButtonExtendedState extends State<IconButtonExtended> {
  Timer? _longHoldTimer;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerUp: (_) {
          _handleLongPressEnd();
        },
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () {
            widget.onLongPress?.call();
            _handleLongPressStart();
          },
          child: IconButton(
            icon: widget.icon,
            onPressed: widget.onPressed,
            iconSize: widget.iconSize,
            visualDensity: widget.visualDensity,
            padding: widget.padding,
            alignment: widget.alignment,
            splashRadius: widget.splashRadius,
            color: widget.color,
            focusColor: widget.focusColor,
            hoverColor: widget.hoverColor,
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            disabledColor: widget.disabledColor,
            mouseCursor: widget.mouseCursor,
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            tooltip: widget.tooltip,
            enableFeedback: widget.enableFeedback,
            constraints: widget.constraints,
            style: widget.style,
            isSelected: widget.isSelected,
            selectedIcon: widget.selectedIcon,
          ),
        ),
      ),
    );
  }

  void _handleLongPressStart() {
    widget.onLongHold?.call();
    _longHoldTimer = Timer.periodic(widget.longHoldDebounce, (timer) {
      widget.onLongHold?.call();
    });
  }

  void _handleLongPressEnd() {
    _longHoldTimer?.cancel();
  }
}
