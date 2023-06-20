/**
 * 
 */
 
  // 체크인 select 요소 가져오기
  const dateSelect1 = document.querySelector('.dateCheck1');
  const today1 = new Date();
  const oneMonthLater1 = new Date();
  oneMonthLater1.setMonth(today1.getMonth() + 1);
  addDateOptions(today1, oneMonthLater1, dateSelect1);

  // 체크아웃 select 요소 가져오기
  const dateSelect2 = document.querySelector('.dateCheck2');
  dateSelect2.disabled = true; // 초기에 비활성화 상태로 설정

  // 체크인 select 변경 이벤트 리스너 추가
  dateSelect1.addEventListener('change', function () {
    const startDate = new Date(dateSelect1.value);
    const endDate = new Date(startDate);
    endDate.setMonth(startDate.getMonth() + 1);
    addDateOptions(startDate, endDate, dateSelect2);
    dateSelect2.disabled = false; // 체크인 선택 후에 활성화

    const checkoutDate = new Date(startDate);
    checkoutDate.setDate(checkoutDate.getDate() + 1); // 체크인 날짜 + 1일
    dateSelect2.value = checkoutDate.toISOString().split('T')[0]; // 체크아웃 select 요소에 설정

    // 이전 옵션 제거
    const options = dateSelect2.querySelectorAll('option');
    options.forEach((option) => {
      const date = new Date(option.value);
      if (date <= startDate) {
        option.remove();
      }
    });
  });

  // 날짜 옵션 추가 함수
  function addDateOptions(startDate, endDate, dateSelect) {
    dateSelect.innerHTML = ''; // 기존 옵션 초기화
    let currentDate = new Date(startDate);
    while (currentDate <= endDate) {
      const option = document.createElement('option');
      const dateValue = currentDate.toISOString().split('T')[0];
      option.value = String(dateValue);
      option.textContent = currentDate.toLocaleDateString();
      dateSelect.appendChild(option);
      currentDate.setDate(currentDate.getDate() + 1);
    }
  }
  
  
/**
 * 더보기 버튼 script
 */
  
// 페이지가 로드될 때 숨겨진 tr 요소와 "더 보기" 링크를 숨김
document.addEventListener("DOMContentLoaded", function() {
    var hiddenRows = document.querySelectorAll(".hiddenRow");
    var optionOpenBtn = document.querySelector(".option_openBtn");
    hiddenRows.forEach(function(hiddenRow) {
        hiddenRow.style.display = "none";
    });
    optionOpenBtn.style.display = "inline";
});

// "더 보기"를 클릭했을 때 숨겨진 tr 요소를 보이게 하고 "더 보기" 링크를 숨김
var optionOpenBtn = document.querySelector(".option_openBtn");
optionOpenBtn.addEventListener("click", function() {
    var hiddenRows = document.querySelectorAll(".hiddenRow");
    hiddenRows.forEach(function(hiddenRow) {
        hiddenRow.style.display = "table-row";
    });
    optionOpenBtn.style.display = "none";
});


init();

/**
 * 가격 체크박스 하나만 클릭할 수 있게 하는 스크립트
 */

function handleCheckbox(checkbox) {
	var checkboxes = document.getElementsByName('prices');
	checkboxes.forEach(function(element) {
		if (element !== checkbox) {
			element.checked = false;
		}
	});
}