import 'package:flutter/material.dart';
import 'package:zens_test/resources/app_colors.dart';
import 'package:zens_test/resources/text_data.dart';
import 'package:zens_test/view_models/cart_view_model.dart';

import '../../../resources/app_text_style.dart';

/// A widget that displays a note section in the cart.
///
/// This widget is used to display a note section in the cart view. It includes a text field where the user can enter notes about their order.
/// The [cartViewModel] parameter is required and represents the view model for the cart.
/// The [noteFocusNode] parameter is required and represents the focus node for the note text field.
/// The [noteController] parameter is required and represents the controller for the note text field.
/// The [key] parameter is optional and represents the key for the widget.

class WidgetNoteCart extends StatelessWidget {
  final CartViewModel cartViewModel;
  final FocusNode noteFocusNode;
  final TextEditingController noteController;
  const WidgetNoteCart(
      this.cartViewModel, this.noteFocusNode, this.noteController,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 28,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TextData.noteText,
                  style: AppTextStyle.cartOptionTextStyle,
                ),
                SizedBox(width: 4),
                Text(
                  TextData.notHaveTo,
                  style: AppTextStyle.drinkDescriptionTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: noteController,
            focusNode: noteFocusNode,
            decoration: InputDecoration(
              filled: true,
              hintText: TextData.noteHere,
              hintStyle: AppTextStyle.drinkDescriptionTextStyle,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: AppColors.bgNote,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          const SizedBox(
            width: 356,
            child: Text(
              TextData.noteDescription,
              style: AppTextStyle.noteDescriptionTextStyle,
            ),
          ),
          noteFocusNode.hasFocus
              ? const SizedBox(height: 300)
              : const SizedBox(height: 80),
        ],
      ),
    );
  }
}
