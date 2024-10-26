---
toc: false
---

<div class="hero">
  <h1>MTA Open Data Challenge 2024</h1>
  <h2>Welcome to our app! Here's a link to the observable documentation:</h2>
  <a href="https://observablehq.com/framework/getting-started">Get started<span style="display: inline-block; margin-left: 0.25rem;">↗︎</span></a>
</div>

---

## readme

I didn't really get a chance to work on this as much as I wanted to but I figured that I would deploy it anyways to show off what observable can do in my very unexperienced hands.

I really enjoyed how simple it was to first `curl` for data and then use `jq` as tools to get and manipulate our data without diving down into writing a bonafide script.

Although the two graphs I drew were really simple it was pretty clear that:

1. observable does make this really easy
2. data is just a blob of stuff until you visualize it and can see what is actually happening

Thanks!

- Steven Fernandez

<style>

.hero {
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: var(--sans-serif);
  margin: 4rem 0 8rem;
  text-wrap: balance;
  text-align: center;
}

.hero h1 {
  margin: 1rem 0;
  padding: 1rem 0;
  max-width: none;
  font-size: 14vw;
  font-weight: 900;
  line-height: 1;
  background: linear-gradient(30deg, var(--theme-foreground-focus), currentColor);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero h2 {
  margin: 0;
  max-width: 34em;
  font-size: 20px;
  font-style: initial;
  font-weight: 500;
  line-height: 1.5;
  color: var(--theme-foreground-muted);
}

@media (min-width: 640px) {
  .hero h1 {
    font-size: 90px;
  }
}

</style>
