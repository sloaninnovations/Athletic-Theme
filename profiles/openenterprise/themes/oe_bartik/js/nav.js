(function($){
  Drupal.behaviors.menutoselect = {
    attach: function (context, settings) {
     var
     $window     = $(window),
     $document   = $(document),
     $old_nav = $('#main-menu > *'),
     $menu_links = $old_nav.find('a'),
     $new_nav, $option, $optgroup,
     showing  = 'old',
     trigger  = 767,
     timer   = null;

      // make sure the UL exists & it contains links
     if ( $old_nav.length &&
        $menu_links.length )
     {
      // now we can create the markup & assign event handlers
      $new_nav  = $('<select></select>');
      $option   = $('<option>-- Navigation --</option>')
             .appendTo($new_nav);
      $optgroup = $('<optgroup></optgroup>');

        $menu_links
        .each(function(){
         var $a = $(this);
         $option
          .clone()
          .attr( 'value', $a.attr('href') )
          .text( $a.text() )
          .appendTo( $new_nav );
        });

      $new_nav = $new_nav
             .wrap('<div id="mobile-nav"/>')
             .parent()
             .delegate('select', 'change', function(){
                var $this = $(this);
                window.location = $this.val();
             });

      // our toggle function
      function toggleDisplay()
      {
       var width = $window.width();
       if ( showing == 'old' &&
           width <= trigger )
       {
        $old_nav.replaceWith($new_nav);
        showing = 'new';
       } else if ( showing == 'new' &&
             width > trigger ) {
        $new_nav.replaceWith($old_nav);
        showing = 'old';
        }
      }
      // toggle it the first time
      toggleDisplay();

      // set up the toggle
      $window
       .resize(function(){
        if ( timer ) {
         clearTimeout(timer);
        }
        timer = setTimeout(toggleDisplay,100);
       });
     }

    }
  };
}(jQuery));