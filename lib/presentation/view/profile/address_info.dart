import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/address/address_card.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_address_list_shimmer.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddressInfo extends ConsumerStatefulWidget {
  const AddressInfo({super.key});

  @override
  ConsumerState createState() => _AddressInfosState();
}

class _AddressInfosState extends ConsumerState<AddressInfo> {
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
  Widget build(BuildContext context) {
    _addressViewModel = ref.watch(addressViewModelImp);
    _profileViewModel = ref.watch(profileViewModelImp);
    return Scaffold(
      appBar:  CustomAppBar(title: LocaleKeys.address_my_addresses.tr()),
      floatingActionButton: _addAddressButton(context),
      body: _buildBody(),
    );
  }

  /// Body
  Widget _buildBody() {
    switch (_addressViewModel.getAddressFromFirestoreResponse.status) {
      case Status.loading:
        return const CustomAddressListShimmer();
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
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: AppColors.electricViolet.withOpacity(.5),
      borderRadius: context.borders.circularBorderRadiusMedium,
      onLongPress: _addressViewModel.deleteModeOn,
      child: AddressCard(addressViewModel: _addressViewModel, index: index),
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
