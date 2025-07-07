/*!
* Start Bootstrap - Shop Homepage v5.0.6 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

function checkForm() {
    console.log("checkForm() 실행됨");

    const form = document.forms['newWrite'];

    if (!form.b_name.value) {
        alert("성명을 입력하세요.");
        form.b_name.focus();
        return false;
    }

    if (!form.subject.value) {
        alert("제목을 입력하세요.");
        form.subject.focus();
        return false;
    }

    if (!form.content.value) {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }

    return true; // 모든 값이 있으면 정상 제출
}