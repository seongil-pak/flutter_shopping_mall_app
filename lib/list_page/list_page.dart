// 필요한 패키지 임포트
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //천단위 구분자

// 메인 리스트 페이지 위젯
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 테스트용 상품 데이터 생성
    final List<Product> products = List.generate(
      20,
      (index) => Product(
        name: '상품 이름 1',
       price: 16000,
      ),
    );
    //final List<Product> products = [];//빈화면 테스트용-> 위의 테스트 데이터 주석처리하고 해당줄 활성시 빈화면 표시.

    // 메인 화면 구조
    return Scaffold(
      backgroundColor: Colors.white,
      // 상단 앱바 구현
      appBar: AppBar(
        title: const Text(
          'TITLE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        // 우측 메뉴 버튼
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        // 앱바 하단 구분선
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.deepPurple[600],
            height: 1.0,
          ),
        ),
      ),
      // 상품 유무에 따른 조건부 렌더링
      body: products.isEmpty 
          ? const EmptyProductList()
          : ProductList(products: products),
    );
  }
}

// 상품 리스트 위젯
class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    // 구분선이 있는 리스트뷰 구현
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      // 리스트 아이템 사이 구분선
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Colors.deepPurple[600],
      ),
      // 각 상품 아이템 렌더링
      itemBuilder: (context, index) {
        return ProductListItem(product: products[index]);
      },
    );
  }
}

// 빈 상품 리스트 화면 위젯
class EmptyProductList extends StatelessWidget {
  const EmptyProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // 중앙 정렬된 텍스트 표시
    return const Center(
      child: Text(
        '상품이 없습니다.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}

// 개별 상품 아이템 위젯
class ProductListItem extends StatelessWidget {
  final Product product;
  // 천단위 구분자 포맷터 생성
  final formatter = NumberFormat('#,###');

  ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          // 상품 이미지 컨테이너
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          // 이미지와 상품정보 사이 간격
          const SizedBox(width: 16),
          // 상품정보를 담은 확장 영역
          Expanded(
            child: Container(
              height: 120, // 리스트 아이템 높이
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 상품명 (상단에서 약간 여백을 둠)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // 가격 (오른쪽 하단)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${formatter.format(product.price)} 원',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 상품 데이터 모델 클래스
class Product {
  final String name;
  final int price;

  Product({
    required this.name,
    required this.price,
  });
}