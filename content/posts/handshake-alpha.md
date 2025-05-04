---
title: "handshake: a peculiar chat experiment"
date: 2019-04-04T21:26:27-06:00
draft: false
---

Today I'm excited to share an early prototype of a strange chat experiment that I've been quietly ~~obsessing over~~ working on. I'm calling it [handshake](https://github.com/nomasters/handshake).

Handshake is designed to be an experiment in one-time key symmetric cryptography. The tool is based on off-line and in-person initialization of communication so that all future transmissions rely exclusively on pre-shared one-time symmetric key cryptography. This is primarily a design for out-of-band communication in which communicating parties aim to mitigate potential compromises in asymmetric encryption methodology ranging from CA poisoning to reliance on trusted centralized service providers for communications technology, and it can even be used to explore patterns in post-quantum readiness.

Design goals:

- Completely off-line handshake and configuration exchange.
- No centralized user accounts.
- Ephemeral per-chat-group identities.
- User controlled **strategies** with per-chat swappable backends.
- Sane and modern cryptographic defaults.

So who is handshake for? The honest answer, up to this point, is ***me*** (and a small group of folks who I've been working through early prototypes with). But, I think we live in interesting times for this stuff. I think there are scenarios in which having ready-to-go out-of-band tooling is important. I'd love input and feedback. I'm hoping there are folks out there that would appreciate a simple-to-use tool that takes respecting privacy and security to the nth degree. That is what handshake aims to do, first and foremost. In some ways, `handshake` marries some old WW2-era ideas like [one-time pads](https://en.wikipedia.org/wiki/One-time_pad) with very modern tooling like QR codes, mobile devices, and [NaCl crypto](https://nacl.cr.yp.to/).

I guess I should also outline what `handshake` isn't designed to be:

- ***It isn't a light version of a startup idea***. The goal is free software for the sake of free software. 
- ***It isn't a revolutionary new platform***. This is designed to work today with existing technology.
- ***It isn't new crypto***. This is a novel application of applied cryptography.
- ***It isn't meant to replace more practical and flexible security-focused chat apps*** like [Keybase](https://keybase.io/), [Signal](https://www.signal.org/), [Wire](https://app.wire.com/), or [Telegram](https://telegram.org/).

It's a strange mix of low tech and high tech patterns and a novel approach to a pluggable user-defined trust model. It's not a general purpose chat tool, but it is a chat tool that takes its design guarantees very seriously.

The reference build uses a public [IPFS](https://ipfs.io/) gateway for message storage and a light-weight cryptographically signed public key value store I wrote called [hashmap server](https://hashmap.sh/) (that acts as an ephemeral, per chat, mutable rendezvous point for "latest messages"). You can read more about how all of this works in the [design docs](https://github.com/nomasters/handshake/blob/master/design-docs/handshake-core.md), or [explore the source code](https://github.com/nomasters/handshake) for the prototype, if you are so inclined.

### inspirations

There is a rich history of security focused chat tooling that has been an inspiration to `handshake`:

- [Signal](https://en.wikipedia.org/wiki/Signal_(software))
- [Ricochet](https://ricochet.im/)
- [Briar](https://briarproject.org/)
- [Pond (RIP)](https://www.imperialviolet.org/2013/11/10/pond.html)

If you are unfamiliar with any of these projects, I recommend checking them out. There is lots of great stuff in each project.

## what's next?

This project has been a fascinating journey for me so far, but it is just getting started. Here is a glimpse of what's on the horizon: 

### validating claims

I have no desire for this to be some black-box hype machine. I'd love to work with more folks in the cryptography community to review the structure and implementation of some of the tooling and help refine what we have under the hood. I'm under no illusion that a combination of ignorance and bias couldn't potentially compromise aspects of this experiment. Deeper work here would be amazing.

### a mobile app

The initial goal is to have an easy-to-use mobile app available on iOS and Android either through their app stores or as builds you can run on your own. I've been putting some serious thought into it. You can check out the [art boards here](https://github.com/nomasters/handshake/blob/master/design-docs/handshake-mobile-art-board.png).

### dead-drop support

I'd love to allow strange strategies such as running private backend services on something like a [PirateBox](https://piratebox.cc/) so that Alice and Bob could exchange messages over specific off-line dead-drop connections.

### other strange platforms

I'd love to explore some super tinfoil hat hardware that doesn't run iOS or Android but is still portable. Imagine something like this [tiny Raspberry Pi portable device by N-O-D-E](https://n-o-d-e.net/terminal_3.html), purpose built for locked-down chat tooling.

### exploring post-quantum readiness (PQR) patterns

One of the design goals for `handshake` is to be [post-quantum ready (PQR)](https://en.wikipedia.org/wiki/Post-quantum_cryptography). We are well on our way to making this claim as far as message integrity goes due to using an off-line handshake and hash-based 256-bit symmetric cryptography for messages, but we can't currently make this claim as far as the rendezvous mutable storage goes. It relies on `ed25519` signatures, which will potentially be vulnerable to a sufficiently powerful general purpose quantum computer. I'd love to get my hands on something like [SPHINCS+](https://sphincs.org/) and use an ed25519 plus SPHINCS+ multisig (a nod to what [Google is doing with NewHope + X25519](https://www.imperialviolet.org/2018/04/11/pqconftls.html)).

### metadata, opsec, and networks

Handshake has been focused specifically on the core tooling itself, not on the network layers. It is important to think about how handshake should be used with [mixnets](https://en.wikipedia.org/wiki/Mix_network), VPN tech like [WireGuard](https://www.wireguard.com/) , dead drops, and other interesting tech like [LPWAN](https://en.wikipedia.org/wiki/LPWAN) (think LoRa). Exploring the network layer is important to the larger privacy goals of handshake.

## conclusion

I'm happy to finally talk about this project publicly. It's still very much in its early stages, but I think the ideas and initial prototypes are feature complete enough to speak about intelligently. If this project sounds interesting to you, I'd love to talk to you about collaborating. I want `handshake` to be a fun project that respects everyone involved, is supportive of one another, helps elevate our skills, and allows us to show work we are passionate about for the love of making useful and interesting stuff.

I want to take a moment to thank the folks who have played a part in helping this project from the very beginning. A big thanks to [James Stanley](https://incoherency.co.uk), [Jeffrey Dorrycott](http://blog.verygoodsoftwarenotvirus.ru), and [Matt Krueger](https://github.com/rstms) for helping me think through the design before I wrote a single line of code. I'm also thankful for their feedback on early prototypes as well. Thanks again to [Jeffrey](blog.verygoodsoftwarenotvirus.ru) for his work on early unit testing for the prototype of [hashmap server](https://github.com/nomasters/hashmap). Thanks to [Connie Yu](https://keybase.io/nonlogos1) for her contributions to the demo webapp for [hashmap.sh](https://hashmap.sh) and for working with me on the design boards for the mobile app. Thanks to [Martin Whitmore](http://www.martinwhitmore.com/contact-martin/) for the logo designs.

If you are interested in providing feedback or getting involved, hit me up on [Keybase](https://keybase.io/rjrbt/) or [open an issue on GitHub](https://github.com/nomasters/handshake/issues).
