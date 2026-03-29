part of '../../feature_imports.dart';

class EditProfileUpdateSection extends StatefulWidget {
  final ProfileModel profile;
  const EditProfileUpdateSection({super.key, required this.profile});

  @override
  State<EditProfileUpdateSection> createState() =>
      _EditProfileUpdateSectionState();
}

class _EditProfileUpdateSectionState extends State<EditProfileUpdateSection> {
  final _whatsapp2Controller = TextEditingController();
  final _whatsapp3Controller = TextEditingController();
  final _whatsapp4Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _whatsapp2Controller.text =
        widget.profile.whatsapp2?.number?.toString() ?? '';
    _whatsapp3Controller.text =
        widget.profile.whatsapp3?.number?.toString() ?? '';
    _whatsapp4Controller.text =
        widget.profile.whatsapp4?.number?.toString() ?? '';
    context.read<UpdateProfileCubit>().initWithProfile(widget.profile);
  }

  @override
  void dispose() {
    _whatsapp2Controller.dispose();
    _whatsapp3Controller.dispose();
    _whatsapp4Controller.dispose();
    super.dispose();
  }

  void _onUpdateProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<UpdateProfileCubit>().updateProfile(
        initialProfile: widget.profile,
        whatsapp2: _whatsapp2Controller.text.isNotEmpty
            ? _whatsapp2Controller.text
            : null,
        whatsapp3: _whatsapp3Controller.text.isNotEmpty
            ? _whatsapp3Controller.text
            : null,
        whatsapp4: _whatsapp4Controller.text.isNotEmpty
            ? _whatsapp4Controller.text
            : null,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EditProfileAvatarSection(imagePath: widget.profile.image),
          verticalSpace(AppSizes.h24),
          EditProfileInfoCard(profile: widget.profile),
          verticalSpace(AppSizes.h24),
          AppElevatedButton(
            text: LocaleKeys.delete_account.tr(),

            onPressed: () {
              final cubit = context.read<UpdateProfileCubit>();
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: const DeleteAccountDialogContent(),
                ),
              );
            },
            backgroundColor: AppColors.orange,
          ),
          verticalSpace(AppSizes.h24),

          BlocSelector<UpdateProfileCubit, UpdateProfileState, String?>(
            selector: (state) => state.whatsapp2Key,
            builder: (context, key) {
              return PhoneFormField(
                controller: _whatsapp2Controller,
                title: LocaleKeys.edit_profile_whatsapp_number.tr(
                  namedArgs: {'number': '2'},
                ),
                hintText: LocaleKeys.phone_hint.tr(),
                initialCountryCode: key,
                onCountryChanged: (code) {
                  context.read<UpdateProfileCubit>().changeWhatsappKey(
                    index: 2,
                    key: code,
                  );
                },
              );
            },
          ),
          verticalSpace(AppSizes.h12),
          BlocSelector<UpdateProfileCubit, UpdateProfileState, String?>(
            selector: (state) => state.whatsapp3Key,
            builder: (context, key) {
              return PhoneFormField(
                controller: _whatsapp3Controller,
                title: LocaleKeys.edit_profile_whatsapp_number.tr(
                  namedArgs: {'number': '3'},
                ),
                hintText: LocaleKeys.phone_hint.tr(),
                initialCountryCode: key,
                onCountryChanged: (code) {
                  context.read<UpdateProfileCubit>().changeWhatsappKey(
                    index: 3,
                    key: code,
                  );
                },
              );
            },
          ),
          verticalSpace(AppSizes.h12),
          BlocSelector<UpdateProfileCubit, UpdateProfileState, String?>(
            selector: (state) => state.whatsapp4Key,
            builder: (context, key) {
              return PhoneFormField(
                controller: _whatsapp4Controller,
                title: LocaleKeys.edit_profile_whatsapp_number.tr(
                  namedArgs: {'number': '4 '},
                ),
                hintText: LocaleKeys.phone_hint.tr(),
                initialCountryCode: key,
                onCountryChanged: (code) {
                  context.read<UpdateProfileCubit>().changeWhatsappKey(
                    index: 4,
                    key: code,
                  );
                },
              );
            },
          ),
          verticalSpace(AppSizes.h32),
          EditProfileSaveButton(onPressed: _onUpdateProfile),
        ],
      ),
    );
  }
}
