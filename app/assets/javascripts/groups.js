// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function dragstart_handler(ev) {
    console.log("dragstart");
    ev.dataTransfer.setData("text/html", ev.target.id);
    ev.dataTransfer.effectAllowed = "move";
}

function dragover_handler(ev) {
    ev.preventDefault();
    ev.dataTransfer.dropEffect = "move";
}

function drop_handler(ev) {
    ev.preventDefault();

    var data = ev.dataTransfer.getData("text/html");
    console.log("dropped");
}
