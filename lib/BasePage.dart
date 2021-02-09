import 'dart:ui';

import 'package:drink_reason/BaseModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<BaseModel>(
      model: baseModel,
      child: ScopedModelDescendant(
          builder: (BuildContext context, Widget inWidget, BaseModel inModel) {
        return Scaffold(
            backgroundColor: Colors.pink[100],
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 20),
                      child: Text(
                        inModel.text,
                        style: SmallTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 100,
                          maxWidth: MediaQuery.of(context).size.width - 20),
                      child: Text(
                        inModel.phrase,
                        style: NewTextStyle,
                      ),
                    ),
                    Container(
                      child: Transform(
                        transform: Matrix4.rotationY(inModel.arg),
                        child: Image.asset("assets/images/kanye.png"),
                        alignment: Alignment.center,
                      ),
                      height: 200,
                    ),
                    RaisedButton(
                      child: Text("Жми"),
                      onPressed: () {
                        inModel.changeString();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ));
      }),
    );
  }
}

const NewTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 20,
  backgroundColor: Colors.white,
  letterSpacing: 1,
);

const SmallTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15,
);
