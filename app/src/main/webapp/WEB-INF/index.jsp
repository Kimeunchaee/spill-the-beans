<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
  <head>
    <title>임금님 귀는 당나귀 귀</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

    <link rel="stylesheet" href="${contextPath}/node_modules/bootstrap/dist/css/bootstrap.css">
    <link rel="stylesheet" href="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.css">
    <link rel="stylesheet" href="${contextPath}/css/common.css">
    
    <script src="${contextPath}/node_modules/@popperjs/core/dist/umd/popper.js"></script>
    <script src="${contextPath}/node_modules/bootstrap/dist/js/bootstrap.js"></script>
    <script src="${contextPath}/node_modules/sweetalert2/dist/sweetalert2.js"></script>
    
    <link rel="stylesheet" href="${contextPath}/assets/css/main.css" />
    <noscript><link rel="stylesheet" href="${contextPath}/assets/css/noscript.css" /></noscript>

    <style>
      .donkeywhite {
        display: inline-block;
        width: 50px;
        height: 50px;
        background-color: white;
        border-radius: 50px;
      }
    </style>

  </head>
  <body class="is-preload">

    <!-- Wrapper -->
      <div id="wrapper">

        <!-- Header -->
          <header id="header">
            <div class="logo">
              <span><img src="${contextPath}/images/donkey.png"; style="width: 85%;"></span>
            </div>
            <div class="content">
              <div class="inner">
                <h1 style="font-family: 'SANGJUGyeongcheonIsland';">임금님 귀는 당나귀 귀</h1>
                <p>주위 사람들에게 털어 놓을 수 없는, 털어 놓지 못해 답답한 사람들을 위해</br>
                자신만의 비밀이나 속마음을 어딘가에 쏟을 수 있도록 도와주는 사소하면서 웃기고 슬픈 TMI를 익명으로 공유해 보세요!</p>
              </div>
            </div>
            <nav>
              <ul> <!-- 비회원 -->
                <li><a href="#intro">소개</a></li>
                <li><a href="#login">로그인</a></li>
                <li><a href="#signup">회원가입</a></li>
                <li><a href="#findidpw">ID/PW 찾기</a></li>
                <li><a href="#board">입장하기</a></li>
              </ul>
              <!-- <ul>  회원 
                <li><a href="#intro">소개</a></li>
                <li><a href="#mypage">마이페이지</a></li>
                <li><a href="#write">속삭이기</a></li>
              </ul> -->
              <!-- <ul>  관리자
                <li><a href="#intro">소개</a></li>
                <li><a href="#work">마이페이지</a></li>
                <li><a href="#member">회원 관리</a></li>
                <li><a href="#board">게시글 관리</a></li>
              </ul> -->
            </nav>
          </header>

        <!-- Main -->
          <div id="main">

            <!-- 비회원 -->
            <!-- Intro -->
              <article id="intro">
                <h2 class="major">임금님 귀는 당나귀 귀</h2>
                <span class="donkeywhite">
                  <img src="${contextPath}/images/donkey.png"; style="width: 80%; margin-top: 5px; margin-left: 6px;"></span>
                <span>세상에 영원한 비밀은 없죠~?!</span>
                </br></br>
                <p> 인간은 비밀을 품기 어려운 존재입니다.</br>
                  사회적인 동물이기 때문에 타인에게 비밀을 털어 놓고 싶어하죠.</br>
                  그러나 때로는 비밀을 간직해야 할 때도 있습니다.</br>
                </br>
                  차마 남들에게 말하지 못했던 내 비밀을 털어 놓으면서</br>
                  다른 사람이 작성한 비밀까지 볼 수 있는 서비스를 선사합니다.</br>
                </br>
                  주위 사람들에게 털어 놓을 수 없는, 털어 놓지 못해 답답한 사람들을 위해</br>
                  자신만의 비밀이나 속마음을 어딘가에 쏟을 수 있도록 도와주는</br>
                  "임금님 귀는 당나귀 귀" 에서 사소하고 웃기고 슬픈 TMI를 익명으로 외쳐 보세요!</p>
              </article>

            <!-- login -->
              <article id="login">
                <h2 class="major">로그인</h2>
                <div class="field half">
                  <label for="demo-email">이메일</label>
                  <input type="email" name="demo-email" id="demo-email" placeholder="이메일을 입력하세요." />
                </div>
              </br>
                <div class="field half">
                  <label for="demo-password">비밀번호</label>
                  <input type="password" name="demo-password" id="demo-password" placeholder="비밀번호를 입력하세요."/>
                </div>
              </br>
                <div class="ear-button">
                  <a href="#" class="button primary" style="display: block;">입장하기</a>
                </div>
              </br></br></br>
              </article>

            <!-- signup -->
              <article id="signup">
                <h2 class="major">회원가입</h2>

                <div class="field half">
                  <label for="demo-name">Name</label>
                  <input type="text" name="demo-name" id="demo-name" value="" placeholder="Jane Doe" />
                </div>
                </br>
                <div class="field half">
                  <label for="demo-email">Email</label>
                  <input type="email" name="demo-email" id="demo-email" value="" placeholder="jane@untitled.tld" />
                </div>
                </br>
                <div class="field">
                  <label for="demo-message">Message</label>
                  <textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
                </div>
              
              </article>

            <!-- find ID/PW -->
            <article id="findidpw">
              <h2 class="major">ID/PW 찾기</h2>
              <div class="field half">
                <label for="demo-email">이메일</label>
                <input type="email" name="demo-email" id="demo-email" placeholder="이메일을 입력하세요." />
              </div>
            </br>
              <div class="field half">
                <label for="demo-password">비밀번호</label>
                <input type="password" name="demo-password" id="demo-password" placeholder="비밀번호를 입력하세요."/>
              </div>
            </br>
              <a href="#" class="button small">입장하기</a>
            </br></br></br>
            </article>

            <!-- 회원 -->
            <!-- mypage -->
              <article id="mypage">
                <h2 class="major">마이페이지</h2>
                <span class="image main"><img src="images/pic02.jpg" alt="" /></span>
                <p>Adipiscing magna sed dolor elit. Praesent eleifend dignissim arcu, at eleifend sapien imperdiet ac. Aliquam erat volutpat. Praesent urna nisi, fringila lorem et vehicula lacinia quam. Integer sollicitudin mauris nec lorem luctus ultrices.</p>
                <p>Nullam et orci eu lorem consequat tincidunt vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus pharetra. Pellentesque condimentum sem. In efficitur ligula tate urna. Maecenas laoreet massa vel lacinia pellentesque lorem ipsum dolor. Nullam et orci eu lorem consequat tincidunt. Vivamus et sagittis libero. Mauris aliquet magna magna sed nunc rhoncus amet feugiat tempus.</p>
              </article>

            <!-- board -->
              <article id="board">
                <h2 class="major">입장하기</h2>
                <h2 class="major">게시글 관리</h2>

              <section>
                <h3 class="major">Table</h3>
                <h4>Default</h4>
                <div class="table-wrapper">

                  <div class="field">
                    <label for="demo-category">카테고리</label>
                    <select name="demo-category" id="demo-category">
                      <option value="">-</option>
                      <option value="1">일상</option>
                      <option value="1">Shipping</option>
                      <option value="1">Administration</option>
                      <option value="1">Human Resources</option>
                    </select>
                  </div>

                  <table>
                    <thead>
                      <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>Item One</td>
                        <td>Ante turpis integer aliquet porttitor.</td>
                        <td>29.99</td>
                        <td>조회수</td>
                      </tr>
                      <tr>
                        <td>Item Two</td>
                        <td>Vis ac commodo adipiscing arcu aliquet.</td>
                        <td>19.99</td>
                        <td>조회수</td>
                      </tr>
                      <tr>
                        <td>Item Three</td>
                        <td> Morbi faucibus arcu accumsan lorem.</td>
                        <td>29.99</td>
                        <td>조회수</td>
                      </tr>
                      <tr>
                        <td>Item Four</td>
                        <td>Vitae integer tempus condimentum.</td>
                        <td>19.99</td>
                        <td>조회수</td>
                      </tr>
                      <tr>
                        <td>Item Five</td>
                        <td>Ante turpis integer aliquet porttitor.</td>
                        <td>29.99</td>
                        <td>조회수</td>
                      </tr>
                    </tbody>
                  </table>
                  <a href="#" class="button small">버튼 양식</a>
                </div>

              </article>

            <!-- write -->
              <article id="write">
                <h2 class="major">속삭이기</h2>
                <span class="image main"><img src="images/pic03.jpg" alt="" /></span>
                <p>Lorem ipsum dolor sit amet, consectetur et adipiscing elit. Praesent eleifend dignissim arcu, at eleifend sapien imperdiet ac. Aliquam erat volutpat. Praesent urna nisi, fringila lorem et vehicula lacinia quam. Integer sollicitudin mauris nec lorem luctus ultrices. Aliquam libero et malesuada fames ac ante ipsum primis in faucibus. Cras viverra ligula sit amet ex mollis mattis lorem ipsum dolor sit amet.</p>
              </article>
            
            <!-- 관리자 -->
            <!-- member -->
              <article id="member">
                <h2 class="major">회원 관리</h2>
                <span class="image main"><img src="images/pic03.jpg" alt="" /></span>
                <p>Lorem ipsum dolor sit amet, consectetur et adipiscing elit. Praesent eleifend dignissim arcu, at eleifend sapien imperdiet ac. Aliquam erat volutpat. Praesent urna nisi, fringila lorem et vehicula lacinia quam. Integer sollicitudin mauris nec lorem luctus ultrices. Aliquam libero et malesuada fames ac ante ipsum primis in faucibus. Cras viverra ligula sit amet ex mollis mattis lorem ipsum dolor sit amet.</p>
              </article>

          </div>

        <!-- Footer -->
          <footer id="footer">
            <p class="copyright">&copy; EAR. <a href="#">The king's ear is a donkey</a>.</p>
          </footer>

      </div>

    <!-- BG -->
      <div id="bg"></div>

    <!-- Scripts -->
      <script src="${contextPath}/assets/js/jquery.min.js"></script>
      <script src="${contextPath}/assets/js/browser.min.js"></script>
      <script src="${contextPath}/assets/js/breakpoints.min.js"></script>
      <script src="${contextPath}/assets/js/util.js"></script>
      <script src="${contextPath}/assets/js/main.js"></script>

  </body>
</html>
