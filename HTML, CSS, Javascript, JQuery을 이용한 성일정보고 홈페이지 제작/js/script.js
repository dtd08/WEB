$(".main-menu > li").mouseover(function () {
    $(this).children(".sub").stop().slideDown();
});
$(".main-menu > li").mouseleave(function () {
    $(this).children(".sub").stop().slideUp();
});

start();

let imgs = 5;
let now = 0;

function start() {
    now = now == imgs ? 0 : now + 1;
    setInterval
}
