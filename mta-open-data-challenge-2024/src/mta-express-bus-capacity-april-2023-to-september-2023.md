---
theme: dashboard
title: MTA Express Bus Capacity April 2023 to September 2023
toc: false
---
# MTA Express Bus Capacity April 2023 to September 2023

<!-- Load and transform the data -->

<!-- TODO: How about displaying this data using Hierarchical Edge Bundling?? -->
```js
const blob = FileAttachment("data/mta-express-bus-capacity-april-2023-to-september-2023.json").json();
```

```js
display(blob)
```

```js
const width = 1200;
const height = 1200;
const color = d3.scaleOrdinal(d3.schemeObservable10);

const svg = d3.create("svg")
    .attr("width", width)
    .attr("height", height)
    .attr("viewBox", [0, 0, width, height])
    .attr("style", "max-width: 100%; height: auto;");

const nycCoordinates = [
    [100, 200], // Staten Island
    [150, 250],
    [200, 280], // Brooklyn
    [250, 250],
    [300, 200], // Manhattan
    [350, 150],
    [400, 100], // Bronx
    [450, 150],
    [500, 200], // Queens
    [450, 250],
    [400, 300],
    [350, 350],
    [300, 300],
    [250, 350],
    [200, 300],
    [150, 350],
    [100, 300]
];

// Create a path generator
const lineGenerator = d3.line();

// Draw the NYC polygon
svg.append("path")
    .attr("d", lineGenerator(nycCoordinates))
    .attr("fill", "steelblue")
    .attr("stroke", "black");

display(svg.node());
```
