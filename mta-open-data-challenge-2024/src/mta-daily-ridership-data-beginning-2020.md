---
theme: dashboard
title: MTA Daily Ridership Data Beginning 2020
toc: false
---

# MTA Daily Ridership Data Beginning 2020

<!-- Load and transform the data -->

```js
const mtaDailyRidershipData = FileAttachment("data/mta-daily-ridership-data-beginning-2020.json").json();
```

<!-- Uncomment to display the Array(Objects) -->
<!-- ```js -->
<!-- display(mtaDailyRidershipData) -->
<!-- ``` -->

## MTA Daily Ridership Data as a line

<!-- TODO: this doesn't really make sense to display as a line chart -->
<!-- it should definitely be visualized in some other way -->
```js
Plot.plot({
	width: 1000,
	height: 1000,
	x: {
		type: "utc",
		label: "Date",
		domain: d3.extent(mtaDailyRidershipData, d => d.date),
		tickFormat: d3.timeFormat("%b %d, %Y"),  // Format: "Mon DD, YYYY"
		ticks: d3.timeDay.every(7)  // Show ticks every 7 days
	},
	y: {
		tickFormat: d3.format(".2s"),  // Use SI-prefix notation (e.g., 1M for 1 million)
		ticks: 10,  // Adjust the number of ticks as needed
		domain: d3.extent(mtaDailyRidershipData, (d) => d.ster),
		interval: 5000,
		label: "Subway total Estimated Ridership"
	},
	marks: [
		Plot.dot(mtaDailyRidershipData, {x: "date", y: "ster"})
	]
})
```
