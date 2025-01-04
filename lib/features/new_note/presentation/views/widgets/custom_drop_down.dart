// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:notify/core/utils/app_theme.dart';
// import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';

// import '../../../../../core/utils/styles.dart';
// import '../../model_views/form/form_cubit.dart';

// class CustomDropDown extends StatelessWidget {
//   final String hint;
//   final List<DropdownMenuItem<dynamic>> list;
//   final bool remind;
//   const CustomDropDown(
//       {Key? key, required this.hint, required this.list, this.remind = true})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final formData = BlocProvider.of<FormCubit>(context);
//     return Container(
//       margin: const EdgeInsets.only(top: 5),
//       padding: const EdgeInsets.only(left: 10, right: 5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(width: 1.2, color: Colors.grey)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(hint, style: Styles.title15Light),
//           DropdownButton(
//             underline: const SizedBox(),
//             dropdownColor: context.watch<ThemeCubit>().getIsDark
//                 ? AppTheme.darkBlue
//                 : AppTheme.lightBlue,
//             icon: const Icon(
//               Icons.keyboard_arrow_down_rounded,
//               size: 25,
//               color: Colors.grey,
//             ),
//             items: list,
//             onChanged: ((value) {
//               if (remind) {
//                 formData.setSelectedRemind = value!;
//               } else {
//                 formData.setSelectedRepeat = value!;
//               }
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
