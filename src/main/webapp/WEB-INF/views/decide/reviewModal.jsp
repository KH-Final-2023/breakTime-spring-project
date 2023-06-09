<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js" charset="UTF-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Document</title>
</head>
<style>

.reviewModal{
    position: fixed;
    bottom: 5%;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index : 1;
    
}


.reviewModal .reviewBg{
    width: 100%;
    height: 1000%;
    background-color: rgba(0, 0, 0, 0.6);
}



.reviewModal .reviewCloseBtn {
    position: absolute;
    top: 10px;
    right: 25px;
    background-color: #fff;
    border: none;
    font-size: 24px;
}


.modalBox {
    position: absolute;
    background-color: #fff;
    width: 450px;
    height: 550px;
    border-radius: 16px;
    
}
.modalBox .reviewHeader{
    width: 100%;
    height: 29px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.modalBox .reviewBody{
    width: 500px;
    height: 150px;
    padding: 20px 20px;
}

#search-input{
	width: 430px;
	height: 45px;
}


.hidden {
    display: none;
}

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 400px;
    height: 350px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}



</style>
<body>

        <button class="reviewOpenBtn">리뷰작성</button>


        
        <div class="reviewModal hidden">
            <div class="reviewBg"></div>
            <div class="modalBox">
				<button class="reviewCloseBtn">X</button>
				<div class="reviewHeader">
					<p>리뷰</p>
				</div>
				<div class="reviewBody">
					<form class="mb-3" name="myform" id="myform" method="post">
                        <fieldset>
                            <input type="radio" name="reviewStar" value="5" id="rate1"><label
								for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5"><label
								for="rate5">★</label>
                        </fieldset>
                        <div>
                            <textarea class="col-auto form-control" type="text" id="reviewContents"
                                      placeholder="breaktime 리뷰를 남겨주세요"></textarea>
                        </div>
                    </form>
                    <input type="submit" value="리뷰작성" id="reviewCommit">
				</div>
            </div>
        </div>
        
        
       
        
        
        <script>
        function insertReview(){
						
						$.ajax({
							url: "${contextPath}/review/insert",
							data : {
								reviewNo : '${reviewNo}',
								reviewContent: $("#reviewContent").val(),
								reviewWriter : '${loginUser.userNo}'
							},
							type : 'POST',
							success : function (result){
								if(result == "1"){
									alertify.alert("서비스 요청 성공", '댓글 등록 성공' );
								}else{
									alertify.alert("서비스 요청 실패", '댓글 등록 실패' );
								}
								selectReviewList();
							},
							complete : function(){
								$("#reviewContent").val("");
							}
							
						})
						
					}
        
    		</script>		
    			
    
    
    <script>
            const open = () => {
                document.querySelector(".reviewModal").classList.remove("hidden");
                
            }
            const close = () => {
				console.log('cdlose')
                document.querySelector(".reviewModal").classList.add("hidden");
            }
            document.querySelector(".reviewOpenBtn").addEventListener("click", open); 
            document.querySelector(".reviewCloseBtn").addEventListener("click", close); 
            document.querySelector(".reviewBg").addEventListener("click", close); 

        </script>
        
        
        <%-- <script >
        function insertReview(){
        	
        	$.ajax({
        		url : '<%=request.getContextPath()%>/',
        		data : { "contents" : $('#reviewContents').val()
        		},
        		complete : function(){
        			getReview();
        		}
        		
        	});
        }
        
        </script> --%>
        
        
        
        
        <%-- <script>
    	function getDday(){
    		$.ajax({
    			url : '<%=request.getContextPath()%>/',
    			
    			success : function(Dday){
    				console.log(Dday);
    				if(Dday.length == 0){
                        $('#dDayList').html(`
                        		<div class="openBtn2" id="ddayBox">
        						<div>
        							<p class="titleText">디데이 예시</p>
        							<p class="dateText">2023.09.09(일)</p>
        						</div>
        						<div>
        							<p class="ddayText">D-100</p>
        						</div>
        					</div>`);
                    }else{
                    	$('#dDayList').html('');
                    	$(Dday).each(function(index,item){
                    		let dDaySplit = item.dDay.replace('월',',').split(',');
                    		let dDay = dDaySplit[2]+'/'+dDaySplit[0] + '/' +dDaySplit[1];
               				if(Math.ceil((new Date(dDay)-new Date())/1000/60/60/24) > 0){
	                    		$('#dDayList').append(`
	                    				<div class="openBtn2" id="ddayBox\${index}" data-dno="\${item.dDayNo}">
	            						<div>
	            							<p class="titleText">\${item.title}</p>
	            							<p class="dateText">\${item.dDay}</p>
	            						</div>
	            						<div>
	            							<p class="ddayText">D-\${Math.ceil((new Date(dDay)-new Date())/1000/60/60/24)}일</p>
	            						</div>
	            					</div><br>`);
               				}else {
               					$('#dDayList').append(`
	                    				<div class="openBtn2" id="ddayBox\${index}" data-dno="\${item.dDayNo}">
	            						<div>
	            							<p class="titleText">\${item.title}</p>
	            							<p class="dateText">\${item.dDay}</p>
	            						</div>
	            						<div>
	            							<p class="ddayText">종료</p>
	            						</div>
	            					</div><br>`);
               				}
                    		
                    		$('#ddayBox'+index).click(updateDday(item.dDayNo));
                    		
                    	})
                    	
                    	
                    }
    				
    			}
    			
    		})
    		
    	}
    	
    
    </script> --%>
        
        
        
    
    
    
    
    
    <script>
    function enterkey() {
    	if (window.event.keyCode == 13) {
        	
        }
    }
     
    </script>
    
</body>
</html>