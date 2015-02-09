$(function() {
  $(".btn-toggle-lights").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    $.ajax($form.attr("action"), {
      type: "POST",
      success: function(res) {
        $(".btn-toggle-lights").toggleClass("btn-turn-on");
        $(".btn-toggle-lights").toggleClass("btn-turn-off");
        $(".light-status").children().first().toggleClass("lights-on");
        $(".light-status").children().first().toggleClass("lights-off");
        if (res.lights_on) {
          $(".light-status").children().first().text("ON");
        } else {
          $(".light-status").children().first().text("OFF");
        }
        console.log(res.lights_on);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("ERROR!!");
      }
    });
  });
});
