part of 'user_info.dart';

class AgeInfoView extends StatefulWidget {
  const AgeInfoView({super.key});

  @override
  State<AgeInfoView> createState() => _AgeInfoViewState();
}

class _AgeInfoViewState extends State<AgeInfoView> {
  final int minAge = 1;
  late ScrollController _scrollController;
  late double itemExtent;
  int selectedAge = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    itemExtent = 50; // Her bir elemanın yüksekliği
    _scrollToSelectedAge();
  }

  void _scrollToSelectedAge() {
    final double initialOffset =
        (selectedAge - minAge) * itemExtent - (3 * itemExtent); // Imleci listenin ortasına getir
    _scrollController.animateTo(
      initialOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.horizontalMedium,
      child: _buildBody(context: context),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// User Info Title
        AuthHeader(
          title: LocaleKeys.user_info_how_old_are_you.tr(),
          subTitle: LocaleKeys.user_info_share_your_age.tr(),
        ),
        context.sizedBoxHeightMedium,
        SizedBox(
          width: 100,
          height: 400,
          child: CupertinoPicker(
            squeeze: 1.5,
            looping: true,
            selectionOverlay: Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.electricViolet, width: 5),
              )),
            ),
            itemExtent: 80,
            onSelectedItemChanged: (index) {
              setState(() {
                print(index + 18);
                selectedAge = index + 18; // Seçilen yaş, 18'den başlayacak şekilde ayarlanır
              });
            },
            children: List.generate(
              60 - 18 + 1, // 18'den 60'a kadar olan yaşları oluştur
              (index) => Center(
                child: Text(
                  (index + 18).toString(),
                  style: selectedAge == index + 18
                      ? context.textStyles.displayLarge.copyWith(fontWeight: FontWeight.bold, fontSize: 75)
                      : context.textStyles.displayLarge.copyWith(fontSize: 60, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
