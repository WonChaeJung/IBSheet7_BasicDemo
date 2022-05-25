<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta http-equiv="Expires" content="0"/>
		<meta http-equiv="Pragma" content="no-cache"/>
		<script language="javascript" src="../sheet/ibsheetinfo.js"></script>
		<script language="javascript" src="../sheet/ibsheet.js"></script>
		<style>
			html,body{width:100%;height:100%;padding:0px;margin:0px}
		</style>
		<script>
			function init(){
				//sheet 초기화
		  		var initData = {};
					initData.Cfg = {SearchMode:smLazyLoad, Page:30,MouseHoverMode:2};
					initData.Cols = [
						{Header:"No",Type:"Seq", SaveName:"dSeq", Width:40, Align:"Center",Edit:0},
						{Header:"통화",Type:"Text", SaveName:"CURRENCY", Width:120, Align:"Center",Edit:0},
						{Header:"ISO",Type:"Text", SaveName:"ISO", Width:60, Align:"Center",Edit:0},
						{Header:"기호",Type:"Text", SaveName:"SYMBOL", Width:80, Align:"Center",Edit:0},
						{Header:"10진수",Type:"Int", SaveName:"DEC", Width:80, Align:"Center",Edit:0}
					];
					initData.HeaderMode  = {ColMove:1};
					IBS_InitSheet(popupSheet,initData);
					
					//데이터 조회
					popupSheet.DoSearch("./data/popup_data.json");
			}
			
			//조회 완료 이벤트
			function popupSheet_OnSearchEnd(code,msg){
				var cur = "<%=request.getParameter("searchCondition")%>";
				//어미 창에서 선택한 ISO와 동일한 값을 찾아 행을 이동 시킨다.
				var row = popupSheet.FindText("ISO",cur);
				//행 이동(SelectCell 함수도 있음)
				popupSheet.SetSelectRow(row);
			}
			
			//더블 클릭 이벤트 (주의:모바일에서는 동작하지 않음)
			function popupSheet_OnDblClick(Row, Col, Value, CellX, CellY, CellW, CellH) { 
				//더블클릭한 행의 데이터를 json 형식으로 추출
				var rowData = popupSheet.GetRowData(Row);
				//어미 창의 시트에 세팅
				parent.setData(rowData);
				//현재 창을 감춘다.
				parent.showAndHide(0);
			}
			
			function popupSheet_OnKeyDown(Row, Col, KeyCode){
				if(KeyCode == "13"){
					var rowData = popupSheet.GetRowData(Row);
					//어미 창의 시트에 세팅
					parent.setData(rowData);
					//현재 창을 감춘다.
					parent.showAndHide(0);
				}else if (KeyCode == "27"){
					parent.showAndHide(0);
					parent.Grids[0].SetFocus();
				}
			};
		</script>
	</head>
	<body onload="init()" style="overflow:hidden">
		<script>createIBSheet("popupSheet","100%","100%");</script>
	</body>
</html>