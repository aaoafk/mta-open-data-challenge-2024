---
theme: dashboard
title: MTA Express Bus Capacity April 2023 to September 2023
toc: false
---
# MTA Express Bus Capacity April 2023 to September 2023

<!-- Load and transform the data -->

```js
const blob = FileAttachment("data/mta-express-bus-capacity-april-2023-to-september-2023.json").json();
```

```js
display(blob)
```

```js
const world = await d3.json("https://unpkg.com/world-atlas@1/world/110m.json")
const topojson = await import("https://cdn.skypack.dev/topojson-client@3.1.0")
const nyc = {
  longitude: -74.0060,
  latitude: 40.7128
};

Plot.plot({
  width: 800,
  height: 600,
  projection: {
    type: "mercator",
    domain: {type: "Sphere"},
    rotate: [-nyc.longitude, -nyc.latitude]
  },
  marks: [
    Plot.graticule(),
    Plot.geo(d3.geoNaturalEarth1({type: "Sphere"}), {
      stroke: "gray",
      fill: "lightblue"
    }),
    Plot.geo(d3.geoNaturalEarth1(topojson.feature(world, world.objects.countries)), {
      stroke: "white",
      fill: "lightgreen"
    }),
    Plot.dot([nyc], {
      x: "longitude",
      y: "latitude",
      r: 5,
      fill: "red",
      title: "New York City"
    })
  ]
})
```
