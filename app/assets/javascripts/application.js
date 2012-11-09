// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


(function($){
  var checkUserOnline = {
    init: function() {
      var url = "/users/online_user.json";

      var setUserStatus = function(payload) {
        console.log(payload);
        $.each(payload, function(i) {
          $('.user-image[data-user-id=' +  payload[i].id +']').addClass(payload[i].available);
        });
      };

      var usersOnSite = $('.user-image'); //JqueryCollection
      var userIDs = [];
      $.each(usersOnSite, function(i) {
        userIDs[i] = $(this).data("user-id");
      });
      $.ajax({
        url: url,
        data: userIDs,
        success:  function(data) {
          setUserStatus(data);
        },
        error: function() { console.log("Connection Error"); }
      });
    }
  };
  $(function(){
    checkUserOnline.init();
  });
})(jQuery);



overlay = {

  build: function(innerHTML, force) {

    var calculateOverlay = function() {
      var windowHeight = $(window).height();
      var bodyHeight = $('body').height();
      
      if (bodyHeight < windowHeight) {
          overlayBackground.height(windowHeight);
      }

      var bodyWidth = $('body').width();
      var windowWidth = $(window).width();
      var overlayHeight = overlayContent.height();
      var overlayWidth = overlayContent.width();
      var minMarginTop = 30;
      var images = overlayContent.find("img, iframe");

      function set() {
        overlayContent = $(overlayBackground[0]).find('.overlay-content:first-child');
        overlayContent.css({
          top: document.documentElement.clientHeight/2 - overlayContent.height()/2,
          left: document.documentElement.clientWidth/2 - overlayContent.width()/2
        });
        if (bodyHeight < windowHeight && overlayContent.height() < windowHeight) {
          overlayBackground.height(windowHeight);
        } else if (overlayContent.height() > windowHeight) {
          overlayBackground.height((overlayContent.height() + minMarginTop) * 1.05);
          overlayContent.css({
            marginTop: 0,
            top: minMarginTop
          });
        }
        if (bodyWidth < windowWidth && overlayContent.width() < windowWidth) {
          overlayBackground.width(windowWidth);
        } else if (overlayContent.width() > windowWidth) {
          overlayBackground.width((overlayContent.width() + minMarginTop) * 1.05);
          overlayContent.css({
            marginLeft: 0,
            left: minMarginTop
          });
        }
        overlayContent.fadeIn("fast");
      }

      if (images.length !== 0 ) {
        images.on("load", function() {
          set();
        });
      }
       else {
          setTimeout(set, 1000);
        }
    }; // End of calculateOverlay;

    function registerClose() {
      overlayBackground.on('click', function(event) {
          overlay.close();
      });
      overlayContent.on('click', function(event){
        event.stopPropagation();
      });
      $(document).on('keyup', function(event) {
        if(event.keyCode == 27 ) {
          overlay.close();
        }
      });
    };


    var body = $('body').css({
      position: 'relative'
    });
    if ($('.overlay-background').length === 0) {
      var overlayBackground = $("<div />", {"class": "overlay-background"}).appendTo(body);
      var overlayContent = $("<div />", {"class": "overlay-content"}).appendTo(overlayBackground).hide();
    } else {
      var overlayBackground = $('.overlay-background');
      var overlayContent = $(overlayBackground[0]).find('.overlay-content:first-child');
    };
 

    overlayContent.html(innerHTML);
    overlayContent.find("button[data-function=closeOverlay], input[data-function=closeOverlay], a[data-function=closeOverlay]").on("click", function(e) {
      e.preventDefault();
      overlay.close(overlayBackground);
    });
    
    calculateOverlay();
    overlayBackground.css("background-image", "none");
    if (force !== true) {registerClose()};
  },

  close: function(target) {
    target = target || ".overlay-background";
    if (typeof target == 'string' || typeof target == 'object') {
      $(target).fadeOut("fast", function() {
        $(this).remove();
      });
    }
  }
};

function fitText(jquerySelector) {
  var calculateSize = function() {
    var text = $(jquerySelector);
    $.each(text, function(){
      var text = $(this).css({
        lineHeight: 0,
        overflow: "hidden"
      });
      var targetHeight = text.height();
      var targetWidth = text.width();
      // console.log(text);
      // console.log("Title " + text.html());
      // console.log("targetWidth: " + targetWidth);
      var inner = text.children('span');
      // console.log(inner + " " + inner.length);
      if (inner.length === 0 ){
        inner = $("<span />").css({
          display: "block",
          lineHeight: 1.5
        });
        text.wrapInner(inner);
        inner = text.children('span');
        inner = $(inner[0]);
        // console.log($(inner) + " " + inner.length);
      };
      var currentFontSize = parseInt(text.css("font-size"), 10);
      // console.log(inner.text());
      while (inner.height() < targetHeight) {
          currentFontSize++;
          inner.css("font-size", currentFontSize + "px");
      };
      // console.log("font-size: " + text.css("font-size") + " height: " + inner.height() + " width: " + inner.width());
      while (inner.height() > targetHeight ) { //|| inner.width() > targetWidth
        currentFontSize--;
        inner.css("font-size", currentFontSize + "px");
      };
      inner.css("word-wrap","break-word");
      // console.log("font-size: " + text.css("font-size") + " height: " + inner.height() + " width: " + inner.width());
      inner.css("padding-top", (targetHeight - inner.height())/2 + "px");
    });
  };
  calculateSize();
  setTimeout(calculateSize, 250);
  setTimeout(calculateSize, 500);
  setTimeout(calculateSize, 1000);
};
