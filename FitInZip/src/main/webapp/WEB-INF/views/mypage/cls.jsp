<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="position: absolute; width: 1000px; top: 205px; right: 200px;">
    <p class="tit_area big mb10">나의 클래스</p>
    <div class="table_basic_board board1">
        <table style="width: 800px;">
            <colgroup>
                <col width="*">
                <col width="110px">
            </colgroup>
            <thead>
                <tr>
                    <th>클래스</th>
                    <th>진행상태</th>
                </tr>
            </thead>
            <tbody id="content">
 			</tbody>
 			<!-- <input type="button" value="btn" onclick="clsdata()"> -->
        </table>
    </div>
    <p class="tit_area big mb10">종료된 클래스</p>
    <div class="table_basic_board board1">
        <table style="width: 800px;">
            <colgroup>
                <col width="*">
                <col width="110px">
            </colgroup>
            <thead>
                <tr>
                    <th>클래스</th>
                    <th>입장</th>
                </tr>
            </thead>
            <tbody id="end_content">
            </tbody>
        </table>
    </div>
</div>