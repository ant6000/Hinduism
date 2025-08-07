// import 'dart:async';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // models/ohs_state.dart

// class OhsState {
//   final int brandId;
//   final int categoryId;
//   final String searchQuery;

//   const OhsState({
//     this.brandId = 0,
//     this.categoryId = 0,
//     this.searchQuery = '',
//   });

//   OhsState copyWith({int? brandId, int? categoryId, String? searchQuery}) {
//     return OhsState(
//       brandId: brandId ?? this.brandId,
//       categoryId: categoryId ?? this.categoryId,
//       searchQuery: searchQuery ?? this.searchQuery,
//     );
//   }
// }
// final ohsStateProvider = StateNotifierProvider<OhsStateNotifier, OhsState>((ref) {
//   return OhsStateNotifier(ref);
// });

// class OhsStateNotifier extends StateNotifier<OhsState> {
//   final Ref ref;
//   Timer? _debounce;

//   OhsStateNotifier(this.ref) : super(const OhsState());

//   void setBrandId(int brandId) {
//     state = state.copyWith(brandId: brandId, categoryId: 0);
//     ref.invalidate(categoryListProvider);
//     ref.invalidate(productsProvider);
//   }

//   void setCategoryId(int categoryId) {
//     state = state.copyWith(categoryId: categoryId);
//     ref.invalidate(productsProvider);
//   }

//   void setSearchQuery(String query) {
//     if (_debounce?.isActive ?? false) _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 500), () {
//       state = state.copyWith(searchQuery: query);
//       ref.invalidate(productsProvider);
//     });
//   }

//   @override
//   void dispose() {
//     _debounce?.cancel();
//     super.dispose();
//   }
// }
// final brandListProvider = FutureProvider<List<Brand>>((ref) async {
//   return await fetchBrandList();
// });
// final categoryListProvider = FutureProvider<List<CategoryModel>>((ref) async {
//   final brandId = ref.watch(ohsStateProvider).brandId;
//   return await fetchCategoryList(brandId: brandId == 0 ? null : brandId.toString());
// });
// final productsProvider = FutureProvider<List<OhsModel>>((ref) async {
//   final state = ref.watch(ohsStateProvider);
//   final queryParameters = {
//     if (state.searchQuery.isNotEmpty) 'search': state.searchQuery,
//     if (state.brandId != 0) 'brandId': state.brandId.toString(),
//     if (state.categoryId != 0) 'categoryId': state.categoryId.toString(),
//     'pageLess': true,
//   };
//   return await fetchProducts(queryParameters);
// });

// class OnHandStockScreen extends ConsumerWidget {
//   const OnHandStockScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(ohsStateProvider);
//     final brandAsync = ref.watch(brandListProvider);
//     final categoryAsync = ref.watch(categoryListProvider);
//     final productsAsync = ref.watch(productsProvider);
//     final stateNotifier = ref.read(ohsStateProvider.notifier);

//     return Screen(
//       appBar: const TAppBarWithBack(title: 'OHS'),
//       body: Column(
//         children: [
//           // Search
//           CustomSearchBox(
//             hintText: 'Search Product',
//             controller: TextEditingController(text: state.searchQuery)
//               ..addListener(() {
//                 stateNotifier.setSearchQuery(
//                     (TextEditingController(text: state.searchQuery)).text);
//               }),
//           ),

//           // Brand Tabs
//           brandAsync.when(
//             data: (brands) {
//               return DefaultTabController(
//                 length: brands.length + 1,
//                 child: TabBar(
//                   isScrollable: true,
//                   onTap: (index) {
//                     if (index == 0) {
//                       stateNotifier.setBrandId(0);
//                     } else {
//                       stateNotifier.setBrandId(brands[index - 1].id ?? 0);
//                     }
//                   },
//                   tabs: [
//                     const Tab(child: Text('All')),
//                     ...brands
//                         .map((b) => Tab(child: Text(b.name ?? '')))
//                         .toList(),
//                   ],
//                 ),
//               );
//             },
//             loading: () => const CircularProgressIndicator(),
//             error: (e, st) => Text('Error: $e'),
//           ),

//           // Category Filters
//           categoryAsync.when(
//             data: (categories) {
//               return SizedBox(
//                 height: 60,
//                 child: Row(
//                   children: [
//                     CategorySmallRoundButton(
//                       backgroundColor:
//                           state.categoryId == 0 ? Colors.black : Colors.transparent,
//                       onPressed: () => stateNotifier.setCategoryId(0),
//                       child: Text('All',
//                           style: TextStyle(
//                               color: state.categoryId == 0
//                                   ? Colors.white
//                                   : Colors.black)),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: categories.length,
//                         itemBuilder: (_, index) {
//                           final category = categories[index];
//                           return CategorySmallRoundButton(
//                             backgroundColor: state.categoryId == category.id
//                                 ? Colors.black
//                                 : Colors.transparent,
//                             onPressed: () =>
//                                 stateNotifier.setCategoryId(category.id ?? 0),
//                             child: Text(
//                               category.name ?? '',
//                               style: TextStyle(
//                                   color: state.categoryId == category.id
//                                       ? Colors.white
//                                       : Colors.black),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             loading: () => const CircularProgressIndicator(),
//             error: (e, st) => Text('Error: $e'),
//           ),

//           // Product List
//           Expanded(
//             child: productsAsync.when(
//               data: (products) {
//                 if (products.isEmpty) {
//                   return const Center(child: NoDataFound(desc: 'No OHS Found'));
//                 }
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     ref.invalidate(productsProvider);
//                   },
//                   child: ListView.builder(
//                     itemCount: products.length,
//                     itemBuilder: (_, i) {
//                       return TProductCardHorizontal(product: products[i]);
//                     },
//                   ),
//                 );
//               },
//               loading: () => THorizontalLayout(
//                 itemCount: 5,
//                 itemBuilder: (_, __) => buildShimmerListCards(),
//               ),
//               error: (e, st) => Center(child: Text('Error: $e')),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
