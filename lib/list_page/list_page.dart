// 필요한 패키지 임포트
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // 천단위 구분자를 위한 패키지
import '../product.dart'; // Product 클래스 정의가 있는 파일
import '../explanation_page/explanation_page.dart'; // 상세 페이지 위젯

// 메인 리스트 페이지 위젯 (StatefulWidget으로 변경됨)
class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

// ListPage의 상태를 관리하는 State 클래스
class _ListPageState extends State<ListPage> {
  // 실제 등록된 상품 데이터로 초기화 (예시 데이터)
  // 또는 빈 리스트로 시작하여 조건부 렌더링을 테스트할 수 있음
  final List<Product> products = []; // 빈 리스트로 시작

  @override
  Widget build(BuildContext context) {
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
          ? const EmptyProductList() // 상품이 없을 때 빈 리스트 화면 표시
          : ProductList(products: products), // 상품이 있을 때 리스트 표시
    );
  }
}

// 상품 리스트 위젯
class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key? key, required this.products}) : super(key: key);

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
        return GestureDetector(
          onTap: () {
            // 상품 아이템 클릭 시 상세 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExplanationPage(product: products[index]),
              ),
            );
          },
          child: ProductListItem(product: products[index]),
        );
      },
    );
  }
}

// 빈 상품 리스트 화면 위젯 (변경 없음)
class EmptyProductList extends StatelessWidget {
  const EmptyProductList({Key? key}) : super(key: key);
  
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

// 개별 상품 아이템 위젯 (상품명 위치 조정됨)
class ProductListItem extends StatelessWidget {
  final Product product;
  // 천단위 구분자 포맷터 생성
  final formatter = NumberFormat('#,###');
  
  ProductListItem({Key? key, required this.product}) : super(key: key);

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
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children:
                [
                  SizedBox(height:
                  8), 
                  Padding(padding:
                  const EdgeInsets.only(top:
                  12), child:
                  Text(product.name, style:
                  const TextStyle(fontSize:
                  16, color:
                  Colors.black87,),),), 
                  Spacer(), 
                  Align(alignment:
                  Alignment.bottomRight, child:
                  Text('${formatter.format(int.parse(product.price))} 원', style:
                  const TextStyle(fontSize:
                  16, color:
                  Colors.black87,),),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
