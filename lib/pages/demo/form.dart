import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mfa/utils/logger.dart';
import 'package:mfa/widgets/basic/app_bar.dart';
import 'package:mfa/widgets/basic/button.dart';
import 'package:mfa/widgets/basic/safe_scroll_view.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  final _emailFieldKey = GlobalKey<FormBuilderFieldState>(); //定义表单元素的key

  void _onChanged(dynamic val) => debugPrint(val.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppBar(title: '表单'),
        body: SafeScrollView(
          child: FormBuilder(
            key: _formKey,
            initialValue: const {
              "email": "1870894297@qq.com",
              "password": "123456",
            },
            child: Column(
              children: [
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _emailFieldKey,
                  name: 'email',
                  // initialValue: '1870894297@qq.com',
                  decoration: const InputDecoration(labelText: '邮箱'),
                  // 用库的效验
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                  // validator: (val) {
                  //   // 自定义效验
                  //   // debugPrint(
                  //   //     _formKey.currentState?.fields['password']?.value); 打印其他字段
                  //   // debugPrint(val); 打印当前字段
                  //   if (val == null) {
                  //     return '请输入';
                  //   }
                  //   return null;
                  //   // return null;
                  // },
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  name: 'password',
                  decoration: const InputDecoration(labelText: '密码'),
                  obscureText: true,
                  // initialValue: '123456',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(10),
                  ]),
                ),
                const SizedBox(height: 10),
                FormBuilderCheckboxGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(labelText: '语言'),
                  name: 'languages',
                  // initialValue: const ['Dart'],
                  options: const [
                    FormBuilderFieldOption(value: 'Dart'),
                    FormBuilderFieldOption(value: 'Kotlin'),
                    FormBuilderFieldOption(value: 'Objective-C'),
                  ],
                  onChanged: _onChanged,
                  separator: const VerticalDivider(
                    width: 10,
                    thickness: 5,
                    color: Colors.red,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(1),
                    FormBuilderValidators.maxLength(3),
                  ]),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button('submit', onPressed: () {
                      // debugPrint(_emailFieldKey.currentState?.value);
                      // _formKey.currentState?.saveAndValidate();
                      // debugPrint(_formKey.currentState?.value.toString());
                      _formKey.currentState?.validate();
                      debugPrint(
                          _formKey.currentState?.instantValue.toString());
                      logger.w(_emailFieldKey.currentState?.value);
                    }),
                    const SizedBox(width: 30),
                    Button('reset', onPressed: () {
                      _formKey.currentState?.reset();
                    })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
