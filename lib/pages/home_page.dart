import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pos/bloc/products/product_event.dart';
import '../bloc/products/product_bloc.dart';
import '../bloc/products/product_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ProductsFetched());
    DateTime now = DateTime.now();
    String hour = DateFormat('kk:mm').format(now);
    String day = DateFormat('EEEE, dd MMM').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
              image: AssetImage('assets/img/logo/logo.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(hour),
                Text(day),
              ],
            )
          ],
        ),
      ),
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
            switch (state.status) {
              case ProductStatus.failure:
                return const Center(child: Text('failed to fetch posts'));
              case ProductStatus.success:
                if (state.products.isEmpty) {
                  return const Center(child: Text('no posts'));
                }
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Text(state.products[index].name);
                  },
                  itemCount: state.products.length,
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
