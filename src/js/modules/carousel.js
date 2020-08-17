import $ from "jquery";
window.$ = window.jQuery = $;

import "slick-carousel";

export default function () {
  $(function () {
    $(".c-homepage-location__carousel").slick({
      centerMode: true,
      centerPadding: "25%",
      slidesToShow: 1,
      dots: false,
      arrows: false,
    });
  });
}
