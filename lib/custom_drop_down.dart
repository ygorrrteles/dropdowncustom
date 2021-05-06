import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<TagModel> tagList;

  const CustomDropDown({Key key, this.tagList}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  ExpandableController controller;
  bool rotateIcon = false;

  @override
  void initState() {
    controller = ExpandableController(initialExpanded: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: controller,
      child: ScrollOnExpand(
        child: PhysicalModel(
          elevation: 4,
          color: Colors.white,
          child: Expandable(
            ///collapsed
            collapsed: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Wrap(
                        children: List.generate(
                          widget.tagList.where((e) => e.selected == true).length,
                          (index) => InputChip(
                            label: Text(widget.tagList.where((e) => e.selected == true).toList()[index].label),
                            onPressed: () {
                              setState(() {
                                widget.tagList.where((e) => e.selected == true).toList()[index].selected =
                                    !widget.tagList.where((e) => e.selected == true).toList()[index].selected;
                              });
                            },
                            onDeleted: () {
                              widget.tagList.where((e) => e.selected == true).toList()[index].selected =
                                  !widget.tagList.where((e) => e.selected == true).toList()[index].selected;
                            },
                          ),
                        ),
                      )),
                      Transform.rotate(
                        angle: rotateIcon ? 3.1451 * 1.5 : 3.1451 * 0.5,
                        child: IconButton(
                          onPressed: () {
                            controller.toggle();
                            setState(() {
                              rotateIcon = controller.value;
                            });
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromRGBO(0, 106, 106, 1),
                  )
                ],
              ),
            ),

            ///expanded
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Wrap(
                            children: List.generate(
                              widget.tagList.where((e) => e.selected == true).length,
                              (index) => InputChip(
                                label: Text(widget.tagList.where((e) => e.selected == true).toList()[index].label),
                                onPressed: () {
                                  setState(() {
                                    widget.tagList.where((e) => e.selected == true).toList()[index].selected =
                                        !widget.tagList.where((e) => e.selected == true).toList()[index].selected;
                                  });
                                },
                                onDeleted: () {},
                              ),
                            ),
                          )),
                          Transform.rotate(
                            angle: rotateIcon ? 3.1451 * 1.5 : 3.1451 * 0.5,
                            child: IconButton(
                              onPressed: () {
                                controller.toggle();
                                setState(() {
                                  rotateIcon = controller.value;
                                });
                              },
                              icon: Icon(Icons.arrow_back_ios_rounded),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Color.fromRGBO(0, 106, 106, 1),
                      )
                    ],
                  ),
                ),
                Column(
                    children: List.generate(
                        widget.tagList.length,
                        (index) => FlatButton(
                              color: widget.tagList[index].selected ? Colors.grey[300] : null,
                              onPressed: () {
                                setState(() {
                                  widget.tagList[index].selected = !widget.tagList[index].selected;
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                child: Text(widget.tagList[index].label),
                              ),
                            ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagModel {
  int id;
  String label;
  bool selected;

  TagModel({
    this.id,
    this.label,
    this.selected = false,
  });
}
