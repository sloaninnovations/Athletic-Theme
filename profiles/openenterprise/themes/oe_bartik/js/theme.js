(function($){
  Drupal.behaviors.ie6hover = {
    attach: function (context, settings) {
      if ($("html").hasClass('ie6')) {
        var $scriptHover = $("#main-menu li");
        $scriptHover.hover(
          function () {
            $(this).addClass("ie6hover").children('ul').removeClass('menu');           
          },
          function () {
            $(this).removeClass("ie6hover").children('ul').addClass('menu');            
          }
        );
      }
    }
  };
}(jQuery));