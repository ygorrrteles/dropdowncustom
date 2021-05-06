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

  List<TagModel> get tagModelListSelected => widget.tagList.where((e) => e.selected == true).toList();

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
                  Text(
                    'Label',
                    style: TextStyle(
                      color: tagModelListSelected.length == 0 ? Colors.redAccent : null,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: tagModelListSelected.length == 0
                            ? Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  'PlaceHolder',
                                  style: TextStyle(
                                    color: tagModelListSelected.length == 0 ? Colors.redAccent : null,
                                  ),
                                ),
                              )
                            : Wrap(
                                children: List.generate(
                                  tagModelListSelected.length,
                                  (index) => InputChip(
                                    label: Text(tagModelListSelected[index].label),
                                    onPressed: () {
                                      setState(() {
                                        tagModelListSelected[index].selected = !tagModelListSelected[index].selected;
                                      });
                                    },
                                    onDeleted: () {},
                                  ),
                                ),
                              ),
                      ),
                      Transform.rotate(
                        angle: 3.1451 * 1.5,
                        child: IconButton(
                          onPressed: () {
                            controller.toggle();
                          },
                          icon: Icon(Icons.arrow_back_ios_rounded),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: tagModelListSelected.length == 0 ? Colors.redAccent : Color.fromRGBO(0, 106, 106, 1),
                  ),
                  Text(
                    'Selecione opção',
                    style: TextStyle(
                      color: tagModelListSelected.length == 0 ? Colors.redAccent : null,
                    ),
                  ),
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
                      Text(
                        'Label',
                        style: TextStyle(
                          color: tagModelListSelected.length == 0 ? Colors.redAccent : null,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: tagModelListSelected.length == 0
                                ? Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'PlaceHolder',
                                      style: TextStyle(
                                        color: tagModelListSelected.length == 0 ? Colors.redAccent : null,
                                      ),
                                    ),
                                  )
                                : Wrap(
                                    children: List.generate(
                                      tagModelListSelected.length,
                                      (index) => InputChip(
                                        label: Text(tagModelListSelected[index].label),
                                        onPressed: () {
                                          setState(() {
                                            tagModelListSelected[index].selected = !tagModelListSelected[index].selected;
                                          });
                                        },
                                        onDeleted: () {},
                                      ),
                                    ),
                                  ),
                          ),
                          Transform.rotate(
                            angle: 3.1451 * 1.5,
                            child: IconButton(
                              onPressed: () {
                                controller.toggle();
                              },
                              icon: Icon(Icons.arrow_back_ios_rounded),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: tagModelListSelected.length == 0 ? Colors.redAccent : Color.fromRGBO(0, 106, 106, 1),
                      ),
                      Text(
                        'Selecione opção',
                        style: TextStyle(
                          color: tagModelListSelected.length == 0 ? Colors.redAccent : null,
                        ),
                      ),
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
                    ),
                  ),
                ),
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

  @override
  String toString() {
    return 'TagModel{label: $label, selected: $selected}';
  }
}
