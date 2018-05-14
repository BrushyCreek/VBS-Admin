// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener("turbolinks:load", function() {
    if (document.boy.classList.contains("familyform"))
    function addAnotherKid() {
	console.log("event hit");
	var target = document.getElementById("kids");
	var source = document.getElementById("kid_form_template").innerHTML;
	source.replace(/index_to_replace_with_js/g, new Date().getTime());
	var frag = document.createRange().createContextualFragment(source);
	target.appendChild(frag);
    }
    console.log("in script");
    var add_kid_button = document.getElementById("add_kid");
    add_kid_button.addEventListener("click", addAnotherKid, false);
}
