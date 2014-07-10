  $(document).ready(function () {

    $('.navbar-collapse').on('show.bs.collapse', function() {
      $(".dropdown-normal").addClass("open");
    });

    $('.navbar-collapse').on('hide.bs.collapse', function() {
      $(".dropdown-normal").removeClass("open");
    });

    $('.navbar-nav li.dropdown').mouseover(function() {
      $(this).addClass("open");
    });

    $('.navbar-nav li.dropdown').mouseout(function() {
      $(this).removeClass("open");
    });

    $('#content').fitVids();

  });