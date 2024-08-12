part of 'auth_footer.dart';

class _AuthMethodButton extends StatelessWidget {
  const _AuthMethodButton({required this.icon});

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddings.allMedium1,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyLight),
        shape: BoxShape.circle,
      ),
      child: CustomSvgWidget(
        svg: icon,
        width: context.dynamicWidth(.065),
      ),
    );
  }
}
