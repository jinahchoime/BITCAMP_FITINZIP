<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.5/d3.min.js"></script>

<script>
 
window.requestAnimFrame = (function () {
    return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function (callback) {
        window.setTimeout(callback, 1000 / 60);
    };
})();
 
function newGraph() {
    var now = Date.now();
    var last = now,
        delta;
    //d3.select('svg').remove();

    var dataset = [];
    var colors = ['#FF4136', '#2ECC40', '#0074D9', '#FF851B', '#B10DC9', '#FFDC00'];
    var accent = '#DDDDDD';

    colors.forEach(function (v) {
    	console.log("v??"+v);
        var data = {
            color: v,
            amount: 1 + 10
        }
        console.log(data);

        if (Math.random() > 0.5) {
            dataset.push(data);
            console.log("dataset.push(data)"+dataset.push(data))
        } else {
            dataset.unshift(data);
        }
    });

    var width = 500,
        height = 500,
        radius = Math.min(width, height) / 2;

    var holder = d3.select("body").append("svg")
        .attr("width", width)
        .attr("height", height)
    	.attr('viewBox', '0 0 '+ width + ' ' + height)

    var svg = holder.append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

    var pie = d3.layout.pie().value(function (d) {
        return d.amount;
    });

    var offset = 0;
    var time = new Date().getTime();

    /*  Drawing Function  */

    function draw() {
        now = Date.now();
        delta = now - last;
        last = now;

        svg.remove();
        svg = holder.append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

        offset += delta * 0.0002;
        pie.startAngle(offset).endAngle((Math.PI * 2) + offset)

        var piedata = pie(dataset)
        var arc = d3.svg.arc()
            .innerRadius(radius - 150)
            .outerRadius(radius - 100);

        var path = svg.selectAll("path")
            .data(piedata)
            .enter().append("path")
            .attr("fill", function (d, i) {
            return d.data.color;
        })
            .attr("d", arc);

svg.selectAll("text").data(piedata)
            .enter()
            .append("text")
            .attr("text-anchor", "middle")
            .attr("x", function (d) {
            var a = d.startAngle + (d.endAngle - d.startAngle) / 2 - Math.PI / 2;
            d.cx = Math.cos(a) * (radius - 125);
            return d.x = Math.cos(a) * (radius - 50);
        })
            .attr("y", function (d) {
            var a = d.startAngle + (d.endAngle - d.startAngle) / 2 - Math.PI / 2;
            d.cy = Math.sin(a) * (radius - 125);
            return d.y = Math.sin(a) * (radius - 30);
        })
            .text(function (d) {
            return d.value + ' UNIT' + (d.value > 1 ? 'S' : '');
        })
            .attr('fill', accent)
            .each(function (d) {
            var bbox = this.getBBox();
            d.sx = d.x - bbox.width / 2 - 2;
            d.ox = d.x + bbox.width / 2 + 2;
            d.sy = d.oy = d.y + 5;
        });

        svg.append("defs").append("marker")
            .attr("id", "circ")
            .attr("markerWidth", 12)
            .attr("markerHeight", 12)
            .attr("refX", 6)
            .attr("refY", 6)
            .append("circle")
            .attr('fill', 'rgba(255,255,255,0.5)')
            .attr("cx", 6)
            .attr("cy", 6)
            .attr("r", 6);

svg.selectAll("path.pointer").data(piedata).enter()
            .append("path")
            .style("fill", "none")
            .style("stroke", accent)
            .attr("marker-end", "url(#circ)")
            .attr("d", function (d) {

            if (d.cx > d.ox + ((d.ox - d.oy)/2)) {
                return "M" + d.sx + "," + d.sy + "L" + d.ox + "," + d.oy + " " + d.cx + "," + d.cy;
            } else {
                return "M" + d.ox + "," + d.oy + "L" + d.sx + "," + d.sy + " " + d.cx + "," + d.cy;
            }
        });
        requestAnimFrame(draw);
    }
    requestAnimFrame(draw);
}

newGraph();
</script>
<style>
* {
    margin: 0;
    padding: 0;
}
body {
    background: black;
    text-align:center;
}
text {
    font: 20px sans-serif;
}
svg {
    width: 100vmin;
    height: 100vmin;
    display:inline-block;
}
path {
    stroke-width: 2px;
}
button{
    position:fixed;
    bottom: 0;
    left: 0;
    background: black;
    border: 2px solid white;
    padding: 1em;
    color: white;
    margin: 0.24em;
    
}
</style>
</head>
<body>
<button onclick="newGraph()">Append New Graph</button>
</body>
</html>