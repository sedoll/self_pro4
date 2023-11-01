<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }
        #myTable{
            max-height: 600px;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-medium is-white">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
            장바구니
        </p>
        <p class="subtitle is-size-5">

        </p>
    </div>
</section>
<div class="content" id="content">
    <div class="row column text-center">
        <div class="container">
            <div  id="search_from">
                <select name="select_filter" id="select_filter">
                    <option value="1">과목</option>
                    <option value="2">강의명</option>
                    <option value="3">강사</option>
                </select>
                <input type="text" name="search_filter" id="search_filter">
            </div>
            <table id="myTable">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>과목</th>
                    <th>강의명</th>
                    <th>강사</th>
                    <th>가격</th>
                    <th>비고</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cart" items="${cartList }" varStatus="status">
                    <tr>
                        <td><span>${status.count }</span></td>
                        <td><span title="${cart.lec_no}">${lecList.get(status.index).cate}</span></td>
                        <td>${lecList.get(status.index).title}</td>
                        <td>${instList.get(status.index).name}</td>
                        <td><fmt:formatNumber value="${lecList.get(status.index).price}" type="number" pattern="#,##0" /></td>
                        <td>
                            <a href="${path}/payment/addPayment.do?lec_no=${cart.lec_no}" class="btn1">구매</a>
                            <a href="${path}/cart/cartDelete.do?cartno=${cart.cartno}" class="btn1">제거</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <script>
            $(document).ready( function () {
                let $table = $('#myTable').DataTable({
                    //search 창 오른쪽 상단으로 이동
                    "dom": '<"top"i>rt<"bottom"flp><"clear">',

                    pageLength : 5,
                    order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                    info: false,
                    lengthChange: false, // show entries 제거
                    language: {
                        emptyTable: '등록된 상품이 없습니다.'
                    }
                });

                $('.dataTables_paginate').css({
                    'textAlign':'center',
                    'float': 'none',
                    'margin-top':'10px',
                });

                $('.dataTables_filter').remove();  // dataTable 자체 search input 없애기

                $('#select_filter').change(function () { // select 선택값에 따라  해당 선택 열 input이 검색하는곳 변경
                    $table.columns('').search('').draw();
                    $table.columns(Number($('#select_filter').val())).search($('#search_filter').val()).draw();
                });

                $('#search_filter').keyup(function () { //input의 값대로 search
                    let $value = $(this).val();
                    $table.columns(Number($('#select_filter').val())).search($value).draw();
                })
            });
            $(document).ready(function() {
            });
        </script>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>