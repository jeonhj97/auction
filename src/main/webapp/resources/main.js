'use strict';

/* navbar,sidebar 관련 */

$('.navbar__toggler').on('click', function() {

    $('.navbar__toggler').toggleClass('active');
    $('.sidebar').toggleClass('active');
    $('.sidebar__overlay').toggle();
});

$('.sidebar__overlay').on('click', function() {
    $('.navbar__toggler').removeClass('active');
    $('.sidebar').removeClass('active');
    $('.sidebar__overlay').toggle();
});

$('#passwd').on('click', function() {
    $('.tooltip_typeUpper').toggle();
});

$('#btnClose').on('click', function() {
    $('.tooltip_typeUpper').toggle();
});
/*
$('#passwd').find('input').focus(function() {
    var targetName = returnTagetName(this);
    targetName.siblings('.tooltip_typeUpper').show();
});
$('#btnClose').find('input').focusout(function() {
    var targetName = returnTagetName(this);
    targetName.siblings('.tooltip_typeUpper').hide();
});
*/

$(document).ready(function() {
    $('.check-all').click(function() {
        $('.ab').prop('checked', this.checked);
    });
});


/* 회원가입 버튼관련 */
$('#passwd').on('click', function() {
    $('.tooltip_typeUpper').toggle();
});

$('#btnClose').on('click', function() {
    $('.tooltip_typeUpper').toggle();
});

$(document).ready(function() {
    $('.check-all').click(function() {
        $('.ab').prop('checked', this.checked);
    });
});


/* 로그아웃 */
$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="logout";
	});
});






		
		
		

