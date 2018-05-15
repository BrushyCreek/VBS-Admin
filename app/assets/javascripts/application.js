// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's 
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require dragster

document.addEventListener("turbolinks:load", function() {
    var showotherToggles = document.querySelectorAll("[data-toggle='showother']");
    console.log(showotherToggles);
    for (var i = 0; i < showotherToggles.length; i++) {
	var current = showotherToggles[i]
	current.addEventListener("click", function(event) {
	    console.log("clicked something");
	    var target = document.getElementById(event.currentTarget.dataset.toggleTarget);
	    target.setAttribute("style", "");
	}, false);
    }
});

