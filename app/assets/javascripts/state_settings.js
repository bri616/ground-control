$(function() {
  $(".btn-toggle-lights").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    $.ajax($form.attr("action"), {
      type: "POST",
      success: function(res) {
        $(".btn-toggle-lights").toggleClass("btn-turn-on btn-turn-off");
        $(".light-status").children().first().toggleClass("lights-on lights-off");
        if (res.lights_on) {
          $(".light-status").children().first().text("ON");
        } else {
          $(".light-status").children().first().text("OFF");
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("ERROR!!");
      }
    });
  });

  $(".btn-toggle-sound").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    $.ajax($form.attr("action"), {
      type: "POST",
      success: function(res) {
        $(".btn-toggle-sound").toggleClass("btn-turn-on-sound btn-turn-off-sound");
        $(".sound-status").children().first().toggleClass("sound-on sound-off");
        if (res.sound_on) {
          $(".sound-status").children().first().text("ON");
        } else {
          $(".sound-status").children().first().text("OFF");
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("ERROR!!");
      }
    });
  });

  $(".btn-toggle-power-off").click(function(event) {
    event.preventDefault();
    var $form = $(this).parents("form");
    $.ajax($form.attr("action"), {
      type: "POST",
      success: function(res) {
        $(".btn-toggle-power-off").toggleClass("btn-turn-on-power btn-turn-off-power");
        $(".power-status").children().first().toggleClass("power-on power-off");
        if (res.power_off) {
          $(".power-status").children().first().text("POWER OFF");
        } else {
          $(".power-status").children().first().text("REMAIN RUNNING");
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("ERROR!!");
      }
    });
  });
});
