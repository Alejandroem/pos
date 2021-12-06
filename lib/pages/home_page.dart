import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pos/bloc/products/product_event.dart';
import '../bloc/products/product_bloc.dart';
import '../bloc/products/product_state.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/product_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
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
                return const Center(
                  child: Text('Failed to fetch the products'),
                );
              case ProductStatus.success:
                if (state.products.isEmpty) {
                  return const Center(
                    child: Text('There is no products'),
                  );
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return index >= state.products.length
                        ? const BottomLoader()
                        : ProductListItem(product: state.products[index]);
                  },
                  itemCount: state.hasReachedMax
                      ? state.products.length
                      : state.products.length + 1,
                  controller: _scrollController,
                );
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ProductBloc>().add(ProductsFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
