<html>
<body>
<head>
<script>
function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}
</script>
</head>
<h1>Mon application Web en Java</h1>
<body onload="startTime()">
Ceci est une page dynamique de chez dynamique (Jean-Michel PUCH).


<div id="txt"></div>


<% String[] phrases = {"Jean-Michel PUCH", "Qu'est-ce que tu fais la?"};
for (int i=0; i<phrases.length; i++) {
	out.println(phrases[i]);
}
%>
</html>
