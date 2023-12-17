import 'package:flutter/material.dart';
import '../../app_components/screen_title_row.dart';
import '../../app_components/standard_bold_text.dart';
import '../../size_setup.dart';
import '../home/tabs/cart/componenets/price_calc_row.dart';
import 'components/order_status.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});
  static const routeName = '/track';

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: rSize * 2,
            vertical: rSize * 4,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScreenTitleRow(title: 'Track Order'),
                SizedBox(height: rSize * 3),
                const OrderItemRow(),
                Divider(height: rSize * 4),
                const StandardBoldText('Other Details'),
                SizedBox(height: rSize),
                const PriceCalcRow(
                  item: 'Expected Delivery Date',
                  price: '03 Sep 2023',
                ),
                const PriceCalcRow(
                  item: 'Tracking ID',
                  price: 'TRK345343493',
                ),
                Divider(height: rSize * 4),
                Padding(
                  padding: EdgeInsets.only(
                    left: rSize * 3,
                  ),
                  child: const StandardBoldText('Order Status'),
                ),
                const OrderStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderItemRow extends StatelessWidget {
  const OrderItemRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rSize = SizeSetup.rSize!;

    return Row(
      children: [
        // ItemImageCard(
        //   product: CartProduct(cartItem: ProductItem(id: id, name: name, category: category, imageUrl: imageUrl, price: price), quantity: quantity, id: id)
        // ),
        SizedBox(width: rSize * 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sandals',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Size XL || Qty : 2pcs'),
            Text(
              '\$120',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: rSize * 1.5,
              ),
            ),
          ],
        )
      ],
    );
  }
}
