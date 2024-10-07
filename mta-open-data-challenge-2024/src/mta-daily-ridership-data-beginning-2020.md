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

## MTA Daily Ridership Data Dots

<!-- TODO: Display markers for when COVID pandemic starts and ends -->
```js
Plot.plot({
	width: 1000,
	height: 1000,
	x: {
		type: "utc",
		label: "Date",
		domain: d3.extent(mtaDailyRidershipData, d => d.date),
		tickFormat: d3.timeFormat("%b %d, %Y")  // Format: "Mon DD, YYYY"
	},
	y: {
		tickFormat: d3.format(".2s"),  // Use SI-prefix notation (e.g., 1M for 1 million)
		ticks: 10,  // Adjust the number of ticks as needed
		domain: d3.extent(mtaDailyRidershipData, (d) => d.ster),
		interval: 5000,
		label: "Estimated Ridership"
	},
	marks: [
		Plot.tip(
			[`NYC implemented its COVID lockdown on March 23, 2020. Yet, the lockdown is partial, as non-essential workers are encouraged to work from home, while the public transit system continues to operate but with reduced schedules. Only after May 6, 2020, the subway system is shut down daily during 1–5 AM for cleaning`],
			{x: new Date("2020-03-23"), dx: 40, anchor: "bottom"}
		),
		Plot.tip(
			[`Phase 1 of the Four-phase reopening plan for New York State is met by New York City. `],
			{x: new Date("2020-06-08"), dx: 80, anchor: "top"}
		),
		Plot.dot(mtaDailyRidershipData, {x: "date", y: "ster", tip: true}),
	]
})
```

## MTA Daily Ridership Data Line

```js
Plot.plot({
	width: 1000,
	height: 1000,
	x: {
		type: "utc",
		label: "Date",
		domain: d3.extent(mtaDailyRidershipData, d => d.date),
		tickFormat: d3.timeFormat("%b, %Y") // Format: "Month, YYYY"
	},
	y: {
		tickFormat: d3.format(".2s"),  // Use SI-prefix notation (e.g., 1M for 1 million)
		ticks: 10,  // Adjust the number of ticks as needed
		domain: d3.extent(mtaDailyRidershipData, (d) => d.ster),
		interval: 5000,
		label: "Subway total Estimated Ridership"
	},
	marks: [
		Plot.line(mtaDailyRidershipData, {x: "date", y: "ster"})
	]
})
```