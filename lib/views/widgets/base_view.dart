import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/base_vm.dart';
import '../../locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({required this.builder, this.onModelReady, required Key key}) : super(key: key);

  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: model, child: Consumer<T>(builder: widget.builder));
  }
}