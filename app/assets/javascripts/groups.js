// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function handleDragStart(e) {
  this.style.opacity = '0.4';  // this / e.target is the source node.
}

var cols = document.querySelectorAll('#kids_div .kid_card');
[].forEach.call(cols, function(col) {
  col.addEventListener('dragstart', handleDragStart, false);
});
