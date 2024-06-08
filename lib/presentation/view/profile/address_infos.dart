

import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/address_card.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/delete_address_appbar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddressInfos extends ConsumerStatefulWidget {
  const AddressInfos({super.key});

  @override
  ConsumerState createState() => _AddressInfosState();
}

class _AddressInfosState extends ConsumerState<AddressInfos> {
  late AddressViewModel _addressViewModel;
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    super.initState();
    _addressViewModel = ref.read(addressViewModelImp);
    _profileViewModel = ref.read(profileViewModelImp);
    _addressViewModel.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _addressViewModel = ref.watch(addressViewModelImp);
    _profileViewModel = ref.watch(profileViewModelImp);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.cascadingWhite,
          appBar: const CustomAppBar(title: 'Adreslerim'),
          floatingActionButton: _addAddressButton(context),
          body: _buildBody(),
        ),
        _deleteAddressAppbar()
      ],
    );
  }

  /// Body
  Widget _buildBody() {
    switch (_addressViewModel.getAddressFromFirestoreResponse.status) {
      case Status.loading:
        return const CustomLoadingWidget();
      case Status.completed:
        return _buildAddressList();
      case Status.error:
        return _getErrorWidget();
      default:
        return context.sizedBoxShrink;
    }
  }

  /// All Address List
  Widget _buildAddressList() {
    return ListView.separated(
      padding: context.paddings.allLow,
      itemCount: _addressViewModel.getAddressFromFirestoreResponse.data.address?.length ?? 0,
      separatorBuilder: (context, index) => context.sizedBoxHeightLow,
      itemBuilder: (BuildContext context, int index) {
        return _buildAddressListItem(context, index);
      },
    );
  }

  /// Address List Item Address Card & CheckBox
  Widget _buildAddressListItem(BuildContext context, int index) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: AppColors.electricViolet.withOpacity(.5),
            borderRadius: context.borders.circularBorderRadiusMedium,
            onLongPress: _addressViewModel.deleteModeOn,
            child: AddressCard(addressViewModel: _addressViewModel, index: index),
          ),
        ),
        _buildCheckBox(index),
      ],
    );
  }

  /// Select Address Checkbox
  Widget _buildCheckBox(int index) {
    return Visibility(
      visible: _addressViewModel.isDeleteMode,
      child: Checkbox(
        value: _addressViewModel.isCheckedList[index],
        onChanged: (value) {
          setState(() {
            _addressViewModel.isCheckedList[index] = value!;
          });
        },
      ),
    );
  }

  /// Delete Address Appbar
  Widget _deleteAddressAppbar() {
    return Visibility(
      visible: _addressViewModel.isDeleteMode,
      child: SafeArea(
        child: DeleteAddressAppBar(addressViewModel: _addressViewModel),
      ),
    );
  }

  /// Add Address Button
  Widget _addAddressButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.electricViolet,
      onPressed: () {
        context.goNamed(AppRouteName.addAddress.name);
      },
      child: const Icon(
        AppIcons.kAddLocationIcon,
        color: AppColors.whiteColor,
      ),
    );
  }

  /// Error Widget
  Widget _getErrorWidget() {
    return CustomErrorWidget(
      onPressed: () {
        _addressViewModel.getAdressesFromFirestore(id: _profileViewModel.getUserId);
      },
    );
  }
}
