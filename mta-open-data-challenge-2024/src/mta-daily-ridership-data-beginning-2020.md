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

```js
display(mtaDailyRidershipData)
```

```js
Plot.line(mtaDailyRidershipData.map((d) => [d.date, d.ster])).plot()
```
