import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final ValueNotifier<List<TagModel>> _tagList;
  final ExpandableController controller;
  final VoidCallback onSelected;
  final VoidCallback onDelete;

  CustomDropDown({Key key, @required List<TagModel> tagList, this.onSelected, this.onDelete})
      : _tagList = ValueNotifier<List<TagModel>>(tagList),
        controller = ExpandableController(initialExpanded: false),
        super(key: key);

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
            collapsed: ValueListenableBuilder<List<TagModel>>(
              valueListenable: _tagList,
              builder: (context, value, _) {
                final tagModelListSelected = value.where((e) => e.selected == true).toList();
                return Container(
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
                                          tagModelListSelected[index].selected
                                          = !tagModelListSelected[index].selected;
                                          onDelete?.call();
                                          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                                          _tagList.notifyListeners();
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
                );
              },
            ),

            ///expanded
            expanded: ValueListenableBuilder<List<TagModel>>(
              valueListenable: _tagList,
              builder: (context, value, _) {
                final tagModelListSelected = value.where((e) => e.selected == true).toList();
                return Column(
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
                                          tagModelListSelected[index].selected = !tagModelListSelected[index].selected;
                                          onDelete?.call();
                                          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                                          _tagList.notifyListeners();
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
                        _tagList.value.length,
                            (index) => FlatButton(
                          color: _tagList.value[index].selected ? Colors.grey[300] : null,
                          onPressed: () {
                              _tagList.value[index].selected = !_tagList.value[index].selected;
                              onSelected?.call();
                              // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                              _tagList.notifyListeners();
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(_tagList.value[index].label),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
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
