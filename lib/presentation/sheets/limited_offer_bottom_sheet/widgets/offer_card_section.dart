part of '../limited_offer_bottom_sheet_view.dart';


@immutable
final class _OfferCardSection extends StatelessWidget {
  const _OfferCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: SizeConstants.normal,
        crossAxisSpacing: SizeConstants.normal,
        childAspectRatio: 111 / 232,
      ),
      shrinkWrap: true,
      children: const [
        _OfferCard(
          originalPrice: '200',
          currentPrice: '330',
          discount: '+10%',
          weeklyPrice: '₺99,99',
          gradientColors: [
            Color(0xFF6F060B),
            Color(0xFFE50914),
          ],
        ),
        _OfferCard(
          originalPrice: '2.000',
          currentPrice: '3.375',
          discount: '+70%',
          weeklyPrice: '₺799,99',
          gradientColors: [
            Color(0xFF5949E6),
            Color(0xFFE50914),
          ],
        ),
        _OfferCard(
          originalPrice: '1.000',
          currentPrice: '1.350',
          discount: '+35%',
          weeklyPrice: '₺399,99',
          gradientColors: [
            Color(0xFF6F060B),
            Color(0xFFE50914),
          ],
        ),
      ],
    );
  }
}
