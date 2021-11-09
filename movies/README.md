# movies

영화 앱 - 영화관에서 개봉될 영화 목록 표시 및 검색

## Concepts

* HTTP 라이브러리를 사용하여 웹 서비스에서 데이터 검색(The Movie Database API)
  
    *  http (flutter package)
    
        * http.get
        * http.response > statusCode, body

    * io (dart package) - HttpStatus > ok, notFound

* JSON 데이터를 파싱하여 모델 객체로 변환

* 데이터를 표시하기 위해 ListView 추가

* 상세 화면 표시 및 화면을 통한 데이터 전달
