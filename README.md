# MTA Open Data Challenge 2024

## Setup

You should make sure that you have all of the dependencies
installed. The instructions for downloading these packages will vary
by operating system.

All you really need for this is a package manager for javascript;
there are different choices for that:

1. `yarn`
2. `pnpm`
3. `npm`
4. `bun`

Whatever flavor of package manager you use just run the following
commands after cloning the repo

```bash
cd mta-open-data-challenge-2024
pnpm install # if you're using pnpm
yarn install # if you're using yarn
npm install # if you're using npm
bun install # if you're using bun
```
After installing the dependencies you can initialize a local version
of the web application with:

```bash
pnpm dev # if you're using pnpm
yarn dev # if you're using yarn
npm dev # if you're using npm
bun dev # if you're using bun
```

Then navigate to `http://127.0.0.1:3000/` and you should see the local
version of the web application running on your machine!
