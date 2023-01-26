// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ger_estado/models/cart_item.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> produtos;
  final DateTime date;
  Order({
    required this.id,
    required this.total,
    required this.produtos,
    required this.date,
  });
}
