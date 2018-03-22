---
title: "killcord alpha"
date: 2018-03-21T00:00:00-06:00
draft: false
---

Over the past four months I've been quietly working on a project that I'm really excited to share. Its still in its very early alpha phase and needs a healthy dose of vetting, testing, and refactoring, but I'm proud of the initial implementation and its a starting point an open source project that I'm exited to work on. 

### the background

I'd started casually diving into the technology behind [ethereum smart contracts](https://solidity.readthedocs.io/en/develop/introduction-to-smart-contracts.html) and [ipfs](https://ipfs.io/). I started wondering: 

if ethereum can run unstoppable and decentralized code and ipfs can create undeletable storage on the network, could I build a censorship resistant [deadman's switch](https://en.wikipedia.org/wiki/Dead_man%27s_switch)?

This was the birth of the idea for killcord.

### the initial thought experiment

Imagine you are the next Edward Snowden. You have a payload of important leaked information in the public interest that you are worried could be destroyed if you vanish. So, you want to be able to release this information to the world in the case that you are disappeared before you are able to release the information in a controlled manner. You want the public to know that you have a deadman's switch. For your adversaries, this acts as leverage. If you disappear, the information that could be damning goes public. They have an incentive to keep you alive and free to check-in. To your allies, they know where to find this information in the case that you are no longer able to check-in. The payload is accessible to the public.

This isn't a new concept on its surface. In fact, [Snowden actually used a deadman's switch](https://www.wired.com/2013/07/snowden-dead-mans-switch/). What is new is how killcord operates.

### public audience ipfs, ethereum, and trust models

It really comes down to trust models. The initial release of killcord specifically focuses on ***public audience disclosures***. The reason killcord uses IPFS and ethereum is due to the resiliency and anti-censorship guarantees each service offers. 

With IPFS, once data is added to the network, it is virtually undeletable, unless every node participating in seeding the data is taken off-line (or the seed is universally purged). When it comes to resiliency IPFS truly shines. In the case of killcord, you could actually run N number of IFPS nodes specifically configured to host the seed for the killcord project on a wide range of hardware, from raspberry Pis to cloud providers. As long as the location of those nodes remain hard to shut down, the IPFS storage for a killcord remains incredibly resilient. In the hypothetical Snowden example, spreading the IPFS seed nodes across multiple regions around the world, and even better, encouraging the community to seed the data as well, adds to the resiliency of the availability of the payload. You can think of IPFS as a really interesting new take on bittorrent style seeding.

Ethereum is used as a trustless state backend for the killcord project. For killcord to operate, it needs to be able to:

- authorize that only the owner or publisher accounts interact with the backend
- restrict access to specific functions of the backend to specific accounts
- keep track of the storage IPFS endpoint address
- keep track of the last check-in of the owner account
- keep track of the published decryption key

With ethereum, you can write "backend code" that is stored on the blockchain, this means that the code is wide-open to the public. It also means that variable state is recorded to the blockchain. This is useful when you need a "trustless" guarantee that the response from a `getLastCheckin` function holds the accurate answer. It also means that once a payload is uploaded to IPFS and the decryption key is recorded to the blockchain, that it can't be deleted without taking down the seed from the IPFS network and the blockchain on the ethereum network.

The autonomous part of killcord is based on the publisher tooling. This is a low privileged account that uses the backend to publish the decryption key in the case that the project owner stops checking in. Because the publisher holds the secret decryption key, as well as the credentials to access the backend, where it runs needs to be protected and resilient as well. 

Because the publisher runs privately with no external interaction, it can run from any internet connected device that can run unix. This means a publisher could run from a raspberry pi, aws lambda, a docker container on your personal computer, or in a data center in Iceland. It doesn't actually matter where it runs as long as it is trusted. Of course, the more publishers that are operating, the less likely the publisher fails. 

### whats next

So what's next with this project? Four answers to that: private audience, more storage and backend providers, easier install tools, and a GUI.

### private audience

Though killcord is designed to be as resilient as possible, very few folks will ever want or need public disclosure deadman's switch software; it will always be baked into the core of killcord. With solid initial feedback and brainstorming with folks close to me a private audience feature seems to be at the top of the list. This is the idea that instead of releasing a payload publicly, your release has a targeted audience. One could imagine this being useful for activist groups with co-organizers, business partners and investors, or passing down documents to loved ones. I think the idea is really cool and I've got some ideas on what needs to be added to killcord to make this happen, which brings me to the next topic: storage and backend options.

### storage and backend providers

With private audience features a project owner will want to identify their risk and threat models and this means that choosing a storage and backend that works best for their needs will be important. Imagine using [keybase](https://keybase.io/), [perkeep](https://perkeep.org/), [upspin](https://upspin.io/), [dropbox](https://www.dropbox.com/), or [google drive](https://en.wikipedia.org/wiki/Google_Drive) as the storage backend. Imagine using another private backend self-hosted on your own servers or on a cloud provider like aws, or even just a simple versioned state-file in github, s3. I find the idea pretty exciting and I think th existing patterns of killcord would work quite nicely with pluggable providers

### easier install tools

Though the killcord cli tool is pretty easy to install, getting a killcord project setup is still a multistep process, and getting a solid publisher in place is not trivial. I'm continuing to work on tools to make this easier to understand and simpler to deploy and maintain. 

### gui

A graphical interface was also been a common request. I hear you, and though work hasn't started on one, early ideation has. I think the first area where this could really shine is on a status page for active projects, so that will be the first graphical interface that is developed, when the time is right.

### conclusion

Working on killcord has been a lot of fun and getting feedback on a project that I've been working on under the radar has already inspired so many cool new ideas to hack on next. If you are interested in getting involved with killcord or you have feedback that you think could help the project, please reach out to me on [keybase](http://keybase.io/rjrbt) or [github](https://github.com/rjrbt).
