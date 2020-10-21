function ani() {
    $(".ban").not(":animated").animate({"margin-left":"-1920px"},500, function(){
        $(".ban li").eq(0).appendTo(".ban");
        $(".ban").css("margin-left","0");
    });
}
var intv = setInterval(function(){ ani(); }, 4000);
