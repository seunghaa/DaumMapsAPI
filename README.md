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

