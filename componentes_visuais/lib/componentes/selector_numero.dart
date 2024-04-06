import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NumberTextField extends StatefulWidget {
  final TextEditingController? controller;
  final int min;
  final int max;
  final int step;
  final double arrowsWidth;
  final double arrowsHeight;
  final EdgeInsets contentPadding;
  final double borderWidth;
  final ValueChanged<int?>? onChanged;
  final Function(int valor) aoDigitar;

  const NumberTextField({
    Key? key,
    this.controller,
    this.min = 0,
    this.max = 999,
    this.step = 1,
    this.arrowsWidth = 24,
    this.arrowsHeight = kMinInteractiveDimension,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.borderWidth = 2,
    this.onChanged,
    required this.aoDigitar,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberTextFieldState(aoDigitar);
}

class _NumberTextFieldState extends State<NumberTextField> {
  late TextEditingController _controller;
  bool _canGoUp = false;
  bool _canGoDown = false;
  final Function(int valor) aoDigitar;

  _NumberTextFieldState(this.aoDigitar);

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  void didUpdateWidget(covariant NumberTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller = widget.controller ?? _controller;
    _updateArrows(int.tryParse(_controller.text));
  }

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.black.withOpacity(0.1),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              controller: _controller,
              keyboardType: TextInputType.number,
              maxLines: 1,
              onChanged: (value) {
                final intValue = int.tryParse(value);
                widget.onChanged?.call(intValue);
                _updateArrows(intValue);

                if (intValue != null) {
                  aoDigitar(intValue);
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
            width: 40,
          ),
          Container(
            width: 20,
            height: 50,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                              child: Opacity(
                                  opacity: _canGoUp ? 1 : .5,
                                  child: const Icon(Icons.arrow_drop_up)),
                              onTap: _canGoUp ? () => _update(true) : null))),
                  Expanded(
                      child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                              child: Opacity(
                                  opacity: _canGoDown ? 1 : .5,
                                  child: const Icon(Icons.arrow_drop_down)),
                              onTap:
                                  _canGoDown ? () => _update(false) : null))),
                ]),
          )
        ],
      );

  void _update(bool up) {
    var intValue = int.tryParse(_controller.text);
    intValue == null
        ? intValue = 0
        : intValue += up ? widget.step : -widget.step;
    _controller.text = intValue.toString();
    _updateArrows(intValue);
    aoDigitar(intValue);
  }

  void _updateArrows(int? value) {
    final canGoUp = value == null || value < widget.max;
    final canGoDown = value == null || value > widget.min;
    if (_canGoUp != canGoUp || _canGoDown != canGoDown)
      setState(() {
        _canGoUp = canGoUp;
        _canGoDown = canGoDown;
      });
  }
}

class _NumberTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  _NumberTextInputFormatter(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (const ['-', ''].contains(newValue.text)) return newValue;
    final intValue = int.tryParse(newValue.text);
    if (intValue == null) return oldValue;
    if (intValue < min) return newValue.copyWith(text: min.toString());
    if (intValue > max) return newValue.copyWith(text: max.toString());
    return newValue.copyWith(text: intValue.toString());
  }
}
