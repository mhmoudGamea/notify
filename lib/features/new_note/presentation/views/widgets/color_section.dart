import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_views/form/form_cubit.dart';
import 'label_text.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formData = BlocProvider.of<FormCubit>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelText(title: 'Color'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: formData.getNotesColor
              .map(
                (color) => GestureDetector(
                  onTap: () {
                    formData.setSelectedColor = color;
                  },
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: color,
                    child: context.watch<FormCubit>().getSelectedColor == color
                        ? const Icon(
                            Icons.done_rounded,
                            color: Colors.white,
                            size: 15,
                          )
                        : const SizedBox(),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
