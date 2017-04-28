😍구글맵을 사용한 예제😍
---
- Ruby on Rails(4.2.5)
- Ruby(ruby 2.3. 0p0)
- Boostrap(4.4.0)
- [Daum Maps API](http://apis.map.daum.net/web/documentation/)

### Model
- place
    - name: string 
    - lat, lng: integer
    - description: text
    
### Controller
- Places
    - index
    - show
- View
    - index.html
    - show.html



---
### 수업필기
1. rails g model place
2. git새로 만들어주기
3. git init
4. git add .
5. git branch
5. git commit -"fist commit"
6. git config --global core.editor vim
7. git commit --amend
알파벳 o를 누루면 한 칸이 띄어진다. 
쓰고 싶은 것 써주기 
8. shift ;을 쳐주면 밖으로 나오게 된다.
9. :w를 치면 저장이 되고
10. :q를 치면 밖으로 나가게 된다. 
11. git log를 치면 우리가 썼던 것들이 나온다.
12. git push
13. git remote add origin https://github.com/seunghaa/DaumMapsAPI.git
14. git push -u origin master
15. 아이디, 비밀번호 치면 끝
16. rails g controller place index show

---
- routes.rb로 가 root 설정을 해준다 
```erb
root 'places#index'
```
#### 부트스트랩을 불러와보자
- bootstrap 4로 들어가 gem 'bootstrap', '~> 4.0.0.alpha6'을 복사해와서 
 vendor 파일 안에 Gemfile 에 붙여넣기
터미널에 bundle install 입력해주기 
    - 참고 semantic ui(https://semantic-ui.com/)
    - bootstrap를 불러와도 된다. 
        -bootstrp 4(https://v4-alpha.getbootstrap.com/)로 들어가 download  CDN을 views layouts head밑에 붙여넣어주기
---
assets 에 stylesheet를 application.scss로 바꾸어 준다음 파일 안에 
```erb
@import "bootstrap";
```
- bootstrap 에 가서 Nav바 긁어오기 - application.html.erb파일 body 밑에 붙여넣기
    - application.js로 가서 
```erb
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap-sprockets
//= require_tree .
```

- Gemfile가서 source 'https://rubygems.org' 밑에다가 붙여넣어주기
    
```erb
source 'https://rails-assets.org' do   gem 'rails-assets-tether', '>= 1.3.3' end
```
bundle install 마지막으로 하면 끝!
- git add .
- git commit -m "Make Places Controller & Add Bootstrap4"
- git push

---
- 구글 api 로그인 해서 console의 앱만들기 - 수정하기 
    -app 이름과 주소를 입력해준다. 
    -개요 -api - 모든 앱 - 키가 발금된다
- places안의  index.html.erb로 가서 
    - daum api 모든 웹에 guide의 지도를 띄우는 코드 가져온다. 
```erb
<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=발급받은 API KEY를 넣으시면 됩니다."></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
```
- 복붙하면 발급받은 키를 입력해주라고 나오면 앞에서 발급받은 키를 입력하면 된다.
---
- https://rubygems.org/ 들어가서 faker검색  gemfile url 가져와서 Gem file 안에다가 붙여넣기 해준다.
```erb
gem 'faker', '~> 1.7', '>= 1.7.3'
```
bundle install해주면 끝!
- lib 폴더의 tasks 안에 db.rake라는 새로운 파일을 생성해준다
```erb
namespace :db do
    
    desc "populates th database with user"
    
    task place: :environment do
        (0..9).each do |i|
            Place.create!(
                name:Faker::Name.name,
                lat: 33.450 + i,
                lng: 126.57 + i,
                description: Faker::Address.city
                    <!--faker git hub으로 들어가서 faker::Address.city-->
            )
        end
    end
end
```
rake db:place 해주면 끝!
- rails c 
- Place.all
---
Daum API로 가서 
sample 여러개 마커에 이벤트 등록하기 다음을 아까 위에서 불러온 script를 지우고 새로 붙여넣어준다. 
```erb
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=발급받은 API KEY를 사용하세요"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>카카오</div>', 
        latlng: new daum.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new daum.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new daum.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new daum.maps.LatLng(33.451393, 126.570738)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

/* 아래와 같이도 할 수 있습니다 */
/*
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        daum.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        daum.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    })(marker, infowindow);
}
*/
</script>
```
여기서 var position과 지워주고var 첫 줄을 <%=@places.each do |place|%> 로 바꾸어준다. 
....어떻게 고쳐가지구 index.html.erb파일이 되고 
- routes.rb로 가서
  get으로 쓴 것을
```erb
  resources :places, only: [:index, :show]
```
  로 바꾸어준다. 