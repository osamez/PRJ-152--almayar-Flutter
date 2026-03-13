import 'package:almeyar/core/utils/exports.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownSearchList<T> extends StatefulWidget {
  const CustomDropdownSearchList({
    super.key,
    required this.items,
    required this.onChanged,
    this.onChangedMulti,
    this.backgroundColor,
    this.showRemove = false,
    this.borderColor,
    this.initialValue,
    this.initialValues,
    this.radius,
    this.hintColor,
    required this.itemAsString,
    this.showSearch = true,
    required this.hintText,
    this.isMulti = false,
  });

  final List<T> items;
  // kept for backward compatibility (single select)
  final ValueChanged<T?> onChanged;
  // new callback for multi-select
  final ValueChanged<List<T>?>? onChangedMulti;
  final Color? backgroundColor;
  final Color? borderColor;
  final T? initialValue;
  final List<T>? initialValues;
  final double? radius;
  final Color? hintColor;
  final String Function(T item) itemAsString;
  final bool showSearch;
  final String hintText;
  final bool showRemove;
  final bool isMulti;

  @override
  State<CustomDropdownSearchList<T>> createState() =>
      _CustomDropdownSearchListState<T>();
}

class _CustomDropdownSearchListState<T>
    extends State<CustomDropdownSearchList<T>> {
  late List<T> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialValues ?? [];
  }

  @override
  void didUpdateWidget(covariant CustomDropdownSearchList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValues != oldWidget.initialValues) {
      _selectedItems = widget.initialValues ?? [];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isMulti) {
      return Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: DropdownSearch<T>(
          compareFn: (item1, item2) => item1 == item2,
          items: (filter, infiniteScrollProps) => widget.items,
          itemAsString: widget.itemAsString,
          onChanged: (value) {
            widget.onChanged(value);
          },
          dropdownBuilder: (context, selectedItem) {
            if (selectedItem == null) {
              return const SizedBox.shrink();
            }
            return Text(
              widget.itemAsString(selectedItem),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            );
          },
          selectedItem: widget.initialValue,
          suffixProps: DropdownSuffixProps(
            clearButtonProps: ClearButtonProps(
              isVisible: widget.showRemove,
              icon: const Icon(
                Icons.delete_outline,
                size: 22,
                color: Colors.red,
              ),
            ),
          ),
          popupProps: PopupProps.menu(
            showSearchBox: widget.showSearch,
            fit: FlexFit.loose,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTextStyleFactory.create(
                  size: 14,
                  weight: FontWeight.w400,
                  color: widget.hintColor ?? AppColors.gray10,
                ),
                border: _buildBorder(),
                enabledBorder: _buildBorder(),
                focusedBorder: _buildBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
              ),
            ),
            scrollbarProps: ScrollbarProps(
              thickness: 8.w,
              radius: Radius.circular(8.r),
              thumbColor: AppColors.orange,
            ),
            loadingBuilder: (context, searchEntry) => const Center(
              child: CircularProgressIndicator(color: AppColors.orange),
            ),
            errorBuilder: (context, searchEntry, exception) =>
                const Center(child: Text("حدث خطأ أثناء البحث...")),
            emptyBuilder: (context, searchEntry) {
              return Center(
                child: Text(
                  "لا يوجد نتائج",
                  style: AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w400,
                    color: widget.hintColor ?? AppColors.gray10,
                  ),
                ),
              );
            },
            itemBuilder: (context, item, isDisabled, isSelected) {
              return ListTile(
                title: Text(
                  widget.itemAsString(item),
                  style: AppTextStyleFactory.create(
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                visualDensity: VisualDensity.compact,
              );
            },
          ),
          decoratorProps: DropDownDecoratorProps(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyleFactory.create(
                size: 14,
                weight: FontWeight.w400,
                color: widget.hintColor ?? AppColors.gray10,
              ),
              border: _buildBorder(),
              fillColor: widget.backgroundColor ?? AppColors.white,
              filled: true,
              enabledBorder: _buildBorder(),
              focusedBorder: _buildBorder(),
            ),
          ),
        ),
      );
    }

    // Multi-select UI
    final displayText = _selectedItems.isEmpty
        ? null
        : _selectedItems.map(widget.itemAsString).join(', ');

    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          builder: (ctx) {
            final tempSelected = Set<T>.from(_selectedItems);
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(ctx).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 400.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.hintText,
                            style: AppTextStyleFactory.create(
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: StatefulBuilder(
                        builder: (context, setStateSheet) {
                          return ListView.builder(
                            itemCount: widget.items.length,
                            itemBuilder: (context, index) {
                              final item = widget.items[index];
                              final isSelected = tempSelected.contains(item);
                              return CheckboxListTile(
                                value: isSelected,
                                activeColor: AppColors.orange,
                                title: Text(
                                  widget.itemAsString(item),
                                  style: AppTextStyleFactory.create(
                                    size: 14,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (v) {
                                  setStateSheet(() {
                                    if (v == true) {
                                      tempSelected.add(item);
                                    } else {
                                      tempSelected.remove(item);
                                    }
                                  });

                                  // update parent state immediately and notify listener
                                  setState(() {
                                    _selectedItems = tempSelected.toList();
                                  });
                                  if (widget.onChangedMulti != null) {
                                    widget.onChangedMulti!(_selectedItems);
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: SizedBox(
        child: InputDecorator(
          isEmpty: _selectedItems.isEmpty,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 15.h,
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyleFactory.create(
              size: 14,
              weight: FontWeight.w400,
              color: AppColors.gray10,
            ),
            border: _buildBorder(),
            fillColor: widget.backgroundColor ?? AppColors.white,
            filled: true,
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  displayText ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: displayText == null
                      ? AppTextStyleFactory.create(
                          size: 14,
                          weight: FontWeight.w400,
                          color: AppColors.gray10,
                        )
                      : TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              if (widget.showRemove && _selectedItems.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    setState(() => _selectedItems = []);
                    if (widget.onChangedMulti != null)
                      widget.onChangedMulti!([]);
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: AppColors.error500,
                  ),
                ),
              const Icon(Icons.arrow_drop_down, color: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius ?? 12),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.greyScale30,
        width: 1.5.w,
      ),
    );
  }
}
