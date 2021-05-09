import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

/// A quick example "keyboard" widget for picking a color.
class ColorPickerKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<Color>
    implements PreferredSizeWidget {
  final ValueNotifier<Color> notifier;
  static const double _kKeyboardHeight = 200;

  ColorPickerKeyboard({Key? key, required this.notifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double rows = 3;
    final double screenWidth = MediaQuery.of(context).size.width;
    final int colorsCount = Colors.primaries.length;
    final int colorsPerRow = (colorsCount / rows).ceil();
    final double itemWidth = screenWidth / colorsPerRow;
    final double itemHeight = _kKeyboardHeight / rows;

    return Container(
      height: _kKeyboardHeight,
      child: Wrap(
        children: <Widget>[
          for (final color in Colors.primaries)
            GestureDetector(
              onTap: () {
                updateValue(color);
              },
              child: Container(
                color: color,
                width: itemWidth,
                height: itemHeight,
              ),
            )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_kKeyboardHeight);
}

/// A quick example "keyboard" widget for Counter.
class CounterKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  final ValueNotifier<String> notifier;

  CounterKeyboard({Key? key, required this.notifier}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                int value = int.tryParse(notifier.value) ?? 0;
                value--;
                updateValue(value.toString());
              },
              child: FittedBox(
                child: Text(
                  "-",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                int value = int.tryParse(notifier.value) ?? 0;
                value++;
                updateValue(value.toString());
              },
              child: FittedBox(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A quick example "keyboard" widget for Numeric.
class NumericKeyboard extends StatelessWidget
    with KeyboardCustomPanelMixin<String>
    implements PreferredSizeWidget {
  final ValueNotifier<String> notifier;
  final FocusNode focusNode;

  NumericKeyboard({
    Key? key,
    required this.notifier,
    required this.focusNode,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(280);

  String _formatValue(String value) {
    try {
      value.toInt();
      return value;
    } catch (e) {
      return '0';
    }
    // final updatedValue = double.parse(value).toInt().toString();
    // final finalValue = updatedValue.substring(0, updatedValue.length - 2) +
    //     "." +
    //     updatedValue.substring(updatedValue.length - 2, updatedValue.length);
    // return value;
  }

  void _onTapNumber(String value) {
    if (value == "Done") {
      focusNode.unfocus();
      return;
    }
    // final currentValue = notifier.value.replaceAll(".", "");
    final temp = notifier.value + value;
    updateValue(_formatValue(temp));
  }

  void _onTapBackspace() {
    if (notifier.value.length <= 1) {
      notifier.value = "";
      updateValue("");
      return;
    }

    final currentValue = notifier.value.replaceAll(".", "");
    final temp = currentValue.substring(0, currentValue.length - 1);
    updateValue(_formatValue(temp));
  }

  void _onLongTapBackspace() {
    notifier.value = "";
    updateValue("");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Color(0xFF313131),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            _buildButton(text: "7"),
            _buildButton(text: "8"),
            _buildButton(text: "9"),
            _buildButton(text: "4"),
            _buildButton(text: "5"),
            _buildButton(text: "6"),
            _buildButton(text: "1"),
            _buildButton(text: "2"),
            _buildButton(text: "3"),
            _buildButton(text: "", icon: Icons.backspace, color: Colors.black),
            _buildButton(text: "0"),
            _buildButton(text: "Done", color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    IconData? icon,
    Color? color,
  }) =>
      NumericButton(
        text: text,
        icon: icon,
        color: color,
        onTap: () => icon != null ? _onTapBackspace() : _onTapNumber(text),
        longTap: () => icon != null ? _onLongTapBackspace() : null,
      );
}

class NumericButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;
  final VoidCallback? longTap;

  const NumericButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.longTap,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.blue,
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        onLongPress: longTap,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
