<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display:inline-block;" class="mt200 ml30">
    <p class="tit_area big mb10">주문조회</p>
    <div class="table_basic_board board1">
        <table style="width: 800px;">
            <colgroup>
                <col width="*">
                <col width="110px">
            </colgroup>
            <thead>
                <tr>
                    <th>상품정보</th>
                    <th>가격</th>
                    <th>진행상태</th>
                </tr>
            </thead>
            <thead>
            	<tr>
            		<td colspan="3" style="text-align: left; padding: 8px;">
	            		<span style="padding-left: 20px">주문일자 : <b style="color:black">0000000</b></span>
	            		<span style="padding-left: 50px">주문번호 : <b style="color:black">0000000</b></span>
            		</td>
            	</tr>
            </thead>
            <tbody id="content">
            	<tr>
            		<td style="text-align: left; padding-left: 20px;">
            		<span style="display: inline-block; width: 100px; height: 100px; margin-bottom: 20px">
            			<img alt="이미지" src="http://localhost:8080/resources/product/img/dumbbell.jpg" style="width: 100%;">
            		</span>
            		<span style="display: inline-block;padding-left: 50px;vertical-align: middle;font-size: 17px;line-height: 25px;">
            			덤벨 1kg~10kg<br>
            			1Kg<br>
            			수량1개
            		</span>
            		</td>
            		<td style="font-size: 20px;">2,400원</td>
            		<td style="font-size: 20px;">주문완료</td>
            	</tr>
 			</tbody>
        </table>
    </div>
</div>