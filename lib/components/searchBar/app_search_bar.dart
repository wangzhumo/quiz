import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/utils/size_extension.dart';

class AppSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const AppSearchBar({
    super.key,
    this.borderRadius = 10,
    this.autoFocus = false,
    this.focusNode,
    this.controller,
    this.height = 40,
    this.value,
    this.leading,
    this.backgroundColor,
    this.searchBackgroundColor,
    this.suffix,
    this.actions = const [],
    this.hintText,
    this.hintTextStyle,
    this.searchTextStyle,
    this.onTap,
    this.onClear,
    this.onCancel,
    this.onChanged,
    this.onSearch,
    this.onSearchTap,
    this.searchAction
  });

  final double? borderRadius;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  final double height;

  final String? value;

  final Widget? leading;
  final Widget? searchAction;

  final Color? backgroundColor;
  final Color? searchBackgroundColor;

  final Widget? suffix;

  final List<Widget> actions;

  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? searchTextStyle;

  final VoidCallback? onTap;

  final VoidCallback? onClear;

  final VoidCallback? onCancel;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSearch;

  final VoidCallback? onSearchTap;

  @override
  AppBarSearchState createState() => AppBarSearchState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppBarSearchState extends State<AppSearchBar> {
  TextEditingController? _controller;
  FocusNode? _focusNode;

  bool get isFocus => _focusNode?.hasFocus ?? false;

  bool get isTextEmpty => _controller?.text.isEmpty ?? false;

  bool get isActionEmpty => widget.actions.isEmpty;

  bool isShowCancel = false;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    if (widget.value != null) _controller?.text = widget.value ?? "";
    _focusNode?.addListener(() {
      setState(() {});
    });

    _controller?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // 清除输入框内容
  void _onClearInput() {
    setState(() {
      _controller?.clear();
    });
    widget.onClear?.call();
  }

  void _onCancelInput() {
    setState(() {
      _controller?.clear();
      _focusNode?.unfocus(); //失去焦点
    });
    // 执行onCancel
    widget.onCancel?.call();
  }

  Widget _suffix() {
    if (!isTextEmpty) {
      return InkWell(
        onTap: _onClearInput,
        child: SizedBox(
          width: widget.height,
          height: widget.height,
          child: const Icon(Icons.cancel, size: 22, color: Color(0xFF999999)),
        ),
      );
    }
    return widget.suffix ?? const SizedBox();
  }
  List<Widget> _actions() {
    List<Widget> list = [];
    if (!isTextEmpty) {
      list.add(InkWell(
        onTap: widget.onSearchTap ?? _onCancelInput,
        child: Container(
          constraints: BoxConstraints(minWidth: 48.w),
          alignment: Alignment.center,
          child: widget.searchAction ?? const Text(
            'Search ',),
        ),
      ));
    } else if (!isActionEmpty) {
      list.addAll(widget.actions);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 40.w,
      leading: widget.leading ?? InkWell(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onTap: () {
          GoRouter.of(context).pop();
        },
      ),
      title: Container(
          margin: EdgeInsetsDirectional.only(end: 10.w),
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.searchBackgroundColor ?? const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
          ),
          child: Row(
            children: [
              SizedBox(
                width: widget.height,
                height: widget.height,
                child:
                Icon(Icons.search, size: 20.w),
              ),
              Expanded(
                // 权重
                flex: 1,
                child: TextField(
                  autofocus: widget.autoFocus ?? false,
                  // 是否自动获取焦点
                  focusNode: _focusNode,
                  // 焦点控制
                  controller: _controller,
                  // 与输入框交互控制器
                  //装饰
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: widget.hintText ?? 'Input Keyword',
                    hintStyle:  widget.hintTextStyle ?? TextStyle(
                        fontSize: 13.sp),
                  ),
                  style: widget.searchTextStyle ?? TextStyle(
                    fontSize: 13.sp,
                  ),
                  textInputAction: TextInputAction.search,
                  onTap: widget.onTap,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSearch,
                ),
              ),
              _suffix(),
            ],
          )),
      actions: _actions(),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }
}
