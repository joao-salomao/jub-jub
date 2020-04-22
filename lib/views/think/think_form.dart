import 'package:flutter/material.dart';
import 'package:potato_notes/entities/think.dart';
import 'package:potato_notes/utils/navigation.dart';
import 'package:potato_notes/views/widgets/app_text_form_field.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

showThinkForm({
  @required BuildContext context,
  Think think,
  Function onChangeColor,
  Function onChangeTitle,
  Function onCancel,
  @required Function onSubmit,
}) async {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController =
      TextEditingController(text: think != null ? think.title : "");
  Color _color = think != null ? think.color : Colors.black;

  if (onChangeTitle != null) {
    _titleController.addListener(() {
      onChangeTitle(_titleController.text);
    });
  }

  final formTitle = think == null ? "Criando Think" : "Editando Think";

  return showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    builder: (_) {
      return AlertDialog(
        title: Center(child: Text(formTitle)),
        content: Container(
          height: 280,
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: AppTextFormField(
                  "Título",
                  "Digite o título do seu pensamento",
                  controller: _titleController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "É obrigatório dar um título ao seu Pensamento";
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: MaterialColorPicker(
                  onColorChange: (Color newColor) {
                    _color = newColor;

                    if (onChangeColor != null) {
                      onChangeColor(newColor);
                    }

                    if (think != null) {
                      think.color = newColor;
                    }
                  },
                  selectedColor: think != null ? think.color : _color,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Fechar"),
            onPressed: () {
              if (onCancel != null) {
                onCancel();
              }
              pop(_);
            },
          ),
          FlatButton(
            child: Text("Salvar"),
            onPressed: () {
              onSubmit(
                _titleController.text,
                _color,
              );
              pop(context);
            },
          ),
        ],
      );
    },
  );
}
