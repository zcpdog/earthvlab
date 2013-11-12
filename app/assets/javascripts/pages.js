$(function() {
	$("a.active").closest("li.menu-item").addClass("current-menu-item");
	$("a.active").closest("li.page_item").addClass("current_page_item");
});