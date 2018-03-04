---
title: "killcord alpha"
date: 2018-02-26T09:19:45-06:00
draft: true
---

Over the past three months I've been quietly working on a project that I'm really excited to share. Its still in its very early alpha phase and needs a healthy dose of vetting, testing, and refactoring, but I'm proud of the initial implementation and its a starting point an open source project that I'm exited to work on. 

### the background

I'd started casually diving into the technology behind [ethereum smart contracts](https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html) and [ipfs](https://ipfs.io/). I started wondering: 

if ethereum can run unstoppable and decentralized code and ipfs can create undeletable storage on the network, could I build a censorship resistant [deadman's switch](https://en.wikipedia.org/wiki/Dead_man%27s_switch)?

This was the birth of the idea for killcord.

### the thought experiment

Imagine you are the next Edward Snowden. You have a payload of important leaked information in the public interest that you are worried could be destroyed if you vanish. So, you want to be able to release this information to the world in the case that you are disappeared before you are able to release the information in a controlled manner. You want the public to know that you have a deadman's switch. For your adversaries, this acts as leverage. If you disappear, the information that could be damning goes public. They have an incentive to keep you alive and free to check-in. To your allies, they know where to find this information in the case that you are no longer able to check-in. The payload is accessible to the public.

This isn't a new concept on its surface. In fact, [Snowden actually used a deadman's switch](https://www.wired.com/2013/07/snowden-dead-mans-switch/). What is new is how killcord operates.

### how killcord works

killcord 