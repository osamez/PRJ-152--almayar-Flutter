part of '../../feature_imports.dart';

class BranchDropdown extends StatelessWidget {
  const BranchDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.getBranchesState != current.getBranchesState ||
          previous.selectedBranch != current.selectedBranch,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequiredTitle(title: LocaleKeys.preferred_branch.tr()),
            verticalSpace(AppSizes.h8),
            CustomDropdownSearchList<ReceivingBranchModel>(
              items: state.getBranchesState.valueOrNull ?? [],
              hintText: LocaleKeys.preferred_branch_hint.tr(),
              itemAsString: (item) => item.name ?? '',
              initialValue: state.selectedBranch,
              onChanged: context.read<RegisterCubit>().selectBranch,
              validator: (value) {
                if (value == null) {
                  return LocaleKeys.please_select_branch.tr();
                }
                return null;
              },
            ),
          ],
        );
      },
    );
  }
}
