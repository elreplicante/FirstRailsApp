// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
console.log(_.sortBy([1, 2, 3, 4, 5, 6], function(num){ return Math.sin(num); }))
console.log("yey");
	$("select").change(function() {
  		var json_table = $('#locations_table').tableToJSON(); // Convert the table into a javascript object
  		var names = _.sortBy(json_table, function(item){return item.Name});
  		$('#locations_table').innerHTML = "";
  		$.jsontotable(names, { id: '#locations_table', header: false, className: 'table'});
	});

});