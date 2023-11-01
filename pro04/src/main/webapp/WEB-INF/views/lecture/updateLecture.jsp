<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 정보수정</title>


    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">



    <!-- 플러그인 연결-->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- 스타일 초기화 -->
    <link rel="stylesheet" href="${path }/css/reset.css">
    <!-- 웹 폰트 -->
    <link rel="stylesheet" href="${path }/css/font.css">

    <!-- css 모듈화 -->
    <link rel="stylesheet" href="${path }/css/common.css">
    <link rel="stylesheet" href="${path }/css/hd.css">
    <link rel="stylesheet" href="${path }/css/ft.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>
<div class="container-fluid">
    <%@ include file="../include/header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="${path }/ProList.do">Product</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Update</li>
                </ol>
            </div>
        </nav>
        <div class="container-fluid">
            <h2 class="title">상품 정보 수정</h2>
            <%--<aside class="col-3">

                <nav class="navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="" class="nav-link">공지사항 관리</a>
                        </li>
                        <li class="nav-item"><a href="">상품 관리</a>
                            <ul class="navbar-nav subnav">
                                <li class="nav-item"><a href="${path }/ProList.do" class="nav-link">상품목록</a></li>
                                <li class="nav-item"><a href="${path }/AddProduct.do" class="nav-link">상품등록</a></li>
                                <li class="nav-item"><a href="${path }/AddReceive.do" class="nav-link">입고</a></li>
                                <li class="nav-item"><a href="" class="nav-link"></a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a href="" class="nav-link">댓글 관리</a></li>
                    </ul>
                </nav>


            </aside>--%>
            <article class="col-9">
                <form name="frm1" id="frm1" action="${path }/UpdateProductPro.do" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <div class="form-row">
                                    <select name="cate" id="cate" class="form-control">
                                        <c:forEach var="cate" items="${cateList }" varStatus="status">
                                            <c:if test="${cate.cno.equals(pro.cate)}">
                                                <option value="${cate.cno }" selected>${cate.cname }</option>
                                            </c:if>
                                            <c:if test="${!cate.cno.equals(pro.cate)}">
                                                <option value="${cate.cno }">${cate.cname }</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pname">상품 이름</label></th>
                            <td>
                                <input type="hidden" name="no" id="no" value="${pro.no}">
                                <input type="text" name="pname" id="pname" placeholder="상품명 입력" class="form-control" value="${pro.pname }" maxlength="90" required />
                            </td>
                        </tr>
                        <tr>
                            <th><label for="pcomment">상품 설명</label></th>
                            <td><textarea rows="10" cols="100" name="pcomment" id="pcomment" placeholder="상품의 자세한 정보를 입력하세요" class="form-control" maxlength="1990" required>${pro.pcomment }</textarea></td>
                        </tr>
                        <tr>
                            <th><label for="plist">상품 목차</label></th>
                            <td><textarea rows="10" cols="100" name="plist" id="plist" placeholder="도서 상품의 목차를 입력하세요" class="form-control" maxlength="1990" required>${pro.pcomment }</textarea></td>
                        </tr>
                        <tr>
                            <th><label for="price">상품 가격</label></th>
                            <td><input type="number" name="price" id="price" placeholder="상품 가격 입력" value="${pro.price }" class="form-control" value="1000" min="1000" step="100" required></td>
                        </tr>
                        <tr>
                            <th><label for="imgsrc1">메인 이미지</label></th>
                            <td>
                                <img src="${path }/storage/${pro.imgSrc1}" alt="${pro.pname }" style="max-width:300px">
                                <input type="file" name="imgsrc1" id="imgsrc1" placeholder="상품 메인이미지" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="imgsrc2">설명 이미지</label></th>
                            <td>
                                <img src="${path }/storage/${pro.imgSrc2}" alt="${pro.pname }" style="max-width:300px">
                                <input type="file" name="imgsrc2" id="imgsrc2" placeholder="상품 설명이미지" class="form-control">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="imgsrc3">상품 동영상</label></th>
                            <td>
                                <img src="${path }/storage/${pro.imgSrc3}" alt="${pro.pname }" style="max-width:300px">
                                <input type="file" name="imgsrc3" id="imgsrc3" placeholder="상품 샘플 영상" class="form-control">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btn-group">
                        <input type="submit" name="submit-btn" class="btn btn-primary" value="상품수정">
                        <input type="reset" name="reset-btn" class="btn btn-primary" value="취소">
                        <a href="${path }/ProList.do" class="btn btn-primary">상품목록</a>
                    </div>
                </form>
                <script>

                </script>
            </article>
        </div>

    </div>
    <%@ include file="../include/footer.jsp" %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>