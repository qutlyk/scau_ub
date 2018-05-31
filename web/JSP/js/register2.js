 $(function() {

	$('#switch_qlogin').click(function() {
		$('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_bottom').animate({
			left : '0px',
			width : '70px'
		});
		$('#qlogin').css('display', 'none');
		$('#web_qr_login').css('display', 'block');

	});
	$('#switch_login').click(function() {

		$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
		$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
		$('#switch_bottom').animate({
			left : '154px',
			width : '70px'
		});

		$('#qlogin').css('display', 'block');
		$('#web_qr_login').css('display', 'none');
	});
	if (getParam("a") == '0') {
		$('#switch_login').trigger('click');
	}

});

function logintab() {
	scrollTo(0);
	$('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
	$('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
	$('#switch_bottom').animate({
		left : '154px',
		width : '96px'
	});
	$('#qlogin').css('display', 'none');
	$('#web_qr_login').css('display', 'block');

}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) {
	var params = location.search.substr(1); // 获取参数 平且去掉？ 
	var ArrParam = params.split('&');
	if (ArrParam.length == 1) {
		//只有一个参数的情况 
		return params.split('=')[1];
	} else {
		//多个参数参数的情况 
		for (var i = 0; i < ArrParam.length; i++) {
			if (ArrParam[i].split('=')[0] == pname) {
				return ArrParam[i].split('=')[1];
			}
		}
	}
}


var reMethod = "GET",
	pwdmin = 6;

$(document).ready(function() {
	
	$('#changepw').click(function() {
		
		var okcha=true;
		
		if ($('#userid').val() == "") {
			$('#userid').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×请输入你的学号</b></font>");
			okcha=false;
			return false;
		}

		if ($('#userid').val().length != 12) {

			$('#userid').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×找不到此学号</b></font>");
			okcha=false;
			return false;
		}
		if ($('#passwd').val().length < pwdmin) {
			$('#passwd').focus();
			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
			return false;
		}
		if ($('#passwd2').val() != $('#passwd').val()) {
			$('#passwd2').focus();
			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
			okcha=false;
			return false;
		}
		
		if(okcha){

		$.ajax({
			type : "POST",
			url : "PasswordServlet",
			data : {
				"userid" : $("#userid").val(),
				"phone":  $("#phonenum").val(),
				"qq":$("#qq").val(),
				"password" : $("#passwd").val()
			},
			success : function(msg) {
				var dataObj = eval("(" + msg + ")");
				if (dataObj.length < 2) {
					//alert("登录sssssssss");
					$('#userCue1').html("<font color='red'><b>×你的身份验证有误</b></font>");

				} else {
					//alert("登录成功");
					//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
					window.location.href = "../../WEB-INF/jsp/index.html";
				}
			},
			error : function(e) {
				alert('数据连接失败yan', e);
			}
		});


		}
		//alert($("#u").val()+"nali  :"+date);
		return false;

	});



	$('#loginb').click(function() {
		
		var isloginok=true;
		
		if ($("#u").val() == "") {
			$('#u').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue1').html("<font color='red'><b>×请输入你的学号</b></font>");
			isloginok=false;
			return false;
		}
		
		if ($("#p").val() == "") {
			$('#p').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue1').html("<font color='red'><b>×请输入密码</b></font>");
			isloginok=false;
			return false;
		}

		if ($('#u').val().length != 12) {

			$('#u').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue1').html("<font color='red'><b>×找不到此学号</b></font>");
			isloginok=false;
			return false;
		}
		
		
if(isloginok){
		$.ajax({
			type : "POST",
			url : "UserServlet",
			data : {
				"userid" : $("#u").val(),
				"password" : $("#p").val()
			},
			success : function(msg) {
				var dataObj = eval("(" + msg + ")");
				if (dataObj.length < 2) {
					//alert("登录sssssssss");
					$('#userCue1').html("<font color='red'><b>×请检查你的学号和密码是否正确</b></font>");

				} else {
					//alert("登录成功");
					//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
					window.location.href = "home1.jsp?userid="+$("#u").val();
				}
			},
			error : function(e) {
				alert('数据连接失败login', e);
			}
		});

}

		//alert($("#u").val()+"nali  :"+date);
		return false;

	});
	    
	$('#regbtnn').click(function() {
		
		
		var okreg=true;
		
		
		/*$.ajax({
			type : "POST",
			url : "RegisterServlet",
			data : {
				"userid" : $("#stuid").val(),
				"username" : $('#user').val(),
				"password" : $("#passwd").val(),
				"qq" : $('#qq').val()
			},
			success : function(msg) {
				var dataObj = eval("(" + msg + ")");
				if (dataObj.length < 2) {
					//alert("登录sssssssss");
					$('#userCue').html("<font color='red'><b>×该学号已被注册或者不存在</b></font>");
				//window.location.href="home1.jsp"; 
				} else {
					//alert("登录成功");
					//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
					//window.location.href="home1.jsp"; 
					window.location.href = "login.jsp";
				}
			},
			error : function(e) {
				alert('数据连接失败', e);
			}
		});*/

		if ($('#stuid').val() == "") {
			$('#stuid').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×请输入你的学号</b></font>");
			okreg=false;
			return false;
		}
		
		if ($('#phone').val() == "") {
			$('#stuid').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×请输入你的手机号码</b></font>");
			okreg=false;
			return false;
		}
		
		if ($('#address').val() == "") {
			$('#stuid').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×请输入你的地址</b></font>");
			okreg=false;
			return false;
		}
		
		if ($('#stuid').val().length != 12) {

			$('#user').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×学号格式有误</b></font>");
			okreg=false;
			return false;
		}
		
		if ($('#qq').val().length <9) {
			$('#stuid').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×qq号格式有误</b></font>");
			okreg=false;
			return false;
		}

		if ($('#user').val() == "") {
			$('#user').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×用户名不能为空</b></font>");
			okreg=false;
			return false;
		}


//
//		//$('#user').val().length < 4 || $('#user').val().length > 16
//		if ($('#user').val().length < 2 || $('#user').val().length > 8) {
//
////			$('#user').focus().css({
//				border : "1px solid red",
//				boxShadow : "0 0 2px red"
//			});
//			$('#userCue').html("<font color='red'><b>×用户名位2-8字符</b></font>");
//			okreg=false;
//			return false;
//
//		}
		/*$.ajax({
			type: reMethod,
			url: "/member/ajaxyz.php",
			data: "uid=" + $("#user").val() + '&temp=' + new Date(),
			dataType: 'html',
			success: function(result) {

				if (result.length > 2) {
					$('#user').focus().css({
						border: "1px solid red",
						boxShadow: "0 0 2px red"
					});$("#userCue").html(result);
					return false;
				} else {
					$('#user').css({
						border: "1px solid #D7D7D7",
						boxShadow: "0 0 2px red"  
					});
					$('#userCue').html("<font color='red'><b>×该学号已注册</b></font>");
				}

			}
		});*/


//		if ($('#passwd').val().length < pwdmin) {
//			$('#passwd').focus();
//			$('#userCue').html("<font color='red'><b>×密码不能小于" + pwdmin + "位</b></font>");
//			return false;
//		}
//		if ($('#passwd2').val() != $('#passwd').val()) {
//			$('#passwd2').focus();
//			$('#userCue').html("<font color='red'><b>×两次密码不一致！</b></font>");
//			okreg=false;
//			return false;
//		}

		var sqq = /^[1-9]{1}[0-9]{4,9}$/;
		if (!(sqq.test($('#qq').val()) || $('#qq').val().length > 5 || $('#qq').val().length <= 12)) {
			$('#qq').focus().css({
				border : "1px solid red",
				boxShadow : "0 0 2px red"
			});
			$('#userCue').html("<font color='red'><b>×QQ号码格式不正确</b></font>");return false;
			okreg=false;
		} /*else {
			$('#qq').css({
				border : "1px solid #D7D7D7",
				boxShadow : "none"
			});
			//window.location.href = "login.jsp";
		}*/
		
		
		if(okreg){
			//alert("叶镇亮你成功了");
			$.ajax({
				type : "POST",
				url : "RegisterServlet",
				data : {
				 	"userid" :  $("#stuid").val(),
					"username" : $('#user').val(),
					"phone" : $("#phone").val(),
					"address" : $("#address").val(),
					"userqq" : $('#qq').val(),
					"money":$('#money').val()
				},
			success : function(msg) {
				var dataObj = eval("(" + msg + ")");
				if (dataObj.length < 2) {
					alert("注册sssssssss");
					$('#userCue1').html("<font color='red'><b>×请检查你的学号和密码是否正确</b></font>");
				} else {
					$('#userCue1').html("<font color='red'><b>成功</b></font>");
					alert("信息已完善");
					//$('#userCue1').html("<font color='red'><b>登录页成功</b></font>");
					window.location.href = "home1.jsp?userid="+$("#stuid").val();
				}
			},
			error : function(e) {
				alert('数据连接ddd失败', e);
			}
		});
	}
		
		
		
		

		
	});


});