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
    ev.dataTransfer.setData("text/html", ev.target.id);
    ev.dataTransfer.effectAllowed = "move";
    console.log("Started dragging:", ev.target);
}

function dragenter_handler(ev) {
	ev.stopPropagation();
	console.log("dragenter");
	ev.target.classList.add("groupcard-dragover", "card-primary");
	console.log("Dragged Into:", ev.currentTarget);
}

function dragover_handler(ev) {
    if (contains(ev.dataTransfer.types, "text/html")) {
	ev.stopPropagation();
	// console.log("dragging over");
	ev.preventDefault();
	ev.dataTransfer.dropEffect = "move";
    }
}
	    
function dragleave_handler(ev) {
    ev.stopPropagation();
    ev.target.classList.remove("groupcard-dragover", "card-primary");
    console.log("dragging left:", ev.currentTarget);
}

function drop_handler(ev) {
    console.log("drop");
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text/html");
    var draggedElement = document.getElementById(data);
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

	var bucketOfDroppableGroups = document.querySelectorAll(".groupcard");
	console.log(bucketOfDroppableGroups);
	for (let droppableGroup of bucketOfDroppableGroups) {
	    new Dragster(droppableGroup);
	    droppableGroup.addEventListener("dragster:enter", dragenter_handler, false);
	    // droppableGroup.addEventListener("dragover", dragover_handler, false);
	    droppableGroup.addEventListener("dragend", drop_handler, false);
	    droppableGroup.addEventListener("dragster:leave", dragleave_handler, false);
	}
	
    } // end if statment testing for body class
});
    

