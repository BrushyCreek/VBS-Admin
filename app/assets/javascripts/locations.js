// JS file for locations controller

function contains(list, value) {
    for( var i = 0; i < list.length; ++i ) {
        if(list[i] === value) return true;
    }
    return false;
}

function dragstart_handler(ev) {
    ev.stopPropagation();
    console.log("dragstart");
    ev.target.classList.add("draged");
    ev.dataTransfer.setData("text/html", ev.target.id);
    ev.dataTransfer.effectAllowed = "move";
    console.log("Started dragging:", ev.target);
    //TODO: set the drag image so that it is the whole element being dragged,
    // currently it will be cut off if the whoe element isnt visible
}

function dragenter_handler(ev) {
    ev.preventDefault();
    ev.stopPropagation();
    console.log("dragenter");
    ev.currentTarget.classList.add("dropable");
    console.log("Dragged Into:", ev.currentTarget);
}

function dragover_handler(ev) {
    if (ev.dataTransfer.types.includes("text/html")) {
	ev.stopPropagation();
	// console.log("dragging over");
	ev.preventDefault();
	ev.dataTransfer.dropEffect = "move";
	//console.log(ev.dataTransfer.dropEffect);
    }
}
	    
function dragleave_handler(ev) {
    ev.stopPropagation();
    ev.currentTarget.classList.remove("dropable");
    console.log("dragging left:", ev.currentTarget);
}

function dragend_handler(ev) {
    ev.preventDefault();
    ev.stopPropagation();
    console.log("dragend");
    ev.target.classList.remove("draged");
}

function drop_handler(ev) {
    ev.preventDefault();
    ev.stopPropagation();
    ev.currentTarget.classList.remove("dropable");
    console.log("drop");
    var data = ev.dataTransfer.getData("text/html");
    var ElmToAdd = document.getElementById(data);
    var destLocationElm = ev.currentTarget;
    
    if (ElmToAdd.hasAttribute("data-volunteer-id")) {
	// send AJAX request to add succsefullt draged kid to group
	// reload the table adding kid to top of it
	// we may need to remove the kids card from the bucket here
	// so that we can wait to make sure the request went through
	send_volunteer_location_change(ElmToAdd, switch_location_leaders_table, destLocationElm);
    }
}

function send_volunteer_location_change (leaderToAddElm, doOnSuccess, destLocationElm) {
    var leaderToAddId = leaderToAddElm.getAttribute("data-volunteer-id");	
    var destLocationId = destLocationElm.getAttribute("data-location-id");
    $.ajax({
	url:"/location/update_volunteer_assignment",
	method: "POST",
	beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
	data:{"id" : destLocationId, "volunteer_id" : leaderToAddId},
	dataType: "html",
	success: function(response) {
	    doOnSuccess(destLocationElm, response);
	    leaderToAddElm.closest(".leadercard").remove();
	}
    });
}

function switch_location_leaders_table(dest, result) {
    var table = dest.querySelector("table");
    table.innerHTML = "";
    table.innerHTML = result;
}

function send_alert(text) {
    alert(text);
}

document.addEventListener("turbolinks:load", function() {
    if (document.body.classList.contains("locations")) { // this first checks that we are on a page belonging to the correct  rails controller.

	$.ajaxSetup({
	    headers: {
		'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
	    }
	});
	
	var bucketOfDraggableLeaders = document.getElementById("leaders-div");
	bucketOfDraggableLeaders.addEventListener("dragstart", dragstart_handler, false);
	bucketOfDraggableLeaders.addEventListener("dragend", dragend_handler, false);

	var bucketOfDroppableLocations = document.querySelectorAll(".locationcard");
	console.log(bucketOfDroppableLocations);
	for (var i = 0; i < bucketOfDroppableLocations.length; i++) {
	    var droppableLocation = bucketOfDroppableLocations[i]
	    // for (let droppableGroup of bucketOfDroppableGroups) {	 
	    new Dragster(droppableLocation); // using dragster.js to create custom dragenter and drag leave events beacus the default suck
	    droppableLocation.addEventListener("dragster:enter", dragenter_handler, false);
	    droppableLocation.addEventListener("dragster:leave", dragleave_handler, false);
	    // droppableGroup.addEventListener("dragenter", dragenter_handler, false);
	    // droppableGroup.addEventListener("dragleave", dragleave_handler, false);
	    droppableLocation.addEventListener("dragover", dragover_handler, false);
	    droppableLocation.addEventListener("drop", drop_handler, false);
	    
	}
	
    } // end if statment testing for body class
});
    


