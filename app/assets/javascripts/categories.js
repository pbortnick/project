$(function() {
  $(".more").on('click', function() {
    if ($(this).text() == "View More") {
      $(this).text("View Less");
    } else {
      $(this).text("View More");
    };
    var id = $(this).data("id");
    if ($(this).text() == "View Less") {
      $.get("/posts/" + id + "/body", function(data) {
        // Replace text of body-id div
        $("#body-" + id).text(data);
      });
    } else {
      $.get("/posts/" + id + "/body", function(data) {
        $("#body-" + id).text(data.substring(0,27));
      });
    };
  });
});

$(function() {
  $(".view").on('click', function() {
    if ($(this).text() == "View Image") {
      $(this).text("Hide Image");
    } else {
      $(this).text("View Image");
    };
    var id = $(this).data("id");
    if ($(this).text() == "Hide Image") {
      $("#image-" + id).show();
    } else {
      $("#image-" + id).hide();
    };
  });
});
