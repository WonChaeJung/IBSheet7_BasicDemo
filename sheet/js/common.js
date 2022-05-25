try{
	// top.D_$_ = null
}catch(e){
	console.log(e);
};

function detectmob() {
	var userAgent = navigator.userAgent; 
	if(userAgent.match(/Android/i) || userAgent.match(/webOS/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPad/i) ||
		userAgent.match(/iPod/i) || userAgent.match(/BlackBerry/i) || userAgent.match(/Windows Phone/i)){
		return true;
	}else {
		return false;
	}
}

document.write("<link rel='stylesheet' href='../../common/css/style.css'/>");

if(detectmob()){
	document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/jquery.mobile-1.3.2.js'></script>");
}else{
	document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/jquery-1.7.2.min.js'></script>");
}

// document.write("<script type='text/javascript' charset='utf-8' src='../../license/ibleaders.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/jquery.cookie.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/jquery.treeview.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/jquery.easing.1.3.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/iepngfix_tilebg.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/contact.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/debounce.js'></script>");
document.write("<script type='text/javascript' charset='utf-8' src='../../common/js/etc.js'></script>");


function fetchChrome76(sheetNodeId){
    for(var node = document.getElementById(sheetNodeId); node && node.tagName!="BODY" ; node = node.parentNode){
           if(node.style.clear){
               node.style.clear = "none";
               node.className = node.className + " clsBoth";
               var cssTemplateString = '.clsBoth:after{clear: both}';
               var styleTag = document.createElement("style");
               styleTag.innerHTML = cssTemplateString;
               document.head.insertAdjacentElement('beforeend', styleTag);
               break;
          }else{
          var clsName = node.className;
                if(clsName != ""){
                   clsArr = clsName.split(" ");
                   for(var i=0;i<clsArr.length;i++){
                       var cs = getComputedStyle(node,clsArr[i]);
                       if(cs.getPropertyValue("clear") == "both"){
                           node.style.clear = "none";
                           var cssTemplateString = '.'+clsArr[i]+':after{clear: both}';
                           var styleTag = document.createElement("style");
                           styleTag.innerHTML = cssTemplateString;
                           document.head.insertAdjacentElement('beforeend', styleTag);
                            
                            var emptydiv = document.createElement("div");
                            emptydiv.style.clear = "both";
                            node.before(emptydiv);
                           break;
                       }
                   }
                   if(styleTag) break;
                }
          }
    }
}
