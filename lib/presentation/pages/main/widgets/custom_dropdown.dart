import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../styles/style.dart';


class DropDownValue implements Equatable {
  final int id;
  final String name;

  const DropDownValue({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  @override
  bool? get stringify => true;
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown(
      {super.key,
      this.initialValue,
      this.onChanged,
      this.searchable = false,
      this.hintText = '',
      required this.list});
  final void Function(DropDownValue? location)? onChanged;
  final List<DropDownValue> list;
  final DropDownValue? initialValue;
  final String hintText;
  final bool searchable;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropDownValue;

  @override
  void initState() {
    dropDownValue =
        widget.initialValue?.name;
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<dynamic>(
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          selectedItemBuilder: (context) {
            return widget.list.map(
              (item) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    dropDownValue!,
                    style: Style.interNormal(),
                    maxLines: 1,
                  ),
                );
              },
            ).toList();
          },
          style: Style.interBold(),
          isExpanded: true,
          value: widget.list
                      .where((element) => dropDownValue == element.name)
                      .toList()
                      .length ==
                  1
              ? dropDownValue
              : null,
          underline: const SizedBox.shrink(),
          items: widget.list.map((item) {
            return DropdownMenuItem<String>(
              value: item.name,
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Style.interRegular()
              ),
            );
          }).toList(),
          onChanged: (value) {
                  dropDownValue = value.toString();
                  setState(() {});
                  widget.onChanged!(widget.list
                      .firstWhere((element) => element.name == value));
                },
          hint: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              widget.initialValue != null
                  ? widget.initialValue!.name
                  : widget.hintText,
              style: Style.interRegular()
            ),
          ),
          buttonStyleData: ButtonStyleData(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                // color: Style.primaryColor,
                border: Border.all(
                  color: Style.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              )),
          dropdownSearchData: widget.searchable == true
              ? DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: '',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    var ids = widget.list
                        .where((element) => element.name
                            .toString()
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()))
                        .map((e) => e.name);
                    return ids.contains(item.value);
                  },
                )
              : null,
          onMenuStateChange: widget.searchable == true
              ? (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                }
              : null,
        ),
      ),
    );
  }
}
