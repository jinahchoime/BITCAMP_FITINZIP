<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display: inline-block;" class="mt200 ml30">
    <a class="tit_area big mb10" style="display: inline-block; margin-right: 15px; text-decoration: none;" id="nowBtn">나의 클래스</a>
    <a class="tit_area big mb10" style="display: inline-block; color: #ccc; font-weight: 500; text-decoration: none;"
    id="endBtn">종료된 클래스</a>
    <div class="table_basic_board board1">
        <table style="width: 800px;">
            <colgroup>
                <col width="*">
                <col width="110px">
            </colgroup>
            <thead>
                <tr>
                    <th>클래스</th>
                    <th>결제정보</th>
                    <th>입장</th>
                </tr>
            </thead>
            <tbody id="content">
 			</tbody>
        </table>
        <div id="btn"></div>
    </div>
</div>