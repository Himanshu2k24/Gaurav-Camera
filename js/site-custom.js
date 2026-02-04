$(window).on('load', function (e) {
    'use strict';

    $("#pageloader").delay(1200).fadeOut("slow");
    $(".loader-item").delay(700).fadeOut();

});
/* ==============================================
Custom Javascript
=============================================== */

$(document).ready(function () {
    'use strict'

    // On Scroll Animation
    //new WOW().init();


    $('[data-toggle="tooltip"]').tooltip();


    // On Scroll Header Style One
    $(function () {
        var header = $(".header-fixed"),
            yOffset = 0,
            triggerPoint = 150;
        $(window).scroll(function () {
            yOffset = $(window).scrollTop();

            if (yOffset >= triggerPoint) {
                header.addClass("fixed-top animated fadeInDown");
            } else {
                header.removeClass("fixed-top animated fadeInDown");
            }

        });
    });

    $('#search_home, .overlay-close').on("click", function ($e) {
        $e.preventDefault();
        $(".overlay").toggleClass("open");
    });

    // On Scroll Back To Top Arrow
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#mkdf-back-to-top').addClass('on');
        } else {
            $('#mkdf-back-to-top').removeClass('on');
        }
    });

    $('#mkdf-back-to-top').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 600);
        return false;
    });


    // Flickr Photostream
    // $('#basicuse').jflickrfeed({
    //     limit: 9,
    //     qstrings: {
    //         id: '52617155@N08'
    //     },
    //     itemTemplate: '<li><a href="{{image_b}}"><img src="{{image_s}}" alt="{{title}}" /></a></li>'
    // });

    // Bootstrap Collapse
    // $('.collapse').on('shown.bs.collapse', function(){
    //     $(this).parent().find(".icofont-rounded-down").removeClass("icofont-rounded-down").addClass("icofont-rounded-up");
    //     }).on('hidden.bs.collapse', function(){
    //     $(this).parent().find(".icofont-rounded-up").removeClass("icofont-rounded-up").addClass("icofont-rounded-down");
    // });

    $("#home-services-slider").owlCarousel({
        items: 2,
        margin: 0,
        loop: true,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 1,
            },
            600: {
                items: 2,
            },
            1000: {
                items: 3,
                loop: true,
            },
            1200: {
                items: 4,
                loop: true,
            }
        }
    });

    $("#shop-details").owlCarousel({
        items: 1,
        margin: 0,
        loop: true,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>']
    });


    $("#home-services").owlCarousel({
        items: 3,
        margin: 30,
        loop: true,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 2,
            },
            600: {
                items: 2,
            },
            768: {
                items: 3,
            },
            1000: {
                items: 4,
                loop: true,
            },
            1200: {
                items: 4,
                loop: true,
            }
        }
    });


    $("#home-gallery").owlCarousel({
        items: 3,
        margin: 30,
        loop: true,
        stagePadding: 100,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 2,
            },
            600: {
                items: 2,
            },
            768: {
                items: 3,
            },
            1000: {
                items: 4,
                loop: true,
            },
            1200: {
                items: 4,
                loop: true,
            }
        }
    });

    $("#home-shop-related").owlCarousel({
        items: 3,
        margin: 30,
        loop: true,
        stagePadding: 0,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 2,
            },
            600: {
                items: 2,
            },
            768: {
                items: 3,
            },
            1000: {
                items: 2,
                loop: true,
            },
            1200: {
                items: 3,
                loop: true,
            }
        }
    });

    $("#home-team").owlCarousel({
        items: 3,
        margin: 0,
        loop: true,
        nav: false,
        slideBy: 1,
        dots: true,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 2,
            },
            600: {
                items: 2,
            },
            768: {
                items: 3,
            },
            1000: {
                items: 3,
                loop: true,
            },
            1200: {
                items: 3,
                loop: true,
            }
        }
    });



    $("#home-client-testimonials").owlCarousel({
        items: 2,
        margin: 30,
        loop: true,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 1,
            },
            600: {
                items: 1,
            },
            1000: {
                items: 2,
                loop: true,
            },
            1200: {
                items: 2,
                loop: true,
            }
        }
    });

    $("#home-client-testimonials-alt").owlCarousel({
        items: 2,
        margin: 30,
        loop: true,
        nav: false,
        slideBy: 1,
        dots: true,
        center: true,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
        responsive: {
            320: {
                items: 1,
            },
            480: {
                items: 1,
            },
            600: {
                items: 2,
            },
            1000: {
                items: 3,
                loop: true,
            },
            1200: {
                items: 3,
                loop: true,
            }
        }
    });

    $("#client-testimonials-sidebar").owlCarousel({
        items: 1,
        margin: 30,
        loop: true,
        nav: false,
        slideBy: 1,
        dots: true,
        center: true,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-chevron-left"></i>', '<i class="fa fa-chevron-right"></i>'],
    });



    $("#home-client-single, #home-client-single-2").owlCarousel({
        items: 1,
        margin: 30,
        loop: true,
        nav: true,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
    });

    $("#home-clients").owlCarousel({
        items: 2,
        margin: 30,
        loop: true,
        nav: false,
        slideBy: 1,
        dots: false,
        center: false,
        autoplay: true,
        autoheight: true,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
        responsive: {
            320: {
                items: 2,
            },
            600: {
                items: 3,
            },
            767: {
                items: 4,
            },
            1000: {
                items: 4,
                loop: true,
            },
            1200: {
                items: 6,
                loop: true,
            }
        }
    });

    /* Conter */
    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });

    // Animated Skill Bars      
    $('.skillbar').appear();
    $('.skillbar').on('appear', function () {
        $(this).find('.skillbar-bar').animate({
            width: $(this).attr('data-percent')
        }, 3000);
    });

    $('.chart').appear();
    $('.chart').on('appear', function () {
        $('.chart').easyPieChart({
            easing: 'easeInSine',
            barColor: "#003975",
            lineCap: 'round',
            scaleColor: false,
            size: '100',
            onStep: function (from, to, percent) {
                $(this.el).find('.percent').text(Math.round(percent));
            }
        });
    });

    // Open Video
    jQuery('.play-video').on('click', function (e) {
        var videoContainer = jQuery('.video-box');
        videoContainer.prepend('<iframe src="http://player.vimeo.com/video/7449107" width="500" height="281" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>');
        videoContainer.fadeIn(300);
        e.preventDefault();
    });
    // Close Video
    jQuery('.close-video').on('click', function (e) {
        jQuery('.video-box').fadeOut(400, function () {
            jQuery("iframe", this).remove().fadeOut(300);
        });
    });

    $('.toggle').click(function () {
        $('.toggle').removeClass("arrow-down");

        if (!$(this).next().hasClass('show')) {
            $(this).parent().children('.collapse.show').collapse('hide');
            $(this).toggleClass('arrow-down');

        }
        $(this).next().collapse('toggle');
    });

    jQuery("#contactusForm").validate({
        meta: "validate",
        /* */
        rules: {
            name: "required",


            // simple rule, converted to {required:true}
            email: { // compound rule
                required: true,
                email: true
            },
            phone: {
                required: true,
            },
            cment: {
                required: true
            },
            subject: {
                required: true
            }
        },
        messages: {
            name: "Please enter your name.",
            lastname: "Please enter your last name.",
            email: {
                required: "Please enter emailed.",
                email: "Please enter valid email"
            },
            phone: "Please enter a phone.",
            subject: "Please enter a subject.",
            cment: "Please enter a comment."
        },
    });

    jQuery("#requestForm").validate({
        meta: "validate",
        /* */
        rules: {
            firstName: "required",
            email: {
                required: true,
                email: true
            },
            phone: {
                required: true,
            },
            cment: {
                required: true
            },
            subject: {
                required: true
            }
        },
        messages: {
            firstName: "Please enter your name.",
            email: {
                required: "Please enter emailed.",
                email: "Please enter valid email"
            },
        },
    }); /*========================================*/


    jQuery("#home_page").validate({
        meta: "validate",
        /* */
        rules: {
            name: "required",
            // simple rule, converted to {required:true}
            email: { // compound rule
                required: true,
                email: true
            },
            phone: {
                required: true,
            },
            cment: {
                required: true
            },
            subject: {
                required: true
            }
        },
        messages: {
            name: "Please enter your name.",
            lastname: "Please enter your last name.",
            email: {
                required: "Please enter emailed.",
                email: "Please enter valid email"
            },
            phone: "Please enter a phone.",
            subject: "Please enter a subject.",
            cment: "Please enter a comment."
        },
    });


    //Disable cut copy paste
    //$(document).bind('cut copy paste', function(e) {
    // e.preventDefault();
    //});

    //Disable mouse right click
    //$(document).on("contextmenu", function(e) {
    // return false;
    //});

    //function disable() {

    //document.onkeydown = function(e) {
    // return false;
    //}
    //}
    //disable();

    // document.onkeydown = function(e) {
    //if (e.ctrlKey && (e.keyCode === 67 || e.keyCode === 86 || e.keyCode === 85 || e.keyCode === 117)) { //Alt+c, Alt+v will also be disabled sadly.
    //alert('Soory, This Features is not allowed');
    //}
    //return false;
    //};


});
