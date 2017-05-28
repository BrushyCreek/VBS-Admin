// JS file for groups controller

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
    if (ev.dropEffect === 'none') {
	ev.target.classList.remove("draged");
    }
    else {
	ev.target.closest(".kidcard-col").remove();
    }
}

function drop_handler(ev) {
    ev.preventDefault();
    ev.stopPropagation();
    ev.currentTarget.classList.remove("dropable");
    console.log("drop");
    var data = ev.dataTransfer.getData("text/html");
    var draggedElement = document.getElementById(data);
    if (draggedElement.hasAttribute("data-kid-id")) {
	// send AJAX request to add succsefullt draged kid to group
	//realod the table adding kid to top of it
	var kidToAdd = draggedElement.getAttribute("data-kid-id");
	var destGroup = currentTarget.getAttribute("data-group-id");
    }
    console.log("Dropped:", draggedElement);
    console.log("Dropped on:", ev.currentTarget);
}

function ancesterWithClass(elm, ancesterClass) {
    // find the nearest ancestor of element with the attribute of attr
}


document.addEventListener("turbolinks:load", function() {
    if (document.body.classList.contains("groups")) { // this first checks that we are on a page belonging to the correct  rails controller.
	
	var bucketOfDraggableKids = document.getElementById("kids-div");
	console.log(bucketOfDraggableKids);
	bucketOfDraggableKids.addEventListener("dragstart", dragstart_handler, false);
	bucketOfDraggableKids.addEventListener("dragend", dragend_handler, false);

	var bucketOfDroppableGroups = document.querySelectorAll(".groupcard");
	console.log(bucketOfDroppableGroups);
	for (let droppableGroup of bucketOfDroppableGroups) {
	    new Dragster(droppableGroup); // using dragster.js to create custom dragenter and drag leave events beacus the default suck
	    droppableGroup.addEventListener("dragster:enter", dragenter_handler, false);
	    droppableGroup.addEventListener("dragster:leave", dragleave_handler, false);
	    // droppableGroup.addEventListener("dragenter", dragenter_handler, false);
	    // droppableGroup.addEventListener("dragleave", dragleave_handler, false);
	    droppableGroup.addEventListener("dragover", dragover_handler, false);
	    droppableGroup.addEventListener("drop", drop_handler, false);
	    
	}
	
    } // end if statment testing for body class
});
    

