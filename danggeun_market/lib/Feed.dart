import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl; //이미지를 담을 변수

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  //좋아요 여부
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, //이미지 & 글씨가 위 아래로 떨어져있는거 교정
      children: [
        // 이미지 들어갈 자리
        // CilpRRect 를 통해 이미지에 곡선 border 생성
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          // 이미지
          child: Image.network(
            widget
                .imageUrl, //10번째 줄의 imageUrl 가져오기. StatefulWidget에서 가져오니깐 (해당 클래스가 아님) widget.변수명으로 접근
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12), //빈박스를 두어 이미지와 글씨 사이의 간격 준다
        Expanded(
          //Column위젯의 크기를 지정해줌 (이거 안하면 무한정으로 생각해서 오류뜸)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //글씨들 정렬
            children: [
              // 'M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.'
              // '봉천동 · 6분 전'
              // '100만원'
              Text(
                'M1 아이패드 프로 11형(3세대) 와이파이 128G 팝니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              Text(
                '봉천동 · 6분 전',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '100만원',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // 빈 칸
                  // 하트 아이콘
                  // '1'
                  Spacer(),
                  GestureDetector(
                    //위젯을 모두 버튼처럼 만들 수 있다.
                    onTap: () {
                      //화면 갱신
                      setState(() {
                        isFavorite = !isFavorite; //좋아요 토글
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isFavorite
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: isFavorite ? Colors.pink : Colors.black,
                          size: 16,
                        ),
                        Text(
                          '1',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
