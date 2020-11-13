if (!$.getScript) {
	var script=document.createElement("script")
	script.type="text/javascript"
	script.src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"
	document.getElementsByTagName("head")[0].appendChild(script)
}

$("head").empty()
$("body").empty()
$("body").append('<div class="sly-sample"><div class="sly-d3-1"></div><div class="sly-d3-2"></div></div>')
$("body").append('<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>')
$("body").append('<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/lodash@4.17.20/lodash.min.js"></script>')
$("body").append('<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/d3@6.2.0/dist/d3.min.js"></script>')
$(".sly-lodash"). css({width:"320",height:"320",float:"right"});
$(".sly-sample").css({
    "border": "2px dashed #3f51b5",
    "width": "650px",
    "height": "360px",
    "padding": "2px",
});
$(".sly-d3-1").css({
    "border": "2px solid #F44336",
    "width": "320px",
    "height": "320px",
});
$(".sly-d3-2").css({
    "border": "2px solid #F44336",
    "width": "320px",
    "height": "320px",
});

