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

  final formTitle = think == null ? "Criando Pasta" : "Editando Pasta";

  return showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    builder: (_) {
      return AlertDialog(
        title: Center(child: Text(formTitle)),
        contentPadding: EdgeInsets.all(10),
        content: Container(
          height: 310,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: AppTextFormField(
                    "Título",
                    "Digite o título da pasta",
                    controller: _titleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "É obrigatório dar um título para a pasta";
                      }
                      return null;
                    },
                  ),
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
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 40,
                  ),
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel();
                    }
                    pop(_);
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  icon: Icon(
                    Icons.save,
                    size: 40,
                  ),
                  onPressed: () {
                    onSubmit(
                      _titleController.text,
                      _color,
                    );
                    pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
