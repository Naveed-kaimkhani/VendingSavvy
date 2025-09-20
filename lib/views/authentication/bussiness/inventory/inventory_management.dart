import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vendingsavvy/constant/route_constants.dart';
import 'package:vendingsavvy/controllers/product_controller.dart';
import 'package:vendingsavvy/models/product_model.dart';
import 'package:vendingsavvy/repositries/product_repo.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming ProductController is put/injected elsewhere; use Get.find() if needed
    final ProductController controller = Get.put(
      ProductController(
        productRepo: Get.put(ProductRepo(apiClient: Get.find())),
      ),
    ); // Adjust injection as per your DI setup

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text('Inventory Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Get.toNamed(RouteConstants.addinventory);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final productsList = controller.getProducts.value?.data?.products ?? [];
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Range Filters (hardcoded selection; implement toggle logic)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Handle Week filter
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Week',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Text('Month'),
                    const Text('Year'),
                    const Icon(Icons.calendar_today),
                  ],
                ),
                const SizedBox(height: 16),

                // Summary Stats (hardcoded; implement API for real data)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                      'Products Sold',
                      '20,00/24,00',
                      Colors.lightBlue[100]!,
                    ),
                    _buildStatCard(
                      'Total Categories',
                      '14',
                      Colors.orange[100]!,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                      'Profit So Far',
                      '\$80.50',
                      Colors.lightGreen[100]!,
                    ),
                    _buildStatCard('COGS', '\$200.00', Colors.pink[100]!),
                  ],
                ),
                const SizedBox(height: 24),

                // Products Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Products',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     // TODO: Navigate to full products list
                    //   },
                    //   child: const Text('View All ›'),
                    // ),
                  ],
                ),
                const SizedBox(height: 8),
                if (productsList.isEmpty)
                  const Center(child: Text('No products available'))
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      final product = productsList[index];
                      return _buildProductCard(product);
                    },
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    final currentStock = product.stockQuantity ?? 0;
    final mockTotalPieces =
        currentStock +
        3; // Mock total; replace with actual total if available from API
    final progress = currentStock / mockTotalPieces;
    final isOutOfStock = currentStock == 0;
    final statusColor = isOutOfStock ? Colors.red : Colors.green;
    final statusText = isOutOfStock ? 'Out of Stock' : 'In Stock';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
           
// inside your widget
Container(
  width: 60,
  height: 60,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.grey[300],
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: (product.productImage == null || product.productImage!.isEmpty)
        ? const Icon(Icons.image, size: 20, color: Colors.grey)
        : CachedNetworkImage(
            imageUrl:
                "http://31.220.31.37:3001/v1/api/uploads/${product.productImage}",
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image, size: 20, color: Colors.grey),
          ),
  ),
),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName ?? 'Unnamed Product',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.category?.categoryName ?? 'Uncategorized',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          color: statusColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${currentStock} Pieces / $mockTotalPieces Pieces',
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                  Text(
                    '• $statusText',
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${product.sellingPrice ?? 0}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
