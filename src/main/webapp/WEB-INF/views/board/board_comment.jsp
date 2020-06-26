<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>

<style>
	#comment_head { text-align:left; }
	#comment_table { width:1140px; height:100px; border:1px solid #000 ; margin-bottom: 20px; padding:10px;}
	#comment_left { width:80%; float:left}
	#comment_right { width:20%; float:right}
</style>
    
<div class="comment">
	<form id="commentForm" name="commentForm" method="post">
		<input type="hidden" id="bno" name="bno" value="${boardVO.bno}"/>
		<div>
			<div>
				<table class="table" style="border:2px solid #000000">
					<tr>
						<td>
							<span><h3>Comment</h3></span><span id="cCnt"></span>
						</td>
					</tr>
					<tr>
						<td>
							<textarea style="width:1200px;" rows="5" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
							<br>
							<div>
								<a href='#' onclick="save_comment('${boardVO.bno}')" class="btn pull-right btn-success">등록</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div> 

<div class="container">
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="commentList">
				<input type="hidden" id="userid" name="userid" value="${member.userid}">
			</div>
		</form>		
</div>

<script type="text/javascript">
// 초기 로딩시 상품평 목록 불러오기
$(function(){
	
	getCommentList();
	
});


function save_comment(bno){
		
		$.ajax({
			type:'POST',
			url: 'board_comment_insert',
			data: $("#commentForm").serialize(), 
			success: function(data){
				if(data =="success") { 
					getCommentList(); 
					$("#content").val("");
				}else {
					alert("로그인이 필요합니다.");
				}
			},
			error: function(request, status, error){
				alert("error:"+error);
			}
		});
	} 

	function getCommentList(){
		$.ajax({
			type: 'GET',
			url: 'board_comment_list',
			dataType: "json",
			data: $("#commentForm").serialize(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				
				var html = "";
				var cCnt = data.length;
				
				if(data.length > 0){
					for(i=0; i<data.length; i++){
						html += "<div id=\"comment_table\">";
						html += "<table id=\"comment_left\"><tr><td><strong>" + data[i].writer + "</strong>&emsp;"
						html += "<span id=\"writer_date\">" + displayTime(data[i].regdate) + "<span></td></tr>"
						html += "<tr><td>"+ data[i].content + "<br></td></tr></table>";
					if(document.commentListForm.userid.value == data[i].writer){
						html += "<table id=\"comment_right\"><tr><td style='text-align:right;'>";
						html += "<a href=\"board_comment_delete?comment_no="+data[i].comment_no+"&bno="+data[i].bno+"\">삭제</a></td></tr></table>";
					}
						html += "</div>";
					}
				} else {
					html += "<div>";
					html += "<div><h6>등록된 상품평이 없습니다.</h6>";
					html += "</div>";
					html += "</div>";
				}
				
				$("#cCnt").html(cCnt + "개의 댓글이 있습니다."); // 상품평의 갯수 출력
				$("#commentList").html(html);
			},
			error : function(request, status, error){
				alert("comment 목록을 조회하지 못했습니다.");
			}
		});
	}

	// 작성일 출력 함수
	function displayTime(timeValue) {
		var today = new Date();
		
		// 24시간 이내인지 계산하기 위함
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str = "";
		
		// 24시간 이내일 경우 시,분,초만 표시
		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh>9 ? '' : '0') + hh, ':', (mi>9 ? '' : '0') + mi, ':',
					(ss>9 ? '' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm>9 ? '':'0') + mm, '/',
					(dd>9 ? '':'0') + dd].join('');
		}
	}



</script>