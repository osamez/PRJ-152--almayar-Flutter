part of '../../feature_imports.dart';

class AddNewTicketViewBody extends StatefulWidget {
  const AddNewTicketViewBody({super.key});

  @override
  State<AddNewTicketViewBody> createState() => _AddNewTicketViewBodyState();
}

class _AddNewTicketViewBodyState extends State<AddNewTicketViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _shipmentCodeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _shipmentCodeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewTicketCubit, AddNewTicketState>(
      buildWhen: (previous, current) =>
          previous.isLoadingInitial != current.isLoadingInitial ||
          previous.isErrorInitial != current.isErrorInitial,
      builder: (context, state) {
        if (state.isErrorInitial) {
          return Center(
            child: Text(
              state.getTicketPrioritiesState.errorOrNull?.error ??
                  state.getTicketSystemsState.errorOrNull?.error ??
                  LocaleKeys.generic_error.tr(),
            ),
          );
        }

        return Skeletonizer(
          enabled: state.isLoadingInitial,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          LocaleKeys.add_ticket_heading.tr(),
                          textAlign: TextAlign.start,
                          style: AppTextStyleFactory.create(
                            size: 16,
                            weight: FontWeight.w700,
                            color: AppColors.darkText,
                          ),
                        ),
                        verticalSpace(AppSizes.h20),
                        AppTextFormField(
                          controller: _titleController,
                          hintText: LocaleKeys.add_ticket_title_hint.tr(),
                          title: LocaleKeys.add_ticket_title.tr(),
                          titleColor: AppColors.darkText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.fieldRequired.tr();
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpace(AppSizes.h16),
                        const AddNewTicketDirectedToField(),
                        verticalSpace(AppSizes.h16),
                        const AddNewTicketPriorityField(),
                        verticalSpace(AppSizes.h16),
                        AppTextFormField(
                          controller: _shipmentCodeController,
                          isRequired: false,
                          hintText: LocaleKeys.add_ticket_shipment_code_hint
                              .tr(),
                          title: LocaleKeys.add_ticket_shipment_code.tr(),
                          titleColor: AppColors.darkText,
                          validator: (value) => null,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpace(AppSizes.h16),
                        AppTextFormField(
                          controller: _descriptionController,
                          isRequired: false,
                          hintText: LocaleKeys.add_ticket_description_hint.tr(),
                          title: LocaleKeys.add_ticket_description.tr(),
                          titleColor: AppColors.darkText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LocaleKeys.fieldRequired.tr();
                            }
                            return null;
                          },
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
                        ),
                        verticalSpace(AppSizes.h16),
                        const AddNewTicketMediaSection(),
                      ],
                    ),
                  ),
                ),
                verticalSpace(AppSizes.h16),
                AppElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AddNewTicketCubit>().createTicket(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        shipmentCode: _shipmentCodeController.text,
                      );
                    }
                  },
                  text: LocaleKeys.add_ticket_save.tr(),
                  backgroundColor: AppColors.orange,
                ),
                verticalSpace(AppSizes.h8),
              ],
            ),
          ),
        );
      },
    );
  }
}
