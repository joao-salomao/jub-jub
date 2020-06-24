import 'package:toast/toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:jubjub/utils/navigation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jubjub/models/think_model.dart';
import 'package:jubjub/views/widgets/app_alert.dart';
import 'package:jubjub/models/annotation_model.dart';
import 'package:jubjub/views/widgets/app_alert_dialog.dart';
import 'package:jubjub/views/annotation/annotation_form.dart';
import 'package:jubjub/views/widgets/app_text_form_field.dart';
import 'package:jubjub/controllers/annotation_controller.dart';
import 'package:jubjub/views/annotation/annotation_file_list.dart';
import 'package:jubjub/views/widgets/app_bottom_audio_player.dart';

class AnnotationPage extends StatefulWidget {
  final ThinkModel think;
  final AnnotationModel annotation;
  final AnnotationController annotationController;
  AnnotationPage(
    this.annotation,
    this.think,
    this.annotationController,
  );

  @override
  _AnnotationPageState createState() => _AnnotationPageState();
}

class _AnnotationPageState extends State<AnnotationPage> {
  ThinkModel get think => widget.think;
  AnnotationModel get annotation => widget.annotation;
  AnnotationController get annotationController => widget.annotationController;

  _onClickEdit() {
    push(
      context,
      AnnotationForm(
        think,
        annotation: annotation,
      ),
    );
  }

  _onClickDelete() {
    alert(
      context,
      "Você tem certeza ?",
      "Essa anotação será deletada permanentemente.",
      callback: () {
        annotationController.deleteAnnotation(annotation);
        pop(context);
      },
    );
  }

  _onClickLockOrUnlock() {
    final isUnlocking = annotation.password != null ? true : false;

    if (isUnlocking) {
      return alert(
        context,
        "Você tem certeza ?",
        "A senha da anotação será removida.",
        callback: () => _updatePassword(null),
      );
    }

    final formKey = GlobalKey<FormState>();
    final passwordController = TextEditingController();
    final rePasswordController = TextEditingController();
    return showDialog(
      context: context,
      builder: (_) {
        return Observer(
          builder: (_) {
            return AppAlertDialog(
              title: "Cadastrando senha",
              content: Container(
                height: 190,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        "Digite a senha desejada",
                        "",
                        controller: passwordController,
                        cursorColor: annotation.color,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Campo obrigatório*";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextFormField(
                        "Digite a senha novamente",
                        "",
                        controller: rePasswordController,
                        cursorColor: annotation.color,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Campo obrigatório*";
                          }

                          if (value != passwordController.text) {
                            return "As senhas não coincidem";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              onClose: () => pop(context),
              onSave: () {
                if (formKey.currentState.validate()) {
                  _updatePassword(passwordController.text.trim());
                  pop(context);
                }
              },
            );
          },
        );
      },
    );
  }

  _updatePassword(String value) {
    annotation.password = value;
    annotationController.appController.annotationDAO.save(annotation);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              annotation.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            backgroundColor: annotation.color,
            actions: [
              IconButton(
                icon: annotation.password == null
                    ? Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                onPressed: _onClickLockOrUnlock,
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: _onClickEdit,
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: _onClickDelete,
              ),
            ],
          ),
          bottomNavigationBar: AppBottomAudioPlayer(),
          body: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        child: AnnotationFileList(
                          annotation,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: SelectableText(
                          annotation.text,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(
                                text: annotation.text +
                                    '\n' +
                                    "~ ${annotation.createdAt}",
                              ),
                            );
                            Toast.show(
                              "Anotação copiada",
                              context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM,
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          "~ ${annotation.createdAt}",
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
