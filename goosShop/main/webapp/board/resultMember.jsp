<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">

<title>회원 정보</title>
</head>
  <title>로그인 성공</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <style>
    /* 아까 보내준 색상과 어울리게 커스텀 토스트 색상 예시 */
    .toast-custom {
      background-color: #4C5317; /* 진한 녹색 */
      color: white;
    }
    .btn-close-white {
      filter: invert(1); /* 닫기 버튼을 흰색으로 */
    }
  </style>
</head>
<body>
  
  <div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 1100;">
    <div id="loginToast" class="toast toast-custom align-items-center border-0" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body">
          로그인 성공! 환영합니다.
        </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="닫기"></button>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
  
  <script>
    var toastEl = document.getElementById('loginToast');
    var toast = new bootstrap.Toast(toastEl, { delay: 3000 });
    toast.show();

    // 3초 후 메인 페이지(예: index.jsp)로 이동
    setTimeout(function() {
      window.location.href = "main.jsp";  // 원하는 페이지로 변경하세요
    }, 3000);
  </script>

</body>
</html>
