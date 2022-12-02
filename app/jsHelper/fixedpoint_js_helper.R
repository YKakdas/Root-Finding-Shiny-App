fixedpoint_js_logify <-
  "
// function to logify a sliderInput
function logifySlider (sliderId) {
    // scientific style
    $('#'+sliderId).data('ionRangeSlider').update({
      'prettify': function (num) { return ('10<sup>'+num+'</sup>'); }
    })
}"

fixedpoint_js_onload <-
  "
// execute upon document loading
$(document).ready(function() {
  // wait a few ms to allow other scripts to execute
  setTimeout(function() {
    // include call for each slider
    logifySlider('fixedpoint_tolerance_value')
  }, 5)})
"