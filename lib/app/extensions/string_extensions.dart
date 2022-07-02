import 'package:miuzik/app/packages/text_builder/text_builder.dart';

extension StringX on String {
  TextBuilder get text => TextBuilder(this);
}
