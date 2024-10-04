---
theme: dashboard
title: MTA Daily Ridership Data Beginning 2020
toc: false
---

# MTA Daily Ridership Data Beginning 2020

<!-- Load and transform the data -->

```js
const mtaDailyRidershipData= FileAttachment("data/mta-daily-ridership-data-beginning-2020.json").json();
```

<!-- A shared color scale for consistency, sorted by the number of launches -->

```js
display(mtaDailyRidershipData)
```
