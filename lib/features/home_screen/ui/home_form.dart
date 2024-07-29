part of 'home_page.dart';

class _HomeForm extends StatelessWidget {
  const _HomeForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          "e-Shop",
          style: AppTextStyle.t_14_700.copyWith(
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginProvider>().logout(
                    () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                    ),
                  );
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.white,
            ),
          )
        ],
      ),
      body:
          Consumer<HomeScreenProvider>(builder: (context, homePagePvd, child) {
        if (homePagePvd.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (homePagePvd.error != null) {
          return const _ErrorState();
        } else if (homePagePvd.productList.isNotEmpty) {
          return const _ProductList();
        } else if (homePagePvd.productList.isEmpty) {
          return const _EmptyState();
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final homePagePvd = context.watch<HomeScreenProvider>();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 172 / 309,
      ),
      itemBuilder: (context, index) => _ProductDetailCard(
        product: homePagePvd.productList[index],
        canShowOffer: homePagePvd.canShowOffer,
      ),
      itemCount: homePagePvd.productList.length,
    );
  }
}

class _ProductDetailCard extends StatelessWidget {
  final Product product;
  final bool canShowOffer;
  const _ProductDetailCard({
    super.key,
    required this.product,
    required this.canShowOffer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: 130,
            child: CachedNetworkImage(
              imageUrl: product.thumbnailImg,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            product.name,
            style: AppTextStyle.t_14_700.copyWith(
              color: AppColors.black,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: AppTextStyle.t_14_400.copyWith(
              color: AppColors.black,
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\$${product.price}",
                  style: AppTextStyle.t_10_400.copyWith(
                    color: AppColors.darkGrey,
                    decoration:
                        canShowOffer ? TextDecoration.lineThrough : null,
                  ),
                ),
                if (canShowOffer) ...[
                  TextSpan(
                    text: " \$ ${product.discountedPrice.toStringAsFixed(2)}",
                    style: AppTextStyle.t_10_400.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  TextSpan(
                    text: " \$${product.discountPercentage}% off",
                    style: AppTextStyle.t_10_400.copyWith(
                      color: AppColors.neonGreen,
                    ),
                  ),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No products listed",
        style: AppTextStyle.t_30_700,
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    final homePagePvd = context.read<HomeScreenProvider>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Something went wrong",
            style: AppTextStyle.t_30_700,
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            buttonText: 'Retry',
            onPressed: homePagePvd.init,
          ),
        ],
      ),
    );
  }
}
